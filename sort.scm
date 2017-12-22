(define (filter predicate sequence)
    (cond ((null? sequence) (list))
          ((predicate (car sequence)) 
            (cons (car sequence) 
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

(define (sort sequence)
    (if (null? sequence)
        (list)
        (let ((casq (car sequence))
              (cdsq (cdr sequence)))
            (let ((left (filter (lambda (x) (< x casq)) cdsq))
                  (mid (filter (lambda (x) (= x casq)) cdsq))
                  (right (filter (lambda (x) (> x casq)) cdsq)))
                (append (sort left) (cons casq mid) (sort right))))))