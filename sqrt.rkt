#lang racket

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (define (sqrtex guess last)
    (if (< (abs (- guess last)) 0.000001)
        guess
        (sqrtex (improve guess) guess)))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (sqrtex 1.0 2.0))
