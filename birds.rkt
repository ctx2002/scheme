#lang racket
#|
  A combinator is just a lambda expression with no free variables
  Identity bird since its response is that same (identical) bird.
|#
(define identity_bird
  (lambda (bird)
    bird))
#|
its response is the same as that bird's response to itself
|#
(define mockingbird
  (lambda(bird)
    bird
    bird))

(define mo
  (lambda (bird)
    (apply bird bird)))
(define my_add 
  (lambda (x y)
    (+ x y)))
(identity_bird 'hello)
((identity_bird my_add) 2 3)
(mockingbird 'hello)
((mockingbird my_add) 2 3)
(mo my_add)