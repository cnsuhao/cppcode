;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter24) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)

(define WRONG "wrong kind of S-expression")

(define-struct add [left right])
(define-struct mul [left right])

(define (atom? s)
  (or (number? s)
      (string? s)
      (symbol? s)))
; S-expr -> BSL-expr
; creates representation of a BSL expression for s (if possible)
(define (parse s)
  (local (; S-expr -> BSL-expr
          (define (parse s)
            (cond
              [(atom? s) (parse-atom s)]
              [else (parse-sl s)]))
          
          ; SL -> BSL-expr 
          (define (parse-sl s)
            (local ((define L (length s)))
              (cond
                [(< L 3)
                 (error WRONG)]
                [(and (= L 3) (symbol? (first s)))
                 (cond
                   [(symbol=? (first s) '+)
                    (make-add (parse (second s)) (parse (third s)))]
                   [(symbol=? (first s) '*)
                    (make-mul (parse (second s)) (parse (third s)))]
                   [else (error WRONG)])]
                [else
                 (error WRONG)])))
          
          ; Atom -> BSL-expr 
          (define (parse-atom s)
            (cond
              [(number? s) s]
              [(string? s) (error "strings not allowed")]
              [(symbol? s) (error "symbols not allowed")])))
    (parse s)))

(define (subst s x v)
  (local
    ((define (subst-atom sa)
       (if (and (symbol? sa) (symbol=? sa x)) v sa))
     (define (subst-sl sl)
       (cond [(empty? sl) empty]
             [else (cons (subst (first sl) x v)
                         (subst-sl (rest sl)))])))
    (cond
      [(atom? s) (subst-atom s)]
      [else (subst-sl s)])))

(define (numeric? s)
  (local
    ((define (numeric?-atom sa)
       (cond [(symbol? sa) (or (symbol=? sa `+) (symbol=? sa `*))]
             [(number? sa) #t]
             [else #f]))
     (define (numeric?-sl sl)
       (cond [(empty? sl) #t]
             [else (and (numeric? (first sl))
                        (numeric?-sl (rest sl)))])))
    (cond
      [(atom? s) (numeric?-atom s)]
      [else (numeric?-sl s)])))

(define (eval-variable s)
  (local
    ((define (eval sv)
       (cond [(atom? sv) sv]
             [else (cond
                     [(symbol=? (first sv) `+) (+ (eval (second sv)) (eval (third sv)))]
                     [(symbol=? (first sv) `*) (* (eval (second sv)) (eval (third sv)))])])))
    (if (numeric? s) (eval s)
        (error "have unkonwn var"))))

(eval-variable `(+ (* 2 11) 3))
































































