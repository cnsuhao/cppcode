;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter23) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define-struct file [name size content])
(define-struct dirv3 [name dirs files])

(define dtree
  (local ((define Text 
            (local ((define part1 (make-file "part1" 99 ""))
                    (define part2 (make-file "part2" 52 ""))
                    (define part3 (make-file "part3" 17 "")))
              (make-dirv3 "Text" empty (list part1 part2 part3))))
          (define Libs
            (local ((define Code
                      (local ((define hang (make-file "hang" 8 ""))
                              (define draw (make-file "draw" 2 "")))
                        (make-dirv3 "Code" empty (list hang draw))))
                    (define Docs (make-dirv3 "Docs" empty (list (make-file "read!" 19 "")))))
              (make-dirv3 "Libs" (list Code Docs) empty)))
          (define read! (make-file "read!" 10 "")))
    (make-dirv3 "TS" (list Text Libs) (list read!))))

(define (how-many atree)
  (cond [(file? atree) 1]
        [else (+ (length (dirv3-files atree))
                 (foldr + 0 (map how-many (dirv3-dirs atree))))]))
(check-expect (how-many dtree) 7)











































































