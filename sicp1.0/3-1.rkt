#lang racket/base
(define (make-acc balance)
    (define (accumulator add-to-balance)
        (begin (set! balance (+ balance add-to-balance))
                balance))
    accumulator)

(define A (make-acc 5))
(A 100)
(A 100)
