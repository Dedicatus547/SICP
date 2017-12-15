(define (square-tree tree)
    (map 
        (lambda (lst) 
            (if (pair? lst)
                (square-tree lst)
                (* lst lst))) 
        tree))

(define (square-tree-ex tree)
    (cond ((null? tree) (list))
          ((pair? tree) (cons (square-tree-ex (car tree))
                              (square-tree-ex (cdr tree))))
          (else (* tree tree))))