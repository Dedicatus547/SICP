#lang racket
(define (same-parity x . y)
  (define (ite it res)
    (cond ((null? it) res)
          ((= (remainder (+ x (car it)) 2) 0)
           (ite (cdr it) (cons (car it) res)))
          (else (ite (cdr it) res))))
  (cons x (reverse (ite y '()))))

          