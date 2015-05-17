;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 2: Recursion and Induction

;; 2.1  Recursion

(define factorial
  (lambda (n)
    (* (factorial (- n 1))
       n)))

(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (* (factorial (- n 1))
           n))))

(factorial 52)
;Value: 80658175170943878571660636856403766975289505440883277824000000000000

(factorial 3)
(* (factorial 2) 3)
(* (* (factorial 1) 2) 3)
(* (* 1 2) 3)
(* 2 3)
6

;; 2.2  Induction

(define square
  (lambda (n)
    (if (= n 0)
        0
        (+ (square (- n 1))
           (- (+ n n) 1)))))

(define square      ; This version doesn't work.
  (lambda (n)
    (if (= n 0)
        0
        (- (square (+ n 1))
           (+ (+ n n) 1)))))

(define square  ; another version that doesn't work
  (lambda (n)
    (if (= n 0)
        0
        (+ (square (- n 2))
           (- (* 4 n) 4)))))

(define square
  (lambda (n)
    (if (= n 0)
        0
        (___ (square _________) 
             __________))))

(define square
  (lambda (n)
    (if (= n 0)
        0
        (___ (square (- n 1))
             _________))))

(define square
  (lambda (n)
    (if (= n 0)
        0
        (+ (square (- n 1))
           (- (+ n n) 1)))))

(define square
  (lambda (n)
    (if (= n 0)
        0
        (if (even? n)
            (___ (square (/ n 2))
                 ___________)
            (+ (square (- n 1))
               (- (+ n n) 1))))))

;; 2.3  Further Examples

(quotient 9 3)
;Value: 3

(quotient 10 3)
;Value: 3

(quotient 11 3)
;Value: 3

(quotient 12 3)
;Value: 4

(define quot
  (lambda (n d)
    (if (< n d)
        0
        (+ 1 (quot (- n d) d)))))

(define quot
  (lambda (n d)
    (if (< d 0)
        (- (quot n (- d)))
        (if (< n 0)
            (- (quot (- n) d))
            (if (< n d)
                0
                (+ 1 (quot (- n d) d)))))))

(define quot
  (lambda (n d)
    (cond ((< d 0) (- (quot n (- d))))
          ((< n 0) (- (quot (- n) d)))
          ((< n d) 0)
          (else    (+ 1 (quot (- n d) d))))))

(define sum-of-first
  (lambda (n)
    (if (= n 1)
        1
        (+ (sum-of-first (- n 1))
           n))))

(define sum-of-first
  (lambda (n)
    (if (= n 0)
        0
        (+ (sum-of-first (- n 1))
           n))))

(define factorial
  (lambda (n)
    (if (= n 0)
        1
        (* (factorial (- n 1))
           n))))

(define subtract-the-first
  (lambda (n)
    (if (= n 0)
        0
        (- (subtract-the-first (- n 1))
           n))))

(define factorial2
  (lambda (n)
    (if (= n 0)
        1
        (* n
           (factorial2 (- n 1))))))

(define sum-integers-from-to
  (lambda (low high)
    (if (> low high)
        0
        (+ (sum-integers-from-to low (- high 1))
           high))))

(define num-digits
  (lambda (n)
    (if (< n 10)
        1
        (+ 1 (num-digits (quotient n 10))))))

(define num-digits
  (lambda (n)
    (cond ((< n 0)  (num-digits (- n)))
          ((< n 10) 1)
          (else     (+ 1 (num-digits (quotient n 10)))))))

;; 2.4  An Application: Custom-Sized Quilts

;; Review Problems

(define foo
  (lambda (x n)
    (if (= n 0)
        1
        (+ (expt x n) (foo x (- n 1))))))

(define presents-on-day
  (lambda (n)
    (if (= n 1)
        1
        (+ n (presents-on-day (- n 1))))))

(define f
  (lambda (n)
    (if (= n 0)
        0
        (+ 2 (f (- n 1))))))

(define foo
  (lambda (n)
    (if (= n 0)
        2
        (expt (foo (- n 1)) 2))))

(define f
  (lambda (n)
    (if (= n 0)
        0
        (+ (f (- n 1))
           (/ 1 (* n (+ n 1)))))))

(define stack-on-itself
  (lambda (image)
    (stack image image)))

(define f
  (lambda (image n)
    (if (= n 0)
        image
        (stack-on-itself (f image (- n 1))))))

(define foo
  (lambda (n)
    (if (= n 0)
        0
        (+ (foo (- n 1))
           (/ 1 (- (* 4 (square n)) 1))))))
