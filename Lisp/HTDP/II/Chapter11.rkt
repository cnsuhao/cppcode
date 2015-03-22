;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define-struct editor [pre post])
; An Editor is (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – empty 
; – (cons 1String Lo1S)

(define (str2list str index)
  (cond [(>= index (string-length str)) empty]
        [else (cons (substring str index (add1 index))
                    (str2list str (add1 index)))]))

(define (create-editor str-pre str-post)
  (make-editor (reverse (str2list str-pre 0)) (str2list str-post 0)))

; constants 
(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
; graphical constants 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red")) 
; Editor KeyEvent -> Editor
; deals with a key event, given some editor
(define (editor-kh ed k)
  (cond
    [(key=? k "left") (editor-lft ed)]
    [(key=? k "right") (editor-rgt ed)]
    [(key=? k "\b") (editor-del ed)]
    [(key=? k "\t") ed]
    [(key=? k "\r") ed]
    [(= (string-length k) 1) (editor-ins ed k)]
    [else ed]))

(define (editor-ins ed k)
  (make-editor (cons k (editor-pre ed)) (editor-post ed)))

; Editor -> Editor
; moves the cursor position one 1String left, if possible 
(define (editor-lft ed)
  (editor-lft-impl (editor-pre ed) (editor-post ed)))
(define (editor-lft-impl pre post)
  (cond [(empty? pre) (make-editor pre post)]
        [else (make-editor (rest pre) (cons (first pre) post))]))
; Editor -> Editor
; moves the cursor position one 1String right, if possible 
(define (editor-rgt ed)
  (editor-rgt-impl (editor-pre ed) (editor-post ed)))
(define (editor-rgt-impl pre post)
  (cond [(empty? post) (make-editor pre post)]
        [else (make-editor (cons (first post) pre) (rest post))]))
 
; Editor -> Editor
; deletes one 1String to the left of the cursor, if possible 
(define (editor-del ed)
  (editor-del-impl (editor-pre ed) (editor-post ed)))
(define (editor-del-impl pre post)
  (cond [(empty? pre) (make-editor pre post)]
        [else (make-editor (rest pre) post)]))
  
(check-expect (editor-kh (create-editor "" "") "e")
              (create-editor "e" ""))
(check-expect (editor-kh (create-editor "cd" "fgh") "e")
              (create-editor "cde" "fgh"))

(define (editor-text s)
  (text (implode s) FONT-SIZE FONT-COLOR))

(define (editor-render e)
  (place-image/align
   (beside (editor-text (reverse (editor-pre e)))
           CURSOR
           (editor-text (editor-post e)))
   1 1
   "left" "top"
   MT))
  
; main : String -> Editor
; launches the editor given some initial string 
(define (main s)
   (big-bang (create-editor s "")
             (on-key editor-kh)
             (to-draw editor-render)))










































