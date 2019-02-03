#lang racket/base

(define (even? n)
  (= (remainder n 2) 0))

(define (parity predicate a b)
    (cond ((null? a) b)
          ((predicate (car a)) (parity predicate (cdr a) (cons b (car a))))
          (else (parity predicate (cdr a) b))))

(define (same-parity x . z)
    (if (null? x)
        0
        (if (even? x)
            (parity even? z (list))
            (parity (not (even?)) z (list)))))

(same-parity 1 2 3 4 5 6 7)


