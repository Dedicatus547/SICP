#lang racket
(define (n-times obj n cp i)
  (define (exp ite res x)
    (cond ((= ite 0) res)
          ((= (remainder ite 2) 0)
           (exp (/ ite 2) res (cp x x)))
          (else (exp (- ite 1) (cp res x) x))))
  (exp n i obj))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (n-times f n compose (lambda (x) x)))

