;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname example6.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

; Number -> Number
; computes the area of a disk with radius r
(define (area-of-disk r)
  (cond [(and (number? r) (> r 0)) (* 3.14 (* r r))]
        [else (error "area-of-disk: positive number expected")]))

(check-expect (missile-or-not? false) true)
(check-expect (missile-or-not? (make-posn 10 2)) true)
(check-expect (missile-or-not? "yellow") false)

(define (missile-or-not? v)
  (cond
    [(false? v) true]
    [(posn? v) true]
    [else false]))

; Any -> Boolean 
; is x between 0 (inclusive) and 1 (exclusive)
 
(check-expect (between-0-and-1? "a") false)
(check-expect (between-0-and-1? 1.2) false)
(check-expect (between-0-and-1? 0.2) true)
(check-expect (between-0-and-1? 0.0) true)
(check-expect (between-0-and-1? 1.0) false)
 
(define (between-0-and-1? x)
  (and (number? x) (<= 0 x) (< x 1)))

; TrafficLight TrafficLight -> Boolean
; are the two (states of) traffic lights equal
 
(check-expect (light=? "red" "red") true)
(check-expect (light=? "red" "green") false)
(check-expect (light=? "green" "green") true)
(check-expect (light=? "yellow" "yellow") true)
 
(define (light=? a-value another-value)
  (if (and (light? a-value) (light? another-value))
      (string=? a-value another-value)
      (error "traffic light expected, given: some other value")))
; Any -> Boolean
; is the given value an element of TrafficLight
(define (light? x)
  (cond
    [(string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))]
    [else false]))