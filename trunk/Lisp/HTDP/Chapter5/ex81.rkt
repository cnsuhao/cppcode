;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex81) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
(define-struct tank [loc vel])

(define TANK-WIDTH 30)
(define TANK_HEIGHT 8)
(define TANK (rectangle TANK-WIDTH TANK_HEIGHT "solid" "blue"))

(define UFO (overlay (circle 5 "solid" "green") (rectangle 30 5 "solid" "green")))

(define MISSILE (triangle 8 "solid" "red"))
(define WIDTH 200)
(define HEIGHT 200)
(define TANK-Y (- HEIGHT TANK_HEIGHT))
(define BACKGROUND (empty-scene 200 200))

(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render (fired-tank s)
                  (ufo-render (fired-ufo s)
                              (missile-render (fired-missile s)
                                              BACKGROUND)))]))

(define (missile-render pos BG)
  (place-image MISSILE (posn-x pos) (posn-y pos) BG))

(define (ufo-render pos BG)
  (place-image UFO (posn-x pos) (posn-y pos) BG))

(define (tank-render tank BG)
  (place-image TANK (tank-loc tank) TANK-Y BG))
          
(define (si-game-over? s)
  (cond
    [(aim? s) (islanded? (aim-ufo s))]
    [(fired? s) (or (islanded? (fired-ufo s)) (ishit? s))]))

(define (distance pos1 pos2)
  (sqrt (+ (sqr (- (posn-x pos1) (posn-x pos2)))
           (sqr (- (posn-y pos1) (posn-y pos2))))))

(define MIN 15)
(define (islanded? pos)
  (< (distance pos (make-posn (posn-x pos) HEIGHT)) MIN))

(define (ishit? s)
  (< (distance (fired-ufo s) (fired-missile s)) MIN))

(define (si-move s)
  (cond [(aim? s) (make-aim (move-ufo (aim-ufo s)) (move-tank (aim-tank s)))]
        [(fired? s) (make-fired (move-ufo (fired-ufo s)) 
                                (move-tank (fired-tank s))
                                (move-missile (fired-missile s)))]))

(define (checkrange val max)
  (cond [(< val 0) 0]
        [(> val max) max]
        [else val]))

(define (move-ufo u)
  (make-posn (cond [(even? (random 15)) (checkrange (+ (posn-x u) 3) WIDTH)]
                   [else (checkrange (- (posn-x u) 3) WIDTH)])
                   (checkrange (+ (posn-y u) 5) HEIGHT)))

(define (move-missile m)
  (make-posn (posn-x m) (checkrange (- (posn-y m) 10) WIDTH)))

(define (move-tank t)
  (make-tank (checkrange (+ (tank-loc t) (tank-vel t)) WIDTH) (tank-vel t)))

(define (presskey s a-key)
  (cond [(or (key=? a-key "right") (key=? a-key "left")) (changetank s (key=? a-key "right"))]
        [(and (key=? a-key " ") (aim? s)) (fire (aim-ufo s) (aim-tank s))]
        [else s]))
(define (changetank s isright)
  (cond [(aim? s) (make-aim (aim-ufo s) 
                            (change-tank (aim-tank s) isright))]
        [(fired? s) (make-fired (fired-ufo s) 
                                (change-tank (fired-tank s) isright)
                                (fired-missile s))]))

(define (change-tank tank isright)
  (make-tank (tank-loc tank)
             (* (if isright 1 -1) (abs (tank-vel tank)))))

(define (fire ufo tank)
  (make-fired ufo tank (make-posn (tank-loc tank) TANK-Y)))

(define (si-main s)
  (big-bang s (on-tick si-move 0.3)
            (on-draw si-render)
            (stop-when si-game-over?)
            (on-key presskey)))







