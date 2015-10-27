#lang racket
(define (isLeapYear year) 
  (cond
    [(not (equal? (modulo year 4) 0)) #f]
    [(not (equal? (modulo year 100) 0)) #t]
    [(not (equal? (modulo year 400) 0)) #f]
    [else #t]))

(isLeapYear 1980)