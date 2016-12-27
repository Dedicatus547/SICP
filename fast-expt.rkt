#lang racket
(define (fast-expt b n)
  (define (fa a b n)
    (cond ((= n 0) a)
          ((= (remainder n 2) 0) (fa a (* b b) (/ n 2)))
          (else (fa (* a b) b (- n 1)))))
  (fa 1 b n))