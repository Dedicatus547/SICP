#lang racket
(define (miller-rabin n)
  (define (expmod a b exp m)
    (cond ((= exp 0) a)
          ((= (remainder exp 2) 0)
           (let ((sqb (* b b)))
             (if (and (> b 1) (< b (- n 1))
                      (= (remainder sqb n) 1)) 0
                 (expmod a (remainder sqb m) (/ exp 2) m))))
          (else (expmod (remainder (* a b) m) b (- exp 1) m))))
  (define (try-it a)
    (= (expmod 1 a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin n) (fast-prime? n (- times 1)))
        (else false)))