#lang racket
(define (cont-frac-a n d k)
  (define (iter i)
    (if (> i k) 0
        (/ (n i)
           (+ (d i)
              (iter (+ i 1))))))
  (iter 1))

(define (cont-frac-b n d k)
  (define (iter i result)
    (if (> i 0)
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))
        result))
  (iter k 0))
