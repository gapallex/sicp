#lang racket/base
(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
        (encode (cdr message) tree))))

(define (encode-symbol sym tree)
    (cond ((leaf? tree) '())
          ((element-of-set? sym (symbols (right-branch tree)))
                cons 1 (encode-symbol sym (right-branch tree)))
          ((element-of-set? sym (symbols (left-branch tree)))
                cons 0 (encode-symbol sym (left-branch tree)))
          (else (error "плохой символ -- CHOOSE-BRANCH" sym))))



(define (element-of-set? x set)
    (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))


(define (make-leaf symbol weight)
    (list 'leaf symbol weight))
(define (leaf? object)
    (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
    (list left
            right
            (append (symbols left) (symbols right))
            (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
    (if (leaf? tree)
        (list (symbol-leaf tree))
        (caddr tree)))
(define (weight tree)
    (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))


(define sample-tree
    (make-code-tree (make-leaf 'A 4)
    (make-code-tree
    (make-leaf 'B 2)
    (make-code-tree (make-leaf 'D 1)
    (make-leaf 'C 1)))))

;(encode (list 'A 'D 'A 'B 'B 'C 'A) sample-tree)

;(element-of-set? (car (list 'A)) (symbols (right-branch sample-tree)))

(encode-symbol 'A sample-tree)

;(leaf? sample-tree)

; #мысль правильная, но гдето ошибка
