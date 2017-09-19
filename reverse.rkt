#lang racket
(define (last-pair lst)
  (if (null? (cdr lst))
      (car lst)
      (last-pair (cdr lst))))

(define (reverse lst)
  (define (ite it ret)
    (if (null? it) ret
        (ite (cdr it) (cons (car it) ret))))
  (ite lst '()))
