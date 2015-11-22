#lang racket
(require racket/trace)
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

(define select_second
  (lambda (first)
    (lambda (second)
      second)))

(define make_pair
  (lambda (first)
    (lambda (second)
      (lambda (func)
        ((func first)
         second)))))

(define make_triplet
  (lambda (first)
    (lambda (second)
      (lambda (third)
        (lambda (func)
          (((func first)
          second) third))))))

(define select_first_3
  (lambda (first)
    (lambda (second)
      (lambda (third)
        first))))

(define condi
  (lambda (e1)
    (lambda (e2)
      (lambda (c)
        ((c e1) e2)))))

(define true select_first)
(define false select_second)

(define not 
  (lambda (x)
    ((x false) true)))

(define and
  (lambda (x)
    (lambda (y)
      ((x y) false))))

(define or
  (lambda (x)
    (lambda (y)
      ((x true) y))))

(define zero identity)

(define succ
  (lambda (n)
    (lambda (s)
      ((s false) n))))

(define iszero
  (lambda (n)
    (n select_first)))

(succ zero)

((or true) false)
((and true) false)

(not false)

((((make_triplet identity2) apply) identity) select_first_3)

(((make_pair identity) apply) select_first)


((select_first identity) apply)
(identity2 add1)
;now we need to resolve this lzero
((lzero  add1) 0)
((lone  add1) 0)
((ltwo  add1) 0)
((lone lsuccessor) lone)