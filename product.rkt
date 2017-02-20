#lang racket
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))
(define (factorial n)
  (* 4
     (product (lambda (x)
                (let ((mid (+ (* x 2) 1)))
                  (* (/ (- mid 1) mid)
                     (/ (+ mid 1) mid))))
              1
              (lambda (x) (+ x 1))
              n)))