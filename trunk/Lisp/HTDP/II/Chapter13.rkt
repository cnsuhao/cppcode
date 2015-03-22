;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define (arrangements w)
  (cond
    [(empty? w) (list empty)]
    [else (insert-everywhere/in-all-words (first w)
            (arrangements (rest w)))]))
(define (insert-everywhere/in-all-words c llc)
  (cond [(empty? llc) empty]
        [else (append (insert-between c empty (first llc))
                    (insert-everywhere/in-all-words c (rest llc)))]))

(define (insert-between c lc-pre lc-post)
  (cond [(empty? lc-post) (cons (reverse (cons c lc-pre)) empty)]
        [else (cons (append (reverse lc-pre) (cons c lc-post))
                    (insert-between c (cons (first lc-post) lc-pre) (rest lc-post)))]))

(define (arrange-main word)
  (implode-arrange (arrangements (explode word))))
(define (implode-arrange llc)
  (cond [(empty? llc) empty]
        [else (cons (implode (first llc)) (implode-arrange (rest llc)))]))

(define-struct feeding [food snake])
(define-struct seg [pos dir])
(define (posn=? p1 p2)
  (and (= (posn-x p1) (posn-x p2)) (= (posn-y p1) (posn-y p2))))

(define (posn+ p1 p2)
  (make-posn (+ (posn-x p1) (posn-x p2))
             (+ (posn-y p1) (posn-y p2))))
(define (seg-next s)
  (make-seg (posn+ (seg-pos s) (seg-dir s)) (seg-dir s)))

(check-expect (seg-next (make-seg (make-posn 1 2) (make-posn 3 4)))
              (make-seg (make-posn 4 6) (make-posn 3 4)))

(define MAX 210)
(define STEP 6)
; Posn -> Posn 
; ???
(define (food-create p)
  (food-check-create p (make-posn (* 6 (random (/ MAX 6))) 
                                  (* 6 (random (/ MAX 6))))))
; Posn Posn -> Posn 
; generative recursion 
; ???
(define (food-check-create p candidate)
  (if (equal? p candidate) (food-create p) candidate))

(define (snake-next snake food)
  (snake-next-impl food (seg-next (first snake)) snake))
(define (snake-next-impl food nseg snake)
  (if (posn=? food (seg-pos nseg))
      (make-feeding
       (food-create food)
       (cons nseg snake))
      (make-feeding 
       food
       (cons nseg (snake-removelast snake)))))
(define (snake-removelast tail)
  (cond [(empty? (rest tail)) empty]
        [else (cons (first tail) (snake-removelast (rest tail)))]))

(define (ontick ws)
  (snake-next (feeding-snake ws) (feeding-food ws)))
      
(define (onkey ws a-key)
  (snake-change (feeding-snake ws) (feeding-food ws) a-key))

(define (snake-setdir snake dir)
  (cons (make-seg (seg-pos (first snake)) dir)
        (rest snake)))

(define (snake-change snake food a-key)
  (make-feeding
   food
   (cond [(key=? a-key "left") (snake-setdir snake (make-posn (* -1 STEP) 0))]
         [(key=? a-key "right") (snake-setdir snake (make-posn STEP 0))]
         [(key=? a-key "up") (snake-setdir snake (make-posn 0 (* -1 STEP)))]
         [(key=? a-key "down") (snake-setdir snake (make-posn 0 STEP))]
         [else snake])))

(define MT (empty-scene MAX MAX))
(define FOOD (circle 3 "solid" "green"))
(define SEG (circle 3 "solid" "red"))
(define (onrender ws)
  (renderfood (feeding-food ws) (rendersnake (feeding-snake ws) MT)))
(define (renderfood food BG)
  (place-image FOOD (posn-x food) (posn-y food) BG))

(define (rendersnake snake BG)
  (cond [(empty? snake) BG]
        [else (rendersnake-impl snake BG (seg-pos (first snake)))]))
(define (rendersnake-impl snake BG headpos)
  (place-image SEG (posn-x headpos) (posn-y headpos) (rendersnake (rest snake) BG)))

(define (whentostop ws)
  (dead (feeding-snake ws)))
(define (dead snake)
  (or (hitwall? (seg-pos (first snake))) (biteself? snake)))
(define (hitwall? headpos)
  (or (<= (posn-x headpos) 0)
      (<= (posn-y headpos) 0)
      (>= (posn-x headpos) MAX)
      (>= (posn-y headpos) MAX)))
(define (biteself? snake)
  (samepos? (first snake) (rest snake)))
(define (samepos? head tail)
  (cond [(empty? tail) false]
        [else (or (posn=? (seg-pos head) (seg-pos (first tail)))
                  (samepos? head (rest tail)))]))
               
(define (worm-main ws)
  (big-bang ws (on-tick ontick 0.3)
            (on-key onkey)
            (stop-when whentostop)
            (to-draw onrender)))
(define snake-init 
  (cons (make-seg (make-posn 18 6) (make-posn STEP 0))
        (cons (make-seg (make-posn 12 6) (make-posn STEP 0))
              (cons (make-seg (make-posn 6 6) (make-posn STEP 0)) empty))))
(define feeding-init
  (make-feeding (make-posn 60 60) snake-init))
                
; String String -> ... Deeply Nested List ...
; produces a (representation of) a web page with given author and title
(define (my-first-web-page author title)
  `(html
     (head
       (title ,title)
       (meta ((http-equiv "content-type")
              (content "text-html"))))
     (body
       (h1 ,title)
       (p "I, " ,author ", made this page."))))             
              
; List-of-numbers -> ... Nested List ...
; creates a row for an HTML table from a list of numbers 
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l)) (make-row (rest l)))]))
 
; Number -> ... Nested List ...
; creates a cell for an HTML table from a number 
(define (make-cell n)
  `(td ,(number->string n)))              
; List-of-numbers List-of-numbers -> ... Nested List ...
; creates an HTML table from two lists of numbers 
(define (make-table row1 row2)
  `(table ((border "1"))
          (tr ,@(make-row row1))
          (tr ,@(make-row row2))))              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              