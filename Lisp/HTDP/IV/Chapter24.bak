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
            (if (or (number? s) (symbol? s)) s
                (error "strings not allowed"))))
    (parse s)))
(define (eval-bool-expression bs)
  (if (atom? bs) 
      (cond [(symbol=? bs `true) true]
            [(symbol=? bs `false) false]
            [else (error "wrong bool expression")])
      (local ((define op (first bs)))
        (if (not (symbol? op)) (error "wrong bool expression")
            (cond [(symbol=? op `and) (andmap eval-bool-expression (rest bs))]
                  [(symbol=? op `or) (ormap eval-bool-expression (rest bs))]
                  [(symbol=? op `not) (not (eval-bool-expression (second bs)))]
                  [else (error "wrong bool expression")])))))

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
       (andmap numeric? sl)))
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

(define (eval-variable* e da)
  (local ((define (subst* s da)
            (cond [(empty? da) s]
                  [else (local ((define as (first da)))
                          (subst (subst* s (rest da)) (first as) (second as)))]))
          (define e-sub (subst* e da)))
    (if (numeric? e-sub) (eval-variable e-sub)
        (error "have unkonwn var"))))


(define (lookup-con da x)
  (cond [(empty? da) (error "have unkonwn var")]
        [else
         (local ((define head (first da)))
           (if (symbol=? (first head) x) (second head)
               (lookup-con (rest da) x)))]))
(define (eval-var-lookup s da)
  (local
    ((define (eval-atom sa)
       (cond [(number? sa) sa]
             [else (lookup-con da sa)]))
     (define (eval-sl sv)
       (local ((define left (eval-var-lookup (second sv) da))
               (define right (eval-var-lookup (third sv) da)))
         (cond
           [(symbol=? (first sv) `+) (+ left right)]
           [(symbol=? (first sv) `*) (* left right)]))))
    (cond
      [(atom? s) (eval-atom s)]
      [else (eval-sl s)])))
  
(define hehe `((x 1) (y 2) (z 3)))
 
(define-struct def [name para body])
; see exercise 293
 
;{S-expr} -> (tech "BSL-fun-def")
; creates representation of a BSL definition for s (if possible)
(define (def-parse s)
  (local (; S-expr -> BSL-fun-def
          (define (def-parse s)
            (cond
              [(atom? s) (error WRONG)]
              [else
               (if (and (= (length s) 3) (eq? (first s) 'define))
                   (head-parse (second s) (parse (third s) hehe))
                   (error WRONG))]))
          ; S-expr BSL-expr -> BSL-fun-def
          (define (head-parse s body)
            (cond
              [(atom? s) (error WRONG)]
              [else
               (if (not (= (length s) 2))
                   (error WRONG)
                   (local ((define name (first s))
                           (define para (second s)))
                     (if (and (symbol? name) (symbol? para))
                         (make-def name para body)
                         (error WRONG))))])))
    (def-parse s)))




























































