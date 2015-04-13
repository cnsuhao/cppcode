;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define-struct no-parent [])
(define MTFT (make-no-parent))
(define-struct child [father mother name date eyes])

; Oldest Generation:
(define Carl (make-child MTFT MTFT "Carl" 1926 "green"))
(define Bettina (make-child MTFT MTFT "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child MTFT MTFT "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))

(check-expect (blue-eyed-child? Carl) false)
(check-expect (blue-eyed-child? Gustav) true)
 
(define (blue-eyed-child? a-ftree)
  (cond
    [(no-parent? a-ftree) false]
    [else (or (string=? (child-eyes a-ftree) "blue")
              (blue-eyed-child? (child-father a-ftree))
              (blue-eyed-child? (child-mother a-ftree)))]))

(define (count-persons a-ftree)
  (cond
    [(no-parent? a-ftree) 0]
    [else (+ 1
             (count-persons (child-father a-ftree))
             (count-persons (child-mother a-ftree)))]))

(check-expect (count-persons Gustav) 5)
(check-expect (count-persons Eva) 3)

(define-struct ages [year count])
(define (ages-add a1 a2)
  (make-ages (+ (ages-year a1) (ages-year a2)) 
             (+ (ages-count a1) (ages-count a2))
             ))
(define (average-age a-ftree year)
  (local
    ((define ages (countage a-ftree year)))
    (/ (ages-year ages) (ages-count ages))))
(define (countage a-ftree year)
  (cond
    [(no-parent? a-ftree) (make-ages 0 0)]
    [else (ages-add 
           (make-ages (- year (child-date a-ftree)) 1)
           (ages-add
            (countage (child-father a-ftree) year)
            (countage (child-mother a-ftree) year)))]))

(check-expect (average-age Adam 1960) 26)

(define (eye-colors a-ftree)
  (cond
    [(no-parent? a-ftree) empty]
    [else (cons (child-eyes a-ftree)
                (append (eye-colors (child-father a-ftree))
                        (eye-colors (child-mother a-ftree))))]))
(check-expect (eye-colors Gustav)
              `("brown" "pink" "blue" "green" "green"))

(define ff1 (list Carl Bettina))
(define ff2 (list Fred Eva))
(define ff3 (list Fred Eva Carl))

(check-expect (blue-eyed-child-in-forest? ff1) false)
(check-expect (blue-eyed-child-in-forest? ff2) true)
(check-expect (blue-eyed-child-in-forest? ff3) true)
 
(define (blue-eyed-child-in-forest? a-forest)
  (ormap blue-eyed-child? a-forest))

(define (average-age-f a-forest year)
  (local
    ((define (countage-f a-forest year)
       (cond [(empty? a-forest) (make-ages 0 0)]
             [else (ages-add
                    (countage (first a-forest) year)
                    (countage-f (rest a-forest) year))]))
     (define ages (countage-f a-forest year)))
    (/ (ages-year ages) (ages-count ages))))

(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

(define (atom? v)
  (or (number? v) (string? v) (symbol? v)))
(define (count sexp sy)
  (local (; S-expr Symbol -> N 
          ; the main function 
          (define (count-sexp sexp sy)
            (cond
              [(atom? sexp) (count-atom sexp sy)]
              [else (count-sl sexp sy)]))
 
          ; SL Symbol -> N 
          ; counts all occurrences of sy in sl 
          (define (count-sl sl sy)
            (cond
              [(empty? sl) 0]
              [else (+ (count-sexp (first sl) sy)
                       (count-sl (rest sl) sy))]))
 
          ; Atom Symbol -> N 
          ; counts all occurrences of sy in at 
          (define (count-atom at sy)
            (cond
              [(number? at) 0]
              [(string? at) 0]
              [(symbol? at) (if (symbol=? at sy) 1 0)])))
    ; — IN —
    (count-sexp sexp sy)))

(check-expect (depth 'world) 1)
(check-expect (depth '(world)) 2)
(check-expect (depth '(world (hehe))) 3)
(define (depth sexp)
  (local
    ((define (depth-l sexp)
       (cond [(empty? sexp) 1]
             [else (local
                     ((define first-depth (+ 1 (depth (first sexp))))
                      (define rest-depth (depth-l (rest sexp))))
                     (if (> first-depth rest-depth) first-depth rest-depth))])))
  (cond [(atom? sexp) 1]
        [else (depth-l sexp)])))

(check-expect (substitute 'world 'world 'hehe) 'hehe)
(check-expect (substitute '(world) 'world 'hehe) '(hehe))
(check-expect (substitute '(world (hehe)) 'world 'hehe) '(hehe (hehe)))
(define (substitute sexp old new)
  (cond [(atom? sexp) (if (eq? sexp old) new sexp)]
        [else (map (lambda (sl) (substitute sl old new)) sexp)]))
   










































































