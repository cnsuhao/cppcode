;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 5: Higher-Order Procedures

;; 5.1  Procedural Parameters

(define square
  (lambda (x)
    (* x x)))

(define power
  (lambda (b e)
    (if (= e 1)
        b
        (* (power b (- e 1)) b))))

(together-copies-of stack 3 rcross-bb)

(together-copies-of * 5 2)
;Value: 32

(define together-copies-of 
  (lambda (combine quantity thing)
    (if (= quantity 1)
        thing
        (combine (together-copies-of combine
                                     (- quantity 1)
                                     thing)
                 thing))))

(define stack-copies-of 
  (lambda (quantity image)
    (together-copies-of stack quantity image)))

(define power
  (lambda (base exponent)
    (together-copies-of * exponent base)))

(define mod-expt 
  (lambda (base exponent modulus)
    (together-copies-of (lambda (x y)
                          (remainder (* x y) modulus))
                        exponent base)))

(define mystery
  (lambda (a b)
    (together-copies-of + a b)))

(define num-digits-in-satisfying
  (lambda (n test?)
    (cond ((< n 0)
           (num-digits-in-satisfying (- n) test?))
          ((< n 10)
           (if (test? n) 1 0))
          ((test? (remainder n 10)) 
           (+ (num-digits-in-satisfying (quotient n 10) test?)
              1))
          (else 
           (num-digits-in-satisfying (quotient n 10) test?)))))

(define num-odd-digits
  (lambda (n)
    (num-digits-in-satisfying n odd?)))

(define num-6s
  (lambda (n)
    (num-digits-in-satisfying n (lambda (n) (= n 6)))))

;; 5.2  Uncomputability

(define return-seven
  (lambda ()
    7))

(define loop-forever
  (lambda ()
    (loop-forever)))

(define debunk-halts?
  (lambda ()
    (if (halts? debunk-halts?)
        (loop-forever)
        666)))

;; 5.3  Procedures That Make Procedures

(define make-multiplier
  (lambda (scaling-factor)
    (lambda (x)
      (* x scaling-factor))))

(define double (make-multiplier 2))

(define triple (make-multiplier 3))

(double 7)
;Value: 14

(triple 12)
;Value: 36

(define double (make-multiplier 2))

(define square (make-exponentiater 2))

(define cube (make-exponentiater 3))

(square 4)
;Value: 16

(cube 4)
;Value: 64

(define make-repeated-version-of 
  (lambda (f)  ; make a repeated version of f
    (define the-repeated-version
      (lambda (b n)  ; which does f n times to b
        (if (= n 0)
            b
            (the-repeated-version (f b) (- n 1)))))
    the-repeated-version))

(define square (lambda (x) (* x x)))

(define repeatedly-square 
  (make-repeated-version-of square))

(repeatedly-square 2 3)  ; 2 squared squared squared
;Value: 256

;; 5.4  An Application: Verifying ID Numbers

(define sum-of-digits
  (lambda (n)
    (define sum-plus ;(sum of n's digits) + addend
      (lambda (n addend)
        (if (= n 0)
            addend
            (sum-plus (quotient n 10)
                      (+ addend (remainder n 10))))))
    (sum-plus n 0)))

(define check-isbn (make-verifier * 11))

(check-isbn 0262010771)
;Value: #t

;; Review Problems

(define usually-sqrt
  (make-function-with-exception 7 2 sqrt))

(usually-sqrt 9)
;Value: 3

(usually-sqrt 16)
;Value: 4

(usually-sqrt 7)
;Value: 2

(integer-in-range-where-smallest (lambda (x)
                                   (- (* x x) (* 2 x)))
                                 0 4)
;Value: 1

(define integer-in-range-where-smallest
  (lambda (f a b) 
    (if (= a b)
        a
        (let ((smallest-place-after-a 
               ______________))
          (if _________
              a
              smallest-place-after-a)))))

(define make-scaled
  (lambda (scale f)
    (lambda (x)
      (* scale (f x)))))

(define add-one
  (lambda (x)
    (+ 1 x)))

(define mystery
  (make-scaled 3 add-one))

(define f
  (lambda (m b)
    (lambda (x) (+ (* m x) b))))

(define g (f 3 2))

(define make-multiplier
  (lambda (scaling-factor)
    (lambda (x)
      (* x scaling-factor))))

(define make-multiplier (make-generator *))

(define make-exponentiater (make-generator expt))

(define double (lambda (x) (* x 2)))
(define square (lambda (x) (* x x)))
(define new-procedure
  (make-averaged-procedure double square))

(new-procedure 4)
;Value: 12
(new-procedure 6)
;Value: 24

(define positive-integer-upto-where-smallest
  (lambda (n f) ; return an integer i such that
                ; 1 <= i <= n and for all integers j
                ; in that same range, f(i) <= f(j)
    (define loop
      (lambda (where-smallest-so-far next-to-try)
        (if (> next-to-try n)
            where-smallest-so-far
            (loop (if (< (f next-to-try)
                         (f where-smallest-so-far))
                      next-to-try 
                      where-smallest-so-far)
                  (+ next-to-try 1)))))
    (loop 1 2)))
