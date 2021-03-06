(define (fringe tree)
    (cond ((null? tree) (list))
        ((pair? tree) (append (fringe (car tree))
                              (fringe (cdr tree))))
        (else (list tree))))