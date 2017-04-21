#lang racket
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next) next
          (try next))))
  (try first-guess))

(define (fff x)
  (/ (log 1000) (log x)))

(fixed-point fff 3)
(fixed-point (lambda (x) (/ (+ (fff x) x) 2)) 3)
