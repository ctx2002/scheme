#lang racket
(define lzero
  (lambda (x)
    (lambda (y)
      y)))

(define lone
  (lambda(s)
    (lambda(z)
      (s z))))

(define ltwo
  (lambda (f)
    (lambda (a)
      (f (f a)))))

(define lsuccessor
  (lambda (a)
    (lambda (b)
      (lambda (c)
        (b ((a b) c))))))
;now we need to resolve this lzero
((lzero  add1) 0)
((lone  add1) 0)
((ltwo  add1) 0)
((lzero lsuccessor) 5)