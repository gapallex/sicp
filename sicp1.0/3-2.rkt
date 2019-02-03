#lang racket/base
(define (make-monitored f)
    (let ((counter 0))
    (define (dispatch m)
        (cond ((eq? m 'how-many-calls) counter)
              ((eq? m 'reset-count)
                (begin (set! counter 0)
                        counter))
              (else (begin (set! counter (+ 1 counter))
                           (f m)))))
    dispatch))

(define s (make-monitored sqrt))


(s (s 1000))
(s 'how-many-calls)
(s 'reset-count)
(s (s 1000))
(s 'how-many-calls)
