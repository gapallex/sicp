#lang racket/base
(define (element-of-set? x set)
      (cond ((null? set) #f)
            ((equal? x (car set)) #t)
            (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((and (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
                (union-set (cdr set1) set2))
          (else (cons (car set1) (union-set (cdr set1) set2)))))

(union-set (list 1 3 5 6 7 8) (list 2 4 6 7 9))