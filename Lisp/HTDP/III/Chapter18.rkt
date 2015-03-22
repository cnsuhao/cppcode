;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter18) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define-struct address [first-name last-name street])
; [List-of Addr] -> String 
; creates a string of first names, sorted in alphabetical order,
; separated and surrounded by blank spaces
(define (listing.v2 l)
  (local (; String String -> String 
          ; juxtaposes two strings and prefixes with space 
          (define (string-append-with-space s t)
            (string-append " " s t)))
    (foldr string-append-with-space
           " "
           (sort (map address-first-name l)
                 string<?))))
 
(define ex0
  (list (make-address "Matthias" "Fellson" "Sunburst")
        (make-address "Robert"   "Findler" "South")
        (make-address "Matthew"  "Flatt"   "Canyon")
        (make-address "Shriram"  "Krishna" "Yellow")))
 
(check-expect (listing.v2 ex0) " Matthew Matthias Robert Shriram ")

; [List-of Number] [Number Number -> Boolean] -> [List-of Number]
(define (sort-cmp alon0 cmp)
  (local (; [List-of Number] -> [List-of Number]
          ; produces a variant of alon sorted by cmp
          (define (isort alon)
            (cond
              [(empty? alon) empty]
              [else (insert (first alon) (isort (rest alon)))]))
 
          ; Number [List-of Number] -> [List-of Number]
          ; inserts n into the sorted list of numbers alon 
          (define (insert n alon)
            (cond
              [(empty? alon) (cons n empty)]
              [else (if (cmp n (first alon))
                        (cons n alon)
                        (cons (first alon)
                              (insert n (rest alon))))])))
    (isort alon0)))

(check-expect (sort-cmp `(2 3 4 1 9 0) <) '(0 1 2 3 4 9))

(define (inf l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (local ((define smallest-in-rest (inf (rest l))))
       (cond
         [(< (first l) smallest-in-rest) (first l)]
         [else smallest-in-rest]))]))
(check-expect (inf `(2 3 4 1 9 0)) 0)
(define-struct ir [name price])
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (local
            ((define extracttail (extract1 (rest an-inv))))
            (cond
              [(<= (ir-price (first an-inv)) 1.0)
               (cons (first an-inv) extracttail)]
              [else extracttail]))]))

(check-expect (extract1 (list (make-ir "a" 0.5) (make-ir "b" 1.5) (make-ir "c" 0.9)))
              (list (make-ir "a" 0.5) (make-ir "c" 0.9)))

(define (sort-a l comp)
  (local (; Lon -> Lon
          (define (sort l)
            (cond
              [(empty? l) empty]
              [else (insert (first l) (sort (rest l)))]))
          ; Number Lon -> Lon 
          (define (insert an l)
            (cond
              [(empty? l) (list an)]
              [else
               (cond
                 [(comp an (first l)) (cons an l)]
                 [else (cons (first l) (insert an (rest l)))])])))
    (sort l)))

(define (sort< l0)
  (sort-a l0 <))

(define (sort> l0)
  (sort-a l0 >))
(check-expect (sort< `(3 5 7 9 0 2 4 8)) `(0 2 3 4 5 7 8 9))
(check-expect (sort> `(3 5 7 9 0 2 4 8)) `(9 8 7 5 4 3 2 0))

(define (sort-len-a l0)
  (local
    ((define (length-a s1 s2)
       (< (string-length s1) (string-length s2))))
    (sort-a l0 length-a)))
(define (sort-len-d l0)
  (local
    ((define (length-d s1 s2)
       (> (string-length s1) (string-length s2))))
    (sort-a l0 length-d)))
(check-expect (sort-len-a `("hehe" "a" "nimei" "sb")) `("a" "sb" "hehe" "nimei"))
(check-expect (sort-len-d `("hehe" "a" "nimei" "sb")) `("nimei" "hehe" "sb" "a"))

(define (simulate fsm s0)
  (local ((define (find-next-state s key-event)
            (find fsm s)))
    (big-bang s0
              [to-draw state-as-colored-square]
              [on-key find-next-state])))
 
(define (state-as-colored-square s)
   (square 100 "solid" s))

(define-struct transition [current next])
(define RGB (list (make-transition "red" "green")
                  (make-transition "green" "yellow")
                  (make-transition "yellow" "red")))
(define (find transitions current)
  (cond
    [(empty? transitions) (error "not found")]
    [else
      (local ((define s (first transitions)))
        (if (string=? (transition-current s) current)
            (transition-next s)
            (find (rest transitions) current)))]))
(define (add-3-to-all lop)
  (local
    ((define (add-3-to-p pos)
       (make-posn (+ 3 (posn-x pos)) (posn-y pos))))
    (map add-3-to-p lop)))
(check-expect (add-3-to-all (list (make-posn 1 2) (make-posn 3 4) (make-posn 5 6)))
              (list (make-posn 4 2) (make-posn 6 4) (make-posn 8 6)))

(check-expect (keep-good (list (make-posn 0 110) (make-posn 0 60)))
              (list (make-posn 0 60)))
 
(define (keep-good lop)
  (local 
    ((define (good? p)
       (<= (posn-y p) 100)))
    (filter good? lop)))

(check-expect (close? (list (make-posn 47 54) (make-posn 0 60))
                      (make-posn 50 50))
              true)
 
(define (close? lop pt)
  (local
    ((define (close2pt pt2)
       (<= (sqrt (+ (sqr (- (posn-x pt) (posn-x pt2)))
                    (sqr (- (posn-y pt) (posn-y pt2)))))
           5)))
    (ormap close2pt lop)))
   
(define (convert-euro lod)
  (local
    ((define (dollar2euro d)
       (* 1.22 d)))
    (map dollar2euro lod)))
(check-expect (convert-euro `(1 2 3 4))
              `(1.22 2.44 3.66 4.88))

(define (translate lop)
  (local
    ((define (p2l p)
       (list (posn-x p) (posn-y p))))
    (map p2l lop)))
(check-expect (translate (list (make-posn 1 2)
                               (make-posn 3 4)
                               (make-posn 5 6)))
              `((1 2) (3 4) (5 6)))

(define-struct toy [name aprice rprice])
(check-expect (toy-sort (list (make-toy "a1" 1 3)
                              (make-toy "a3" 2 6)
                              (make-toy "a2" 1 4)
                              (make-toy "a4" 8 9)))
              (list (make-toy "a4" 8 9)
                    (make-toy "a1" 1 3)
                    (make-toy "a2" 1 4)
                    (make-toy "a3" 2 6)))
(define (toy-sort lotoy)
  (local
    ((define (salediff t)
       (- (toy-rprice t) (toy-aprice t)))
     (define (cmp t1 t2)
       (< (salediff t1) (salediff t2))))
    (sort lotoy cmp)))
(define (eliminate-exp ua lotoy)
  (local
    ((define (ltua t)
       (>= (toy-rprice t) ua)))
    (filter ltua lotoy)))
(check-expect (eliminate-exp 5 (list (make-toy "a1" 1 3)
                                     (make-toy "a3" 2 6)
                                     (make-toy "a2" 1 4)
                                     (make-toy "a4" 8 9)))
              (list (make-toy "a3" 2 6)
                    (make-toy "a4" 8 9)))
(define (recall ty lotoy)
  (local
    ((define (notty t)
       (not (string=? (toy-name t) ty))))
    (filter notty lotoy)))
(check-expect (recall "a2" (list (make-toy "a1" 1 3)
                                 (make-toy "a3" 2 6)
                                 (make-toy "a2" 1 4)
                                 (make-toy "a4" 8 9)))
              (list (make-toy "a1" 1 3)
                    (make-toy "a3" 2 6)
                    (make-toy "a4" 8 9)))
(define (selection l1 l2)
  (local
    ((define (lcontain? l s)
       (cond [(empty? l) false]
             [else (or (string=? s (first l))
                       (lcontain? (rest l) s))]))
    (define (inl1 s)
      (lcontain? l1 s)))
              (filter inl1 l2)))
(check-expect (selection `("hehe" "nimei" "a" "sb") `("a" "nimei" "kuazi"))
              `("a" "nimei"))

(define (diagonal n)
  (local
    ((define (row-gen index-r)
       (local
         ((define (elem-gen index-c)
            (if (= index-c index-r) 1 0)))
         (build-list n elem-gen))))
    (build-list n row-gen)))

(define (append-from-fold l1 l2)
  (foldr cons l2 l1))
(check-expect (append-from-fold `(1 2 3) `(4 5 6))
              `(1 2 3 4 5 6))
(define IMGS (list (circle 40 "solid" "red")
                   (circle 30 "solid" "red")
                   (rectangle 40 40 "solid" "red")
                   (circle 50 "solid" "red")))
































































