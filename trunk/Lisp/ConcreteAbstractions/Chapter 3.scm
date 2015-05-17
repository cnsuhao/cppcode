;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 3: Iteration and Invariants

;; 3.1  Iteration

(define factorial-product
  (lambda (a b) ; compute a * b!
    ))

(define factorial-product
  (lambda (a b) ; compute a * b! as (a*b) * (b-1)!
    (factorial-product (* a b) (- b 1)))) 

(define factorial-product
  (lambda (a b) ; compute a * b!
    (if (= b 0)
        a 
        (factorial-product (* a b) (- b 1)))))

(define factorial
  (lambda (n)
    (factorial-product 1 n)))

(factorial 3)
(factorial-product 1 3)
(if (= 3 0) 1 (factorial-product (* 1 3) (- 3 1)))
(factorial-product (* 1 3) (- 3 1))
(factorial-product 3 2)
(if (= 2 0) 3 (factorial-product (* 3 2) (- 2 1)))
(factorial-product (* 3 2) (- 2 1))
(factorial-product 6 1)
(if (= 1 0) 6 (factorial-product (* 6 1) (- 1 1)))
(factorial-product (* 6 1) (- 1 1))
(factorial-product 6 0)
(if (= 0 0) 6 (factorial-product (* 6 0) (- 0 1)))
6

;; 3.2  Using Invariants

(define power-product
  (lambda (a b e)    ; returns a times b to the e power
    (if (= e 0)
        _______
        (power-product ______ ______ ______))))

(define power
  (lambda (b e)
    (power-product 1 b e)))

(define power-product
  (lambda (a b e)    ; returns a times b to the e power
    (if (= e 0)
        a
        (power-product (* a b) b (- e 1)))))

(define fermat-number      ; computes the nth Fermat number
  (lambda (n)
    (+ (repeatedly-square 2 n) 1)))

(define repeatedly-square  ; computes b squared n times, where
  (lambda (b n)            ;  n is a nonnegative integer
    (if (= n 0)
        b     ;not squared at all
        (repeatedly-square ________ ________))))


(define repeatedly-square  ; computes b squared n times, where
  (lambda (b n)            ;  n is a nonnegative integer
    (if (= n 0)
        b     ; not squared at all
        (repeatedly-square ________ (- n 1)))))

(define repeatedly-square  ; computes b squared n times, where
  (lambda (b n)            ;  n is a nonnegative integer
    (if (= n 0)
        b     ;not squared at all
        (repeatedly-square (square b) (- n 1)))))

;; 3.3  Perfect Numbers, Internal Definitions, and Let

(define perfect?
  (lambda (n)
    (= (sum-of-divisors n) (* 2 n))))

(define sum-of-divisors
  (lambda (n)
    (define sum-from-plus ; sum of all divisors of n which are
      (lambda (low addend) ; >= low, plus addend
        (if (> low n)
            addend    ; no divisors of n are greater than n
            (sum-from-plus (+ low 1) 
                           (if (divides? low n)
                               (+ addend low)
                               addend)))))
    (sum-from-plus 1 0)))

(define divides?
  (lambda (a b)
    (= (remainder b a) 0)))

(define first-perfect-after
  (lambda (n)
    (if (perfect? (+ n 1))
        (+ n 1)
        (first-perfect-after (+ n 1)))))

(first-perfect-after 0)
;Value: 6

(first-perfect-after 6)
;Value: 28

(first-perfect-after 28)
;Value: 496

(define first-perfect-after
  (lambda (n)
    (let ((next (+ n 1)))
      (if (perfect? next)
          next
          (first-perfect-after next)))))

(define distance
  (lambda (x0 y0 x1 y1)
    (let ((xdiff (- x0 x1))
          (ydiff (- y0 y1)))
      (sqrt (+ (* xdiff xdiff)
               (* ydiff ydiff))))))

;; 3.4  Iterative Improvement: Approximating the Golden Ratio

(define find-approximation-from
  (lambda (starting-point)
    (if (good-enough? starting-point)
        starting-point
        (find-approximation-from (improve starting-point)))))

(approximate-golden-ratio 1/50000)
;Value: 377/233

(define approximate-golden-ratio
  (lambda (tolerance)
    (define find-approximation-from
      (lambda (starting-point)
        (if (good-enough? starting-point)
            starting-point
            (find-approximation-from (improve starting-point)))))
    (define good-enough?
      (lambda (approximation)
        (< (/ 1 (square (denominator approximation)))
           tolerance)))
    (find-approximation-from 1)))        

;; 3.5  An Application: The Josephus Problem

(survives? 3 40)
;Value: #f

(define survives?
  (lambda (position n)
    (if (< n 3)
        #t
        we still need to write this part)))

(define survives?
  (lambda (position n)
    (if (< n 3)
        #t
        (if (= position 3)
            #f
            we still need to write this part))))

(define survives?
  (lambda (position n)
    (or (< n 3)
        (and (not (= position 3))
             your part with n-1 people goes here))))

;; Review Problems

(define largest-odd-divisor
  (lambda (n)
    (if (odd? n)
        n
        (largest-odd-divisor (/ n 2)))))

(define closest-power
  (lambda (b n)
    (if (< n b)
        0
        (+ 1 (closest-power b (quotient n b))))))

(define f
  (lambda (n)
    (if (= n 0)
        0
        (g (- n 1)))))

(define g
  (lambda (n)
    (if (= n 0)
        1
        (f (- n 1)))))

(define f
  (lambda (n)
    (if (= n 0)
        0
        (+ 1 (g (- n 1))))))

(define g
  (lambda (n)
    (if (= n 0)
        1
        (+ 1 (f (- n 1))))))

(define foo
  (lambda (n a)
    (if (= n 0)
        a
        (foo (- n 1) (+ a a)))))

(define factorial
  (lambda (n)
    (product 1 n)))

(define product
  (lambda (low high)
    (if (> low high)
        1
        (* low
           (product (+ low 1) high)))))
