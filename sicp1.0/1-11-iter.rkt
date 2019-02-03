#lang racket/base
(define (f n)
   (if (< n 3)
       n
      (f-iter 0 1 2 (- n 3))))

(define (f-iter a b c counter)
      (if (= counter 0)
          (+ a b c)
          (f-iter b c (+ a b c) (- counter 1))))

(f 8)
