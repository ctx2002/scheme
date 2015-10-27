#lang racket
;Top-Level Definitions
(define double-any
  (lambda (f x)
    (f x x)))

#|
  As suggested above, top-level definitions 
  may be shadowed by let or lambda bindings
|#
(define xyz '(x y z))
;let xyz shadowed top-level xyz
(let ([xyz '(z y x)])
  xyz)

;GST
(define gst 
  (lambda (x) (* x 1.15)))

(double-any + 12)
(double-any cons "hello")
(xyz)