#lang racket/base
(define (element-of-set? x set)
      (cond ((null? set) #f)
            ((equal? x (car set)) #t)
            (else (element-of-set? x (cdr set)))))

(define (make-account balance passw)
    (set! passw (cons passw '()))
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Недостаточно денег на счете"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (badpassw x) "Неа!" )
    (define (addpassw z)
        (if (element-of-set? z passw)
            dispatch
            (set! passw (cons z passw))))
    (define (dispatch m n)
        (if (element-of-set? n passw)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  ((eq? m 'addpassw) addpassw)
                  (else (error "Неизвестный вызов -- MAKE-ACCOUNT" m)))
            badpassw))
    dispatch)

    (define petr (make-account 100 'bla))

    ((petr 'withdraw 'bla) 50)

    (define (make-joint init-acc init-acc-passw new-acc-passw)
        ((init-acc 'addpassw  init-acc-passw) new-acc-passw))
    
    (define paul (make-joint petr 'bla 'blabla))

    ((paul 'withdraw 'blabla) 40)
    
