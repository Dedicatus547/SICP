#lang racket
(define (sum term a next b)
  (define (iter count a)
    (if (> a b)
        count
        (iter (+ (term a) count)
              (next a))))
  (iter 0 a))