;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 6: Compound Data and Data Abstraction

;; 6.1  Introduction

;; 6.2  Nim

(size-of-pile game-state p) 
  ;returns an integer equal to the number of coins in the p-th 
  ;pile of the game-state

(remove-coins-from-pile game-state n p) 
  ;given a Nim game-state, returns a new game state with n 
  ;fewer coins in pile p

(make-game-state n m) 
  ;returns a game state with n coins in the first pile
  ;and m coins in the second pile

'human
;Value: human

'x
;Value: x

(define x 'y)
x
;Value: y

(define z x)
z
;Value: y

(define w 'x)
w
;Value: x

(define play-with-turns    ;warning: this is not the final version
  (lambda (game-state player)
    (cond ((over? game-state) 
           (announce-winner player))
          ((equal? player 'human)  
           (play-with-turns (human-move game-state) 'computer))
          ((equal? player 'computer)  
           (play-with-turns (computer-move game-state) 'human)))))

(play-with-turns (make-game-state 5 8) 'human)

(error "player wasn't human or computer")

(error "player wasn't human or computer:" player)

(define play-with-turns      
  (lambda (game-state player)
    (cond ((over? game-state) 
           (announce-winner player))
          ((equal? player 'human)  
           (play-with-turns (human-move game-state) 'computer))
          ((equal? player 'computer)  
           (play-with-turns (computer-move game-state) 'human))
          (else  
           (error "player wasn't human or computer:" player)))))

(define computer-move
  (lambda (game-state)
    (if (> (size-of-pile game-state 1) 0) 
        (remove-coins-from-pile game-state 1 1)
        (remove-coins-from-pile game-state 1 2))))

(define display-game-state
  (lambda (game-state)
    (newline)
    (newline)
    (display "    Pile 1: ")
    (display (size-of-pile game-state 1))
    (newline)
    (display "    Pile 2: ")
    (display (size-of-pile game-state 2))
    (newline)
    (newline)))

(define play-with-turns
  (lambda (game-state player)
    (display-game-state game-state)                 ;<-- output
    (cond ((over? game-state) 
           (announce-winner player))
          ((equal? player 'human)  
           (play-with-turns (human-move game-state) 'computer))
          ((equal? player 'computer)  
           (play-with-turns (computer-move game-state) 'human))
          (else  
           (error "player wasn't human or computer:" player)))))

(define computer-move
  (lambda (game-state)
    (let ((pile (if (> (size-of-pile game-state 1) 0)
                    1
                    2)))
      (display "I take 1 coin from pile ")
      (display pile)
      (newline)
      (remove-coins-from-pile game-state 1 pile))))

(define prompt
  (lambda (prompt-string)
    (newline)
    (display prompt-string)
    (newline)
    (read)))

(define human-move
  (lambda (game-state)
    (let ((p (prompt "Which pile will you remove from?")))
      (let ((n (prompt "How many coins do you want to remove?")))
        (remove-coins-from-pile game-state n p)))))

(define total-size
  (lambda (game-state)
    (+ (size-of-pile game-state 1)
       (size-of-pile game-state 2))))

(define over?
  (lambda (game-state)
    (= (total-size game-state) 0)))

(define announce-winner
  (lambda (player)
    (if (equal? player 'human) 
        (display "You lose. Better luck next time.")
        (display "You win. Congratulations."))))

;; Sidebar: Nim Program

(define play-with-turns
  (lambda (game-state player)
    (display-game-state game-state)
    (cond ((over? game-state) 
           (announce-winner player))
          ((equal? player 'human)  
           (play-with-turns (human-move game-state) 'computer))
          ((equal? player 'computer)  
           (play-with-turns (computer-move game-state) 'human))
          (else  
           (error "player wasn't human or computer:" player)))))

(define computer-move
  (lambda (game-state)
    (let ((pile (if (> (size-of-pile game-state 1) 0)
                    1
                    2)))
      (display "I take 1 coin from pile ")
      (display pile)
      (newline)
      (remove-coins-from-pile game-state 1 pile))))

(define prompt
  (lambda (prompt-string)
    (newline)
    (display prompt-string)
    (newline)
    (read)))

(define human-move
  (lambda (game-state)
    (let ((p (prompt "Which pile will you remove from?")))
      (let ((n (prompt "How many coins do you want to remove?")))
        (remove-coins-from-pile game-state n p)))))

(define over?
  (lambda (game-state)
    (= (total-size game-state) 0)))

(define announce-winner
  (lambda (player)
    (if (equal? player 'human) 
        (display "You lose. Better luck next time.")
        (display "You win. Congratulations."))))

;; 6.3  Representations and Implementations

(define make-game-state
  ;; assumes no more than 9 coins per pile
  (lambda (n m) (+ (* 10 n) m)))

(define size-of-pile
  (lambda (game-state pile-number)
    (if (= pile-number 1)
        (quotient game-state 10)
        (remainder game-state 10))))

(define remove-coins-from-pile
  (lambda (game-state num-coins pile-number)
    (- game-state 
       (if (= pile-number 1)
           (* 10 num-coins)
           num-coins))))

(define remove-coins-from-pile
  (lambda (game-state num-coins pile-number)
    (if (= pile-number 1)
        (make-game-state (- (size-of-pile game-state 1)
                            num-coins) 
                         (size-of-pile game-state 2))
        (make-game-state (size-of-pile game-state 1)
                         (- (size-of-pile game-state 2)
                            num-coins)))))

(remove-coins-from-pile (make-game-state 3 2) 5 1)

(define make-game-state
  (lambda (n m) (* (expt 2 n) (expt 3 m))))

(define size-of-pile
  (lambda (game-state pile-number)
    (if (= pile-number 1)
        (exponent-of-in 2 game-state)
        (exponent-of-in 3 game-state))))

(define make-game-state
  (lambda (n m)
    (lambda (x)
      (if (odd? x)
          n
          m))))

(define size-of-pile
  (lambda (game-state pile-number)
    (game-state pile-number)))

(size-of-pile (* 6 6) 1)

(size-of-pile sqrt 1)

(sqrt (make-game-state 3 6))

((make-game-state 3 6) 7)

(define make-game-state
  (lambda (n m) (cons n m)))

(define size-of-pile
  (lambda (game-state pile-number)
    (if (= pile-number 1)
        (car game-state)
        (cdr game-state))))

(define make-game-state cons)

;; Sidebar: Game State ADT Implementation

(define make-game-state
  (lambda (n m) (cons n m)))

(define size-of-pile
  (lambda (game-state pile-number)
    (if (= pile-number 1)
        (car game-state)
        (cdr game-state))))

(define remove-coins-from-pile
  (lambda (game-state num-coins pile-number)
    (if (= pile-number 1)
        (make-game-state (- (size-of-pile game-state 1)
                            num-coins) 
                         (size-of-pile game-state 2))
        (make-game-state (size-of-pile game-state 1)
                         (- (size-of-pile game-state 2)
                            num-coins)))))

(define display-game-state
  (lambda (game-state)
    (newline)
    (newline)
    (display "    Pile 1: ")
    (display (size-of-pile game-state 1))
    (newline)
    (display "    Pile 2: ")
    (display (size-of-pile game-state 2))
    (newline)
    (newline)))

(define total-size
  (lambda (game-state)
    (+ (size-of-pile game-state 1)
       (size-of-pile game-state 2))))

;; 6.4  Three-Pile Nim

(define make-game-state
  (lambda (n m k) (cons k (cons n m))))

(define size-of-pile
  (lambda (game-state pile-number)
    (cond ((= pile-number 3) 
           (car game-state))
          ((= pile-number 1) 
           (car (cdr game-state)))
          (else ;pile-number must be 2 
           (cdr (cdr game-state))))))

(define p1 (cons 1 2))
(define p2 (cons 3 p1))

;; 6.5  An Application: Adding Strategies to Nim

;; Sidebar: Type Checking

(display-game-state
  (next-game-state (make-move-instruction 1 1) 
                   (make-game-state 5 8)))

    Pile 1: 1
    Pile 2: -4

(next-game-state (make-move-instruction 1 1)
                 (make-game-state 5 8))

;; (end of sidebar)

(define simple-strategy
  (lambda (game-state)
    (if (> (size-of-pile game-state 1) 0) 
        (make-move-instruction 1 1)
        (make-move-instruction 1 2))))

(play-with-turns (make-game-state 5 8) 'human simple-strategy)

(play-with-turns (make-game-state 5 8)
                 'human 
                 (random-mix-of simple-strategy
                                take-all-of-first-nonempty))

;; Review Problems

(define my-interval (make-interval 3 7))

(upper-endpoint my-interval)
;Value: 7

(mid-point my-interval)
;Value: 5

(right-half my-interval)

(make-3D-vector x y z)
(x-coord vector)
(y-coord vector)
(z-coord vector)

(make-schedule-item 'OH321 'MC27 1230)

(room (make-schedule-item 'OH321 'MC27 1230))
;Value: OH321

(course (make-schedule-item 'OH321 'MC27 1230))
;Value: MC27

(time (make-schedule-item 'OH321 'MC27 1230))
;Value: 1230

(define game-state-< (make-game-state-comparator <))

(game-state-< (make-game-state 3 7) (make-game-state 1 12))
;Value: #t

(define game-state-> (make-game-state-comparator >))

(game-state-> (make-game-state 3 7) (make-game-state 1 12))
;Value: #f

(game-state-> (make-game-state 13 7) (make-game-state 1 12))
;Value: #t

(define pt-1 (make-point -1 -1))

(define pt-2 (make-point -1 1))

(distance pt-1 pt-2)
;Value: 2
