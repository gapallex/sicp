#lang racket/base

(define (make-s s e) (cons s e))
(define (start-s x) (car x))
(define (end-s x) (cdr x))

(define (make-p x y) (cons x y))
(define (x-p x) (car x))
(define (y-p x) (cdr x))

(define (midp-s z)
    (make-p (/ (+ (x-p (start-s z)) (x-p (end-s z))) 2.0)
            (/ (+ (y-p (start-s z)) (y-p (end-s z))) 2.0)))

(define (print-point p)
(newline)
(display "(")
(display (x-p p))
(display ",")
(display (y-p p))
(display ")"))

(define p (make-s (make-p 3 4) (make-p 4 5)))


(print-point (midp-s p))
