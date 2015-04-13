;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter23.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)
(require htdp/dir)

(define d0 (create-dir "D:\\cppcode\\Lisp"))

(define (how-many atree)
  (cond [(file? atree) 1]
        [else (+ (length (dir-files atree))
                 (foldr + 0 (map how-many (dir-dirs atree))))]))

(define (find? atree filename)
  (cond [(file? atree) (symbol=? filename (file-name atree))]
        [else (local ((define (find-name t) (find? t filename)))
                (or (ormap find-name (dir-dirs atree))
                    (ormap find-name (dir-files atree))))]))
(check-expect (find? d0 'Chapter19.rkt) #t)
(check-expect (find? d0 'Chapter129.rkt) #f)

(define (ls atree)
  (cond [(file? atree) (list (file-name atree))]
        [else (cons (dir-name atree)
                    (append (map file-name (dir-files atree))
                            (foldr append empty (map ls (dir-dirs atree)))))]))

(define (du atree)
  (cond [(file? atree) (file-size atree)]
        [else (+ 1
                 (foldr + 0 (map file-size (dir-files atree)))
                 (foldr + 0 (map du (dir-dirs atree))))]))

(define (find-all atree filename)
  (cond [(file? atree) (local ((define (checkfile name)
                                 (if (symbol=? name filename) (list (list name)) false))) 
                         (checkfile (file-name atree)))]
        [else (local ((define (removefalse l)
                        (cond [(empty? l) empty]
                              [else (local ((define removetail (removefalse (rest l)))
                                            (define head (first l)))
                                      (if (boolean? head) removetail (cons head removetail)))]))
                      (define (findit t) (find-all t filename))
                      (define (conspath p) (cons (dir-name atree) p))
                      (define sublist (foldr append empty (removefalse (map findit (append (dir-files atree) (dir-dirs atree)))))))
                (if (empty? sublist) false (map conspath sublist)))]))

(define (ls-R atree)
  (cond [(file? atree) (list (list (file-name atree)))]
        [else (map (lambda (l) (cons (dir-name atree) l)) (foldr append empty (map ls-R (append (dir-files atree) (dir-dirs atree)))))]))

































































