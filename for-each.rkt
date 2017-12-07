#lang racket
(define (for-each fun lst)
  (cond ((not (null? lst))
         (fun (car lst))
         (for-each fun (cdr lst)))))

