;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 11: Computers with Memory

;; 11.1  Introduction

;; 11.2  An Example Computer Architecture

;; 11.3  Programming the SLIM

;; 11.4  Iteration in Assembly Language

(define factorial-product
  (lambda (a b) ; computes a * b!, provided b is a nonnegative integer
    (if (= b 0)
        a 
        (factorial-product (* a b) (- b 1)))))

(define factorial
  (lambda (n)
    (factorial-product 1 n)))

(define power-product
  (lambda (a b e)   ; returns a times b to the e power
    (cond ((= e 0) a)
          ((= (remainder e 2) 0)
           (power-product a (* b b) (/ e 2)))
          (else (power-product (* a b) b (- e 1))))))

(define factorial-product
  (lambda (a b) ; computes a * b!, given b is a nonnegative integer
    (if (= b 0)
        a 
        (let ((a (* a b)))
          (let ((b (- b 1)))
            (factorial-product a b))))))

(define factorial-product ; this version doesn't work
  (lambda (a b) ; computes a * b!, given b is a nonnegative integer
    (if (= b 0)
        a 
        (let ((b (- b 1)))
          (let ((a (* a b))) ; note that this uses the new b
            (factorial-product a b))))))

(define gcd
  (lambda (x y)
    (if (= y 0)
        x
        (gcd y (remainder x y)))))

(define gcd
  (lambda (x y)
    (if (= y 0)
        x
        (let ((old-x x))
          (let ((x y))                     ; x changes here
            (let ((y (remainder old-x y))) ; but isn't used here
              (gcd x y)))))))

(define factorial-product ; unchanged from the above
  (lambda (a b) ; computes a * b!, given b is a nonnegative integer
    (if (= b 0)
        a 
        (factorial-product (* a b) (- b 1)))))

(define two-factorials
  (lambda (n)
    (+ (factorial-product 1 n)
       (factorial-product 1 (* 2 n)))))

;; 11.5  Recursion in Assembly Language

(define factorial
  (lambda (n)
    (if (= n 0)
        1
        (* (factorial (- n 1))
           n))))

;; 11.6  Memory in Scheme: Vectors

(define v (make-vector 17))

(vector-length v)    ; find out how many locations
;Value: 17

(vector-set! v 13 7) ; store a 7 into location 13

(vector-ref v 13)    ; retrieve what's in location 13
;Value: 7

(vector-set! v 0 3)  ; put a 3 into the first location (location 0)

(vector-ref v 13)    ; see if location 13 still intact
;Value: 7

(vector-set! v 13 0) ; now clobber it

(vector-ref v 13)    ; see that location 13 did change
;Value: 0

90-99: XXXXXXXX
80-89: XXXXXXXXXX
70-79: XXXXXXX
60-69: XXX
50-59: XXXXX
40-49: XXX
30-39: XX
20-29: 
10-19: X
00-09: 

(define do-grade-histogram
  (lambda ()
    (let ((histogram (make-vector 10)))
      (define read-in-grades-loop
        (lambda ()
          (let ((input (read)))
            (if (equal? input 'done)
                'done-reading
                (let ((bin (quotient input 10)))
                  (vector-set! histogram bin
                               (+ 1 (vector-ref histogram bin)))
                  (read-in-grades-loop)))))) ;end of loop
      (zero-out-vector! histogram) ;start of main procedure
      (newline)
      (display
       "Enter grades in the range 0 - 99; enter done when done.")
      (newline)
      (read-in-grades-loop)
      (display-histogram histogram))))

(define zero-out-vector!
  (lambda (v)
    (define do-locations-less-than
      (lambda (limit)
        (if (= limit 0)
            'done
            (let ((location (- limit 1)))
              (vector-set! v location 0)
              (do-locations-less-than location)))))
    (do-locations-less-than (vector-length v))))

(define display-histogram
  (lambda (histogram)
    (define display-row
      (lambda (number)
        (display number)
        (display "0-")
        (display number)
        (display "9: ")
        ;; display-times from page 313 useful here
        (display-times "X" (vector-ref histogram number))
        (newline)))
    (define loop
      (lambda (counter)
        (if (< counter 0)
            'done
            (begin (display-row counter)
                   (loop (- counter 1))))))
    (newline)
    (loop 9)
    (newline)))

(define maximum-bar-size 70)

(define display-histogram
  (lambda (hist)
    (let ((scale (ceiling  ; i.e., round up to an integer
                  (/ (largest-element-of-vector hist)
                     maximum-bar-size))))
      (define display-row
        (lambda (number)
          (display number)
          (display "0-")
          (display number)
          (display "9: ")
          (display-times "X" (quotient
                              (vector-ref hist number)
                              scale))
          (newline)))
      (define loop
        (lambda (counter)
          (if (< counter 0)
              'done
              (begin (display-row counter)
                     (loop (- counter 1))))))
      (newline)
      (display "Each X represents ")
      (display scale)
      (newline)
      (loop 9)
      (newline))))

;; 11.7  An Application: A Simulator for SLIM

(define load-and-run
  (lambda (instructions)
    (let ((model (make-machine-model))
          (num-instructions (vector-length instructions)))
      (define loop
        (lambda (instructions-executed-count)
          (if (halted? model)
              instructions-executed-count
              (let ((current-instruction-address (get-pc model)))
                (cond
                 ((= current-instruction-address num-instructions)
                  (error "Program counter ran (or jumped) off end"))
                 ((> current-instruction-address num-instructions)
                  (error
                   "Jump landed off the end of program at address"
                   current-instruction-address))
                 (else
                  (do-instruction-in-model
                   (vector-ref instructions
                               current-instruction-address)
                   model)
                  (loop (+ instructions-executed-count 1))))))))
      (loop 0))))

(define mem-size 10000)
(define reg-bank-size 32)

(define make-machine-model
  (lambda ()
    (let ((memory (make-vector mem-size))
          (registers (make-vector reg-bank-size))
          (misc-state (make-vector 2)))
      (zero-out-vector! memory)
      (zero-out-vector! registers)
      (vector-set! misc-state 0 0) ; PC = 0
      (vector-set! misc-state 1 #f) ; not halted
      (list memory registers misc-state))))

(define get-reg
  (lambda (model reg-num)
    (vector-ref (cadr model) reg-num)))

(define set-reg!
  (lambda (model reg-num new-value)
    (vector-set! (cadr model) reg-num new-value)))

(define do-instruction-in-model
  (lambda (instruction model)
    (instruction model)))

(define make-load-inst
  (lambda (destreg addressreg)
    (lambda (model)
      (set-reg! model
                destreg
                (get-mem model
                         (get-reg model addressreg)))
      (set-pc! model (+ (get-pc model) 1)))))

(let ((instructions (make-vector 3)))
  (vector-set! instructions 0
               (make-load-immediate-inst 1 314))
  (vector-set! instructions 1
               (make-write-inst 1))
  (vector-set! instructions 2
               (make-halt-inst))
  (load-and-run instructions))

(define write-larger
  (assemble
   '((allocate-registers input-1 input-2 comparison jump-target)

     (read input-1)
     (read input-2)
     (sge comparison input-1 input-2) 
     (li jump-target input-2-larger)
     (jeqz comparison jump-target)

     (write input-1)
     (halt)

     input-2-larger
     (write input-2)
     (halt))))

;; Review Problems

(define sum-of-digits
  (lambda (n) ; assume n >= 0
    (define iter
      (lambda (n acc)
        (if (= n 0)
            acc
            (let ((last-digit (remainder n 10)))
              (iter (quotient n 10)
                    (+ acc last-digit))))))
    (iter n 0)))

(define v (vector 2 1 4 5))

v
;Value: #(2 1 4 5) ; <-- this is the way Scheme displays vectors

(multiply-by! v 3)
;Value: done

v
;Value: #(6 3 12 15)

(multiply-by! v 2)
;Value: done

v
;Value: #(12 6 24 30)
