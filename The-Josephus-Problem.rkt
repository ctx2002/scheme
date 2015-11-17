#lang racket
#|
    The Josephus Problem.
    good-postion will return all save postions
|#
(define survives?
  (lambda (position n)
    (if (< n 3)
        #t
        (if (= position 3)
            #f
            (survives? (renumber position n)
                      (- n 1))))))


(define renumber
  (lambda (old-position old-number)
    (modulo (- old-position 3) old-number)))

(define good-position
  (lambda (n
           init-size l)
    (if(= 0 n)
       l
       (if (survives? n init-size)
           (good-position (- n 1) init-size (cons n l))
           (good-position (- n 1) init-size l)))))

(survives? 40 40)
(good-position  8 8 '())
