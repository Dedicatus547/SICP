#lang racket
(define (fib n)
  (define (fib-x p q a b count)
    (cond ((= count 0) b)
          ((= (remainder count 2) 0)
           (fib-x (+ (* p p)
                     (* 2 p q))
                  (+ (* p p) (* q q))
                  a b
                  (/ count 2)))
          (else (fib-x p q
                       (+ (* (+ p q) a) (* p b))
                       (+ (* p a) (* q b))
                       (- count 1)))))
  (fib-x 1 0 1 0 n))