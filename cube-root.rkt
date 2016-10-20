#lang racket

(define (cube-root x)
  (define (cube-root-ex guess last)
    (if (< (abs (- guess last)) 0.000001)
        guess
        (cube-root-ex (improve guess) guess)))
  (define (improve y)
    (/ (+ (/ x (* y y))
          (* 2 y))
       3))
  (define (abs y)
    (if (< y 0)
        (- y)
        y))
  (cube-root-ex 1.0 2.0))

