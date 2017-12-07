(define (reverse-map f lst)
    (define (ite it itv)
        (if (null? it)
            itv
            (ite (cdr it) (cons (f (car it)) itv))))
    (ite lst '()))

(define (deep-reverse x)
    (reverse-map 
        (lambda (sub) 
            (if (pair? sub)
                (deep-reverse sub)
                sub))
        x))