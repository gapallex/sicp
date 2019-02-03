#lang racket/base

(define (no-more? x) 
    (null? x))

(define (first-denomination x) (car x))

(define (except-first-denomination x)
    (cdr x))




(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount (except-first-denomination coin-values))
          (cc (- amount (first-denomination coin-values))
                                              coin-values)))))

(define us-coins (list 1 5 10 25 50))

(cc 100 us-coins) 
