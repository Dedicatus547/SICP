#lang racket
(define (accumulate combiner
                    null-value
                    term
                    a
                    next
                    b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a)
                        result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (* (/ h 3)
       (+ (f a) (f (+ a (* n h)))
          (sum (lambda (k) (* (f (+ a (* k h)))
                              (+ (* 2 (remainder k 2)) 2)))
               1
               (lambda (k) (+ k 1))
               (- n 1))))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (* 4
     (product (lambda (x)
                (let ((mid (+ (* x 2) 1)))
                  (* (/ (- mid 1) mid)
                     (/ (+ mid 1) mid))))
              1
              (lambda (x) (+ x 1))
              n)))