;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define (convert-euro lod)
  (map (lambda (d) (* 1.22 d)) lod))

(check-expect (convert-euro `(1 2 3))
              `(1.22 2.44 3.66))

(define (shape-inside? s p)
  (s p))
  
(define (make-circle center-x center-y r)
  (lambda (p)
    (local ((define (distance-between x y p)
              (sqrt
               (+ (sqr (- x (posn-x p)))
                  (sqr (- y (posn-y p)))))))
      (<= (distance-between center-x center-y p) r))))

(define (make-rectangle northwest-x northwest-y width height)
  (lambda (p)
    (local ((define (between left z interval)
              (<= left z (+ left interval))))
      (and (between northwest-x (posn-x p) width)
           (between (- northwest-y height) (posn-y p) height)))))

(define (make-combination s1 s2)
  (lambda (x)
    (or (shape-inside? s1 x) (shape-inside? s2 x))))

; — examples
(define circle1 (make-circle 3 4 5))
(define rectangle1 (make-rectangle 0 3 10 3))
(define union1 (make-combination circle1 rectangle1))
 
; — tests
(check-expect (shape-inside? circle1 (make-posn 0 0)) true)
(check-expect (shape-inside? circle1 (make-posn 0 -1)) false)
(check-expect (shape-inside? circle1 (make-posn -1 3)) true)
 
(check-expect (shape-inside? rectangle1 (make-posn 0 0)) true)
(check-expect (shape-inside? rectangle1 (make-posn 0 -1)) false)
(check-expect (shape-inside? rectangle1 (make-posn -1 3)) false)
 
(check-expect (shape-inside? union1 (make-posn 0 0)) true)
(check-expect (shape-inside? union1 (make-posn 0 -1)) false)
(check-expect (shape-inside? union1 (make-posn -1 3)) true)

(define oddn
  (lambda (n)
         (= (modulo n 2) 1)))
(check-expect (oddn 3) #t)
(check-expect (oddn 4) #f)

(define even
  (lambda (n)
         (= (modulo n 2) 0)))
(check-expect (even 3) #f)
(check-expect (even 4) #t)

(define (add-element s e)
  (lambda (n)
    (or (s n) (= n e))))
(define oddn+3 (add-element oddn 3))
(check-expect (oddn+3 3) #t)

(define (union s1 s2)
  (lambda (n)
    (or (s1 n) (s2 n))))
(define every (union oddn even))
(check-expect (every 3) #t)
(check-expect (every 4) #t)

(define (intersect s1 s2)
  (lambda (n)
    (and (s1 n) (s2 n))))
(define none (intersect oddn even))
(check-expect (none 3) #f)
(check-expect (none 4) #f)





















































