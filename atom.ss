#lang racket
(define atom?
 (lambda (x)
   (and (not (pair? x)) (not (null? x)))))
(atom? (vector 1 2 3))