#lang racket/base
(define (exp b n)
  (f-e-iter b n 1))

(define (f-e-iter b n x)
  (if (= n 0)
      x
      (if (even? n)
          (f-e-iter (square b) (/ n 2) x)
          (f-e-iter b (- n 1) (* x b)))))

(define (even? n)
  (= (remainder n 2) 0))
  
(define (square n) (* n n))
  
(exp 2 9)
