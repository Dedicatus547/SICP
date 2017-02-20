#lang racket
(define (filtered-accumulate filter
                             combiner
                             null-value
                             term
                             a
                             next
                             b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a)
                            (combiner (term a)
                                      result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (phi n)
  (filtered-accumulate (lambda (x)
                         (if (= (GCD n x) 1)
                             true false))
                       *
                       1
                       (lambda (x) x)
                       2
                       (lambda (x) (+ x 1))
                       (- n 1)))

(define (GCD a b)
  (if (= b 0) a
      (GCD b (remainder a b))))
          
    