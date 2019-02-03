#lang racket/base
(define (make-account balance . passw)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Недостаточно денег на счете"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (badpassw x) "Неа!" )
    (define (dispatch m . n)
        (if (equal? passw n)
            (cond ((equal? m 'withdraw) withdraw)
                  ((equal? m 'deposit) deposit)
                  (else (error "Неизвестный вызов -- MAKE-ACCOUNT" m)))
            badpassw))
    dispatch)

(define acc (make-account 100 'bla))

((acc 'withdraw 'bla) 50)
((acc 'withdraw 'bla) 51)

(define bcc (make-account 10 'b))
((bcc 'withdraw 'b) 5)

((acc 'withdraw 'bla) 5)