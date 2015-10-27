#lang racket

(provide is-even?)
(provide is-odd?)

(define is-even? 
  (lambda (n) 
    (if (= n 0) #t
         (is-odd? (- n 1)))))

(define is-odd?
  (lambda (n)
    (if (= n 0) #f
        (is-even? (- n 1)))))