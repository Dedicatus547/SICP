#lang racket
(define (expmod base exp m)
  (define (iter a b n m)
    (cond ((= n 0) a)
          ((= (remainder n 2) 0)
           (iter a (remainder (* b b) m) (/ n 2) m))
          (else (iter (remainder (* a b) m) b (- n 1) m))))
  (iter 1 base exp m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))