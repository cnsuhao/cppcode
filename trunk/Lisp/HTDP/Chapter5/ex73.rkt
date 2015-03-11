;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname htdp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define WIDTH 200)
(define HEIGHT 20)
(define-struct editor [pre post])
(define BG (empty-scene WIDTH HEIGHT))
(define CUSUR (rectangle 1 HEIGHT "solid" 'red))

(define (render ed)
  (overlay/align "left" "center"
                 (combineTxt (editor-pre ed) (editor-post ed)) BG))

(define (combineTxt pre post)
  (beside (text pre 11 'black) CUSUR (text post 11 'black)))
(define (isfull pre post)
  (> (image-width (combineTxt pre post)) WIDTH))
 
(define (string-first str)
  (cond [(= (string-length str) 0) ""]
        [else (substring str 0 1)]))
(define (string-remove-first str)
  (cond [(= (string-length str) 0) ""]
        [else (substring str 1 (string-length str))]))

(define (string-last str)
  (cond [(= (string-length str) 0) ""]
        [else (substring str (sub1 (string-length str)))]))
(define (string-remove-last str)
  (cond [(= (string-length str) 0) ""]
        [else (substring str 0 (sub1 (string-length str)))]))

(define (edit ed ke)
  (edit-implement ke (editor-pre ed) (editor-post ed)))

(define (edit-implement ke pre post)
  (cond [(string=? ke "left") 
         (make-editor (string-remove-last pre) 
                      (string-append (string-last pre) post))]
        [(string=? ke "right") 
         (make-editor (string-append pre (string-first post))
                      (string-remove-first post))]
        [else (make-editor (cond [(isfull (string-append pre ke) post) pre]
                                 [else (string-append pre ke)])
                           post)]))

(define (run str)
  (big-bang (make-editor str "")
            (to-draw render)
            (on-key edit)))

              