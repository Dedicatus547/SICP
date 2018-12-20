(load "Graphic-Language.scm")

(define (flip-horiz painter)
    (transform-painter painter
        (make-vect 1.0 0.0)
        (make-vect 0.0 0.0)
        (make-vect 1.0 1.0)))

(define (rotate-90 painter)
    (transform-painter painter
        (make-vect 1.0 0.0)
        (make-vect 1.0 1.0)
        (make-vect 0.0 0.0)))

(define (rotate-180 painter)
    (transform-painter painter
        (make-vect 1.0 1.0)
        (make-vect 0.0 1.0)
        (make-vect 1.0 0.0)))

(define (rotate-270 painter)
    (transform-painter painter
        (make-vect 0.0 0.1)
        (make-vect 0.0 0.0)
        (make-vect 1.0 1.0)))

(define (beside painter1 painter2)
    (let ((split-point (make-vect 0.5 0.0)))
        (let ((painter-left
                    (transform-painter painter1
                        (make-vect 0.0 0.0)
                        split-point
                        (make-vect 0.0 0.1)))
                (painter-right
                    (transform-painter painter2
                        split-point
                        (make-vect 1.0 0.0)
                        (make-vect 0.5 1.0))))
            (lambda (frame) (painter-left frame) (painter-right frame)))))

(define (below1 painter1 painter2)
    (let ((split-point (make-vect 0.0 0.5)))
        (let ((painter-up
                    (transform-painter painter2
                        split-point
                        (make-vect 1.0 0.5)
                        (make-vect 0.0 1.0)))
                (painter-down
                    (transform-painter painter1
                        (make-vect 0.0 0.0)
                        (make-vect 1.0 0.0)
                        split-point)))
            (lambda (frame) (painter-up frame) (painter-down frame)))))

(define (below2 painter1 painter2)
    (rotate-90
        (beside
            (rotate-270 painter1)
            (rotate-270 painter2))))