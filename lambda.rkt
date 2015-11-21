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
  (lambda (x)
  x))

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

#|
We  can  use  the  function  application  function  to  define  
a  function  with  the  same  effect as  the  function  application
function itself.

apply is the function application function

(apply <function>) ==
(λf.λa.(f a) <function>) =>λa.(<function> a)
|#

#|
select first
|#

(define select_first
  (lambda (first)
    (lambda (second)
      first)))


((select_first identity) apply)
(identity2 add1)
;now we need to resolve this lzero
((lzero  add1) 0)
((lone  add1) 0)
((ltwo  add1) 0)
((lone lsuccessor) lone)