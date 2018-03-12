(define (fold-right op ini seq)
    (if (null? seq)
        ini
        (op (car seq) 
            (fold-right op ini (cdr seq)))))

(define (fold-left op ini seq)
    (define (iter seq res)
        (if (null? seq)
            res
            (iter (cdr seq) (op res (car seq)))))
    (iter seq ini))

(define (reverse-r seq)
    (fold-right (lambda (x y) (append y (list x))) (list) seq))

(define (reverse-l seq)
    (fold-left (lambda (x y) (cons y x)) (list) seq))