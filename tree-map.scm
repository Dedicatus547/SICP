(define (tree-map f tree)
    (map 
        (lambda (lst) 
            (if (pair? lst)
                (tree-map f lst)
                (f lst)))
        tree))