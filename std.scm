(define (accumulate op ini seq)
    (if (null? seq)
        ini
        (op (car seq)
            (accumulate op ini (cdr seq)))))

(define (enumerate-interval low high)
    (define (iter res ceil)
        (if (< ceil low)
            res
            (iter (cons ceil res) (- ceil 1))))
    (iter (list) high))

(define (flatmap proc seq)
    (accumulate append (list) (map proc seq)))

(define (enumerate-tree tree)
    (cond ((null? tree) (list))
            ((pair? tree) 
                (append
                    (enumerate-tree (car tree))
                    (enumerate-tree (cdr tree))))
            (else (list tree))))