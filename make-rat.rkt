#lang racket
(define (gcd x y)
  (cond ((< x y) (gcd y x))
        ((= y 0) x)
        (else (gcd y (remainder x y)))))

(define (abs x) (if (< x 0) (* -1 x) x))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
        (c (if (< d 0) -1 1)))
    (cons (* c (/ n g)) (* c (/ d g)))))