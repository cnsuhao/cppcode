;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

; List-of-numbers -> List-of-numbers
; produces a sorted version of alon
(define (sort> alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon) (sort> (rest alon)))]))
 ; List-of-numbers -> List-of-numbers 
; produces a version of alon, sorted in descending order
 
(check-expect (sort> empty) empty)
 
(check-expect (sort> (list 12 20 -5)) (list 20 12 -5))
 
(check-expect (sort> (list 3 2 1)) (list 3 2 1))
 
(check-expect (sort> (list 1 2 3)) (list 3 2 1))
; Number List-of-numbers -> List-of-numbers
; inserts n into the sorted list of numbers alon 
(define (insert n alon)
  (cond
    [(empty? alon) (cons n empty)]
    [else (if (>= n (first alon))
              (cons n alon)
              (cons (first alon) (insert n (rest alon))))]))

(check-expect (insert 5 (list 6)) (list 6 5))
(check-expect (insert 5 (list 4)) (list 5 4))

(define (search-sorted> n alon)
  (cond [(or (empty? alon) (> n (first alon))) false]
        [else (or (= n (first alon)) (search-sorted> n (rest alon)))]))

(check-expect (search-sorted> 3 (sort> (list 1 2 3))) true)

(define-struct email [from date message])

(define (sortemail-date loe)
  (cond [(empty? loe) empty]
        [else (insert-email-date (first loe) (sortemail-date (rest loe)))]))
(define (insert-email-date e loe)
  (cond [(empty? loe) (cons e loe)]
        [else (if (< (email-date e) (email-date (first loe)))
                  (cons e loe)
                  (cons (first loe) (insert-email-date e (rest loe))))]))

(define e1 (make-email "e1" 1 "nimei1"))
(define e2 (make-email "e2" 2 "nimei2"))
(define e3 (make-email "e3" 3 "nimei3"))

(check-expect (sortemail-date (list e2 e1 e3))
              (list e1 e2 e3))

(define (sortemail-from loe)
  (cond [(empty? loe) empty]
        [else (insert-email-from (first loe) (sortemail-from (rest loe)))]))
(define (insert-email-from e loe)
  (cond [(empty? loe) (cons e loe)]
        [else (if (string<? (email-from e) (email-from (first loe)))
                  (cons e loe)
                  (cons (first loe) (insert-email-from e (rest loe))))]))

(check-expect (sortemail-from (list e2 e3 e1))
              (list e1 e2 e3))

; A Polygon is one of: 
; – (list Posn Posn Posn)
; – (cons Posn Polygon)
 
(define MT (empty-scene 50 50))
 
; Polygon -> Image 
; adds an image of p to MT
(define (render-polygon p)
  (connect-dots p (first p)))
 
; A NELoP is one of: 
; – (cons Posn empty)
; – (cons Posn NELoP)
 
; NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots p head)
  (cond
    [(empty? (rest p)) (render-line MT (first p) head)]
    [else
      (render-line
        (connect-dots (rest p) head) (first p) (second p))]))
 
; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (add-line
    im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))
 
; Polygon -> Posn
; extracts the last item from p
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))

(check-expect
  (render-polygon
    (list (make-posn 10 10) (make-posn 20 10)
          (make-posn 20 20) (make-posn 10 20)))
  (add-line
    (add-line
      (add-line
        (add-line MT 10 10 20 10 "red")
        20 10 20 20 "red")
      20 20 10 20 "red")
    10 20 10 10 "red"))






















