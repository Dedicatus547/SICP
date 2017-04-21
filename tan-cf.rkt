#lang racket
(define (tan-cf x k)
  (define xx (* x x))
  (define (iter i ret)
    (if (= i 1) (/ x ret)
        (iter (- i 1)
              (- (- (* i 2) 3)
                 (/ xx ret)))))
  (iter k 1))