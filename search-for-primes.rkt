#lang scheme/load
(load "SICP/time-test.rkt")

(define (next-num n)
  (if (= (remainder n 2) 0)
      (+ n 1)
      (+ n 2)))
(define (search-for-primes n)
  (if (= (remainder n 2) 0)
      (search-for-primes (next-num n))
      (if (= (timed-prime-test n) -1)
          (search-for-primes (next-num n)) 0)))