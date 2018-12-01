(load "std.scm")

(define (unique-pairs n)
    (flatmap 
        (lambda (i)
            (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

(define (prime? n)
    (define (check x)
        (cond ((= x 1) true)
            ((= (remainder n x) 0) false)
            (else (check (- x 1)))))
    (check (floor (sqrt n))))

(define (pair-sum p)
    (+ (car p) (cadr p)))

(define (prime-sum-pairs n)
    (map (lambda (p) (cons (pair-sum p) p))
        (filter (lambda (p) (prime? (pair-sum p)))
            (unique-pairs n))))