#lang racket
(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
         (sum term (next a) next b))))
(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (* (/ h 3)
       (+ (f a) (f (+ a (* n h)))
          (sum (lambda (k) (* (f (+ a (* k h)))
                              (+ (* 2 (remainder k 2)) 2)))
               1
               (lambda (k) (+ k 1))
               (- n 1))))))