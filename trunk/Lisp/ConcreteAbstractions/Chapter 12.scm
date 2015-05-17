;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 12: Dynamic Programming

;; 12.1  Introduction

;; 12.2  Revisiting Tree Recursion

(define walk-count
  (lambda (feet)
    (cond ((= feet 0) 1)
          ((= feet 1) 1)
          (else (+ (walk-count (- feet 1))
                   (walk-count (- feet 2)))))))

(define walk-count
  (lambda (n)
    (cond ((= n 0) 1)
          ((= n 1) 1)
          (else (+ (walk-count-subproblem (- n 1))
                   (walk-count-subproblem (- n 2)))))))

(define memoized-walk-count
  (lambda (n)
    (let ((table (make-vector n)))
      (define walk-count
        (lambda (n)
          (cond ((= n 0) 1)
                ((= n 1) 1)
                (else (+ (walk-count-subproblem (- n 1))
                         (walk-count-subproblem (- n 2)))))))
      (define walk-count-subproblem
        (lambda (n)
          we still need to define this))
      there will be some other helping stuff here
      (walk-count n))))

(define walk-count-subproblem
  (lambda (n)
    (ensure-in-table! n)
    (vector-ref table n)))

(define ensure-in-table!
  (lambda (n)
    (if (vector-ref table n) ; anything but #f ?
        'done
        (store-into-table! n))))

(define store-into-table!
  (lambda (n)
    (vector-set! table n (walk-count n))))

(vector-fill! table #f)

(define memoized-walk-count
  (lambda (n)
    (let ((table (make-vector n)))
      (define walk-count
        (lambda (n)
          (cond ((= n 0) 1)
                ((= n 1) 1)
                (else (+ (walk-count-subproblem (- n 1))
                         (walk-count-subproblem (- n 2)))))))
      (define walk-count-subproblem
        (lambda (n)
          (ensure-in-table! n)
          (vector-ref table n)))
      (define ensure-in-table!
        (lambda (n)
          (if (vector-ref table n)
              'done
              (store-into-table! n))))
      (define store-into-table!
        (lambda (n)
          (vector-set! table n (walk-count n))))
      (vector-fill! table #f)
      (walk-count n))))

(define dp-walk-count
  (lambda (n)
    (let ((table (make-vector n)))
      (define walk-count
        (lambda (n)
          (cond ((= n 0) 1)
                ((= n 1) 1)
                (else (+ (walk-count-subproblem (- n 1))
                         (walk-count-subproblem (- n 2)))))))
      (define walk-count-subproblem
        (lambda (n)
          ;; no need to ensure in table, given systematic filling in
          (vector-ref table n)))
      (define store-into-table!
        (lambda (n)
          (vector-set! table n (walk-count n))))
      (define store-into-table-from!
        ;; does store-into-table! for values from start through n-1
        (lambda (start)
          (if (= start n)
              'done
              (begin
                (store-into-table! start)
                (store-into-table-from! (+ start 1))))))
      (store-into-table-from! 0)
      (walk-count n))))

(define from-to-do
  (lambda (start stop body)
    (if (> start stop)
        'done
        (begin (body start)
               (from-to-do (+ 1 start) stop body)))))

(define dp-walk-count-2
  (lambda (n)
    (let ((table (make-vector n)))
      (define walk-count
        (lambda (n)
          (cond ((= n 0) 1)
                ((= n 1) 1)
                (else (+ (walk-count-subproblem (- n 1))
                         (walk-count-subproblem (- n 2)))))))
      (define walk-count-subproblem
        (lambda (n)
          ;; no need to ensure in table
          (vector-ref table n)))
      (define store-into-table!
        (lambda (n)
          (vector-set! table n (walk-count n))))
      (from-to-do 0 (- n 1) store-into-table!)
      (walk-count n))))

;; 12.3  Memoization

(define choose
  (lambda (n k)
    (cond ((= n k) 1)
          ((= k 0) 1)
          (else (+ (choose (- n 1) (- k 1))
                   (choose (- n 1) k))))))

(define make-table
  (lambda (number-of-rows number-of-columns)
    ...))
    
(define table-ref
  (lambda (table row column)
    ...))

(define table-set!
  (lambda (table row column value)
    ...))
    
(define table-height
  (lambda (table)
    ...))
    
(define table-width
  (lambda (table)
    ...))

(define table-ref 
  (lambda (table row col)
    (vector-ref (vector-ref table row) col)))

(define make-table
  (lambda (r c)
    (let ((table (make-vector r)))
      (from-to-do  0 (- r 1) 
                   (lambda (i)
                     (vector-set! table i (make-vector c))))
      table)))

(define memoized-choose
  (lambda (n k)
    (let ((table (make-table n (+ k 1))))
      (define choose
        (lambda (n k)
          (cond ((= n k) 1)
                ((= k 0) 1)
                (else (+ (choose-subproblem (- n 1) (- k 1))
                         (choose-subproblem (- n 1) k))))))
      (define choose-subproblem
        (lambda (n k)
          (ensure-in-table! n k)
          (table-ref table n k)))
      (define ensure-in-table!
        (lambda (n k)
          (if (table-ref table n k)
              'done
              (store-into-table! n k))))
      (define store-into-table!
        (lambda (n k)
          (table-set! table n k (choose n k))))
      (table-fill! table #f)
      (choose n k))))

(define make-chocolate
  (lambda (filling covering weight desirability)
    (list filling covering weight desirability)))

(define chocolate-filling car)
(define chocolate-covering cadr)
(define chocolate-weight caddr)
(define chocolate-desirability cadddr)

(define make-empty-box
  (lambda ()
    (list '() 0 0)))

(define box-chocolates car)
(define box-weight cadr)
(define box-desirability caddr)

(define add-chocolate-to-box
  (lambda (choc box)
    (list (cons choc
                (box-chocolates box))
          (+ (chocolate-weight choc)
             (box-weight box))
          (+ (chocolate-desirability choc)
             (box-desirability box)))))

(define shirks-chocolates-rated-by-max
  (list (make-chocolate 'caramel 'dark 13 10)
        (make-chocolate 'caramel 'milk 13 3)
        (make-chocolate 'cherry 'dark 21 3)
        (make-chocolate 'cherry 'milk 21 1)
        (make-chocolate 'mint 'dark 7 3)
        (make-chocolate 'mint 'milk 7 2)
        (make-chocolate 'cashew-cluster 'dark 8 6)
        (make-chocolate 'cashew-cluster 'milk 8 4)
        (make-chocolate 'maple-cream 'dark 14 1)
        (make-chocolate 'maple-cream 'milk 14 1)))

(define pick-chocolates
  (lambda (chocolates weight-limit)
    (cond ((null? chocolates) (make-empty-box))
          ((= weight-limit 0) (make-empty-box))
          ((> (chocolate-weight (car chocolates)) ; first too heavy
              weight-limit)
           (pick-chocolates (cdr chocolates) weight-limit))
          (else
           (better-box
            (pick-chocolates (cdr chocolates) ; none of first kind
                             weight-limit)
            (add-chocolate-to-box
             (car chocolates)      ; at least one of the first kind
             (pick-chocolates chocolates 
                              (- weight-limit
                                 (chocolate-weight 
                                  (car chocolates))))))))))

(define memoized-pick-chocolates
  (lambda (chocolates weight-limit)
    (let ((table (make-table (+ (length chocolates) 1)
                             (+ weight-limit 1))))
      (define pick-chocolates
        (lambda (chocolates weight-limit)
          (cond ((null? chocolates) (make-empty-box))
                ((= weight-limit 0) (make-empty-box))
                ((> (chocolate-weight (car chocolates)) 
                    weight-limit)                 ; first too heavy
                 (pick-chocolates-subproblem (cdr chocolates)
                                             weight-limit))
                (else
                 (better-box
                  (pick-chocolates-subproblem
                   (cdr chocolates) ; none of first kind
                   weight-limit)
                  (add-chocolate-to-box
                   (car chocolates) ; at least one of the first kind
                   (pick-chocolates-subproblem
                    chocolates
                    (- weight-limit
                       (chocolate-weight (car chocolates))))))))))
      (define pick-chocolates-subproblem
        (lambda (chocolates weight-limit)
          (ensure-in-table! chocolates weight-limit)
          (table-ref table (length chocolates) weight-limit)))
      (define ensure-in-table!
        (lambda (chocolates weight-limit)
          (if (table-ref table (length chocolates) weight-limit)
              'done
              (store-into-table! chocolates weight-limit))))
      (define store-into-table!
        (lambda (chocolates weight-limit)
          (table-set! table (length chocolates) weight-limit
                      (pick-chocolates chocolates weight-limit))))
      (table-fill! table #f)
      (pick-chocolates chocolates weight-limit))))

;; 12.4  Dynamic Programming

(define dp-choose
  (lambda (n k)
    (let ((table (make-table n (+ k 1))))
      (define choose
        (lambda (n k)
          (cond ((< n k) 0)  ; this is the new case
                ((= n k) 1)
                ((= k 0) 1)
                (else (+ (choose-subproblem (- n 1) (- k 1))
                         (choose-subproblem (- n 1) k))))))
      (define choose-subproblem
        (lambda (n k)
          (table-ref table n k)))
      (define store-into-table!
        (lambda (n k)
          (table-set! table n k (choose n k))))
      (from-to-do 1 (- n 1)
                  (lambda (row)
                    (from-to-do 0 k
                                (lambda (col)
                                  (store-into-table! row col)))))
      (choose n k))))

(define changes
  (lambda (vector1 vector2)
    (let ((n (vector-length vector1))
          (m (vector-length vector2)))
      (define changes-in-first-and-elements
        (lambda (i j)
          (cond
           ((= i 0) j)
           ((= j 0) i)
           (else
            (if (equal? (vector-ref vector1 (- i 1))
                        (vector-ref vector2 (- j 1)))
                (changes-in-first-and-elements (- i 1) (- j 1))
                (min (+ 1 (changes-in-first-and-elements
                           (- i 1) j))
                     (+ 1 (changes-in-first-and-elements
                           i (- j 1)))
                     (+ 1 (changes-in-first-and-elements
                           (- i 1) (- j 1)))))))))
      (changes-in-first-and-elements n m))))

(define dp-changes
  (lambda (vector1 vector2)
    (let ((n (vector-length vector1))
          (m (vector-length vector2)))
      (let ((table (make-table (+ n 1) (+ m 1))))
        (define changes-in-first-and-elements
          (lambda (i j)
            (cond
             ((= i 0) j)
             ((= j 0) i)
             (else
              (if (equal? (vector-ref vector1 (- i 1))
                          (vector-ref vector2 (- j 1)))
                  (changes-in-first-and-elements-subproblem (- i 1)
                                                            (- j 1))
                  (min
                   (+ 1 (changes-in-first-and-elements-subproblem
                         (- i 1) j))
                   (+ 1 (changes-in-first-and-elements-subproblem
                         i (- j 1)))
                   (+ 1 (changes-in-first-and-elements-subproblem
                         (- i 1) (- j 1)))))))))
        (define changes-in-first-and-elements-subproblem
          (lambda (i j)
            (table-ref table i j)))
        (define store-in-table!
          (lambda (i j)
            (table-set! table i j
                        (changes-in-first-and-elements i j))))
        (from-to-do 0 n
                    (lambda (row)
                      (from-to-do 0 m
                                  (lambda (col)
                                    (store-in-table! row col)))))
        (changes-in-first-and-elements n m)))))

(changes-in-first-and-elements n m)

(changes-in-first-and-elements-subproblem n m)

;; 12.5  Comparing Memoization and Dynamic Programming

;; 12.6  An Application: Formatting Paragraphs

(define string-width string-length)

(define space-width 1)

(define line-width
  (lambda (word-widths)
    (+ (sum word-widths) ; total width of words
       (* (- (length word-widths) 1) ; number of spaces
          space-width)))) ; each this wide

(define line-cost
  (lambda (word-widths max-line-width)
    (expt (- max-line-width (line-width word-widths))
          3)))

(make-solution breaks cost)
(breaks solution)
(cost solution)

(define best-solution-from-to-of
  (lambda (low high procedure)
    (if (= low high)
        (procedure low)
        (better-solution (procedure low)
                         (best-solution-from-to-of (+ low 1) high
                                                   procedure)))))

(define format-paragraph  ;returns solution
  (lambda (word-widths max-line-width)
    (let ((most-on-first (num-that-fit word-widths max-line-width)))
      (cond ((= most-on-first (length word-widths))
             (make-solution (list most-on-first) 0))  ; all on first
            ((= most-on-first 0)
             (error "impossible to format; use shorter words"))
            (else
             (best-solution-from-to-of
              1 most-on-first
              (lambda (num-on-first)
                (let ((solution-except-first-line
                       (format-paragraph (list-tail word-widths
                                                    num-on-first)
                                         max-line-width)))
                  (make-solution
                   (cons num-on-first
                         (breaks solution-except-first-line))
                   (+ (cost solution-except-first-line)
                      (line-cost (first-elements-of
                                  num-on-first
                                  word-widths)
                                 max-line-width)))))))))))

;; Review Problems

(from-to-do 2 (* 3 4)
            (lambda (n) (display (* 2 n))))

(for n = 2 to (* 3 4) do (display (* 2 n)))

(define make-for-ast
  (lambda (var start-ast stop-ast body-ast)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate-in)
               (lambda (global-environment)
                 code for evaluate-in))
              ((equal? message 'substitute-for)
               (lambda (value name)
                 code for substitute-for))
              (else (error "unknown operation on a for AST"
                           message)))))
    the-ast))

(fewest-moves (vector 'white 'black 'white 'white 'white
                      'black 'white 'white 'black 'white
                      'black 'white 'white 'black 'black
                      'white 'white 'white)
              0)

(define fewest-moves
  (lambda (path i) ; path is a vector
                   ; i is the position within path
    (cond ((>= i (vector-length path)) ; right of path
            0)
          ((equal? (vector-ref path i) 'white)
           (+ 1 (min (fewest-moves path (+ i 1))
                     (fewest-moves path (+ i 2)))))
          (else
           (+ 1 (min (fewest-moves path (+ i 1))
                     (fewest-moves path (+ i 4))))))))

(define from-to-add
  (lambda (start end f)
    (if (> start end)
        0
        (+ (f start)
           (from-to-add (+ start 1) end f)))))

(define ps
  (lambda (n)
    (cond ((= n 1) 1)
          ((= n 2) 1)
          (else
           (from-to-add 1 (- n 1)
                        (lambda (k)
                          (* (ps k) (ps (- n k)))))))))

(2 1 3 1 4 2)

(define best
  (lambda (l)
    (if (null? l)
        0
        (let ((k (car l))
              (rest (cdr l)))
          (max (best rest)
               (+ k (best (skip-of k rest))))))))

(define skip-of
  (lambda (n l)  ;skip first n elements of l
    (if (or (= n 0) (null? l))  ;l can be shorter than n
        l
        (skip-of (- n 1) (cdr l)))))
