(load "accumulate.scm")

(define (hornor-eval x coefficient-seqence)
    (accumulate 
        (lambda (this-coeff higher-terms)
            (+ this-coeff (* x higher-terms)))
        0 coefficient-seqence))