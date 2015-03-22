;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define (processlon proc lon)
  (cond
    [(empty? lon) '()]
    [else
     (cons (proc (first lon))
           (processlon proc (rest lon)))]))

; Lon -> Lon
; add 1 to each number on l
(define (add1* l)
  (processlon add1 l))

(check-expect (add1* `(1 2 3 4 5)) `(2 3 4 5 6))

(define (plus5 n)
  (+ n 5))
; Lon -> Lon
; adds 5 to each number on l
(define (plus5* l)
  (processlon plus5 l))

(check-expect (plus5* `(1 2 3 4 5)) `(6 7 8 9 10))

(define (theone l rule)
  (cond
    [(empty? (rest l))
     (first l)]
    [else (rule (first l) (theone (rest l) rule))]))

(define (inf-impl first restmin)
  (if (< first restmin) first restmin))
(define (inf l)
  (theone l inf-impl))

(define (sup-impl first restmin)
  (if (> first restmin) first restmin))
(define (sup l)
  (theone l sup-impl))

(check-expect (inf (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)) 1)
 
(check-expect (sup (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25)) 25)

(check-expect (occurs "a" (list "b" "a" "d")) (list "d"))
(check-expect (occurs "a" (list "b" "c" "d")) #f)

(define (occurs s los)
  (cond [(empty? los) #f]
        [(string=? s (first los)) (rest los)]
        [else (occurs s (rest los))]))

(define (tab-proc n proc)
  (cond
    [(= n 0) (list (proc 0))]
    [else
     (cons (proc n)
           (tab-proc (sub1 n) proc))]))

(define (tab-sin n)
  (tab-proc n sin))
(define (tab-sqrt n)
  (tab-proc n sqrt))
(define (tab-tan n)
  (tab-proc n tan))
(define (tab-sqr n)
  (tab-proc n sqr))

(define (fold1 l init proc)
  (cond
    [(empty? l) init]
    [else
     (proc (first l)
        (fold1 (rest l) init proc))]))

(define (sum l)
  (fold1 l 0 +))
(check-expect (sum `(1 2 3)) 6)

(define (product l)
  (fold1 l 1 *))
(check-expect (product `(1 2 3)) 6)

; Posn Image -> Image 
(define (place-dot p img)
  (place-image dot
               (posn-x p) (posn-y p)
               img))
 
; graphical constants:    
(define emt (empty-scene 100 100))
(define dot (circle 3 "solid" "red"))

(define (image* l)
  (fold1 l emt place-dot))











