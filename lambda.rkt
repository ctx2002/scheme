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

(define identity 
  lambda (x)
  x)

(define self_apply
  (lambda (s)
    (s s)))

(define apply
  (lambda (func)
    (lambda (arg)
      (func arg))))

; build an identity function base on self_apply function
(define identity2
  (lambda (x)
    ((apply identity)
     x)))


;now we need to resolve this lzero
((lzero  add1) 0)
((lone  add1) 0)
((ltwo  add1) 0)
((lone lsuccessor) lone)