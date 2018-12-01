(load "std.scm")

(define (unique-triad n)
    (flatmap 
        (lambda (i)
            (flatmap
                (lambda (j)
                    (map 
                        (lambda (k) (list i j k))
                        (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

(define (triad-sum t)
    (+ (car t) (cadr t) (caddr t)))

(define (triad-sum-eq n s)
    (filter (lambda (t) (= (triad-sum t) s))
        (unique-triad n)))