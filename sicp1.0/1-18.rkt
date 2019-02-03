#lang racket/base
(define (* b n)
  (f-sum-iter b n 0))

(define (f-sum-iter b n x)
  (if (= n 0)
      x
      (if (even? n)
          (f-sum-iter (double b) (halve n) x)
          (f-sum-iter b (- n 1) (+ b x)))))
  
(define (even? n)
  (= (remainder n 2) 0))
  
(define (halve n) (/ n 2))

(define (double n) (+ n n))

(* 2 1)
