#lang racket/base
(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good-enough? guess prev-guess)
  (< (abs (- prev-guess guess)) 0.00001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x) (* x x))

(define (sqrt x) 
  (sqrt-iter 1.0 0 x))

(sqrt 0.01)
