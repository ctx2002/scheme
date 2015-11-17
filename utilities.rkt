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

;Tax rate exlude Acc earners's levy
(define tax-exclude-acc 
  (lambda (x) 
    (cond[(< x 0) 0]
         [(= x 0) 0]
         [(and (> x 0) (<= x 14000)) (* 0.105 x)]
         [(and (>= x 14001) (<= x 48000)) (+ (* 0.175 (- x 14000)) (tax-exclude-acc (- x (- x 14000))))]
         [(and (>= x 48001) (<= x 70000)) (+ (* 0.3 (- x 48000)) (tax-exclude-acc (- x (- x 48000))))]
         [else (+ (* 0.33 (- x 70000)) (tax-exclude-acc (- x (- x 70000))))])))
#|
According to the Joy of Cooking, candy syrups should be cooked 1 degree cooler than
listed in the recipe for each 500 feet of elevation above sea level.
|#
(define candy-temperature
  (lambda (degree feet)
    (cond[(< feet 500) (- degree 0)]
         [else (candy-temperature (- degree 1) (- feet 500))])))

;absolute value
(define puzzle2
  (lambda (x)
    ((if (< x 0)
         -
         +)
     0 x)))

(puzzle2 9)
(puzzle2 -8)

(candy-temperature 244 500)
(candy-temperature 244 1000.87)
(candy-temperature 244 5280)
(candy-temperature 244 10)
(double-any + 12)
(double-any cons "hello")

(tax-exclude-acc 0)
(tax-exclude-acc -1)
(tax-exclude-acc 10000)
(tax-exclude-acc 14000)
(tax-exclude-acc 1)
(tax-exclude-acc 14001)
(tax-exclude-acc 48000)
(tax-exclude-acc 48001)
(tax-exclude-acc 70000)
(tax-exclude-acc 75000)
(tax-exclude-acc 100000)
(tax-exclude-acc 65238)
(tax-exclude-acc 45000)
(tax-exclude-acc 1000000)