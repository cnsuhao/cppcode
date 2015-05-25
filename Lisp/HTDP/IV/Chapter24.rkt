;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Chapter24) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
(require 2htdp/universe)
(require racket/trace)

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
    ((define (numeric?-op sa)
       (and (symbol? sa) (or (symbol=? sa `+) (symbol=? sa `*))))
     (define (numeric?-sl sl)
       (and (numeric?-op (first sl)) (andmap numeric? (rest sl)))))
    (cond
      [(atom? s) (number? s)]
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

(define (lookup-def da f)
  (local ((define result (search-def da f)))
    (if (eq? result false) (error "can't find function" f) result)))

(define (search-def da f)
  (if (empty? da) false
      (local ((define first-func (first da)))
        (if (symbol=? (def-name first-func) f) first-func (lookup-def (rest da) f)))))


; see exercise 293

(define (eval-function func arg da-f da-v)
  (eval-function* (def-body func) da-f (cons (list (def-para func) arg) da-v)))

(define (eval-atom a da-v)
  (cond [(symbol? a) (lookup-con da-v a)]
        [else a]))
 
(define (eval+* op left right)
  (cond [(symbol=? op `+) (+ left right)]
        [(symbol=? op `*) (* left right)]))

(define (eval-function* exp da-f da-v)
  (if (atom? exp) (eval-atom exp da-v)
      (local ((define op (first exp)))
        (cond [(or (symbol=? op `+) (symbol=? op `*))
               (eval+* op (eval-function* (second exp) da-f da-v) 
                       (eval-function* (third exp) da-f da-v))]
              [else      
               (local ((define func (lookup-def da-f op))
                       (define arg (eval-function* (second exp) da-f da-v)))
                 (eval-function func arg da-f da-v))]))))
(trace eval-function*)


;{S-expr} -> (tech "BSL-fun-def")
; creates representation of a BSL definition for s (if possible)
(define (def-parse s)
  (local (; S-expr -> BSL-fun-def
          (define (def-parse s)
            (cond
              [(atom? s) (error s " is a atom!")]
              [else
               (if (and (= (length s) 3) (eq? (first s) 'define))
                   (head-parse (second s) (third s))
                   (error s " wrong"))]))
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

(define (def-try-parse s)
  (local (; S-expr -> BSL-fun-def
          (define (def-parse s)
            (cond
              [(atom? s) #f]
              [else
               (if (and (= (length s) 3) (eq? (first s) 'define))
                   (head-parse (second s) (third s))
                   #f)]))
          ; S-expr BSL-expr -> BSL-fun-def
          (define (head-parse s body)
            (cond
              [(atom? s) #f]
              [else
               (if (not (= (length s) 2))
                   #f
                   (local ((define name (first s))
                           (define para (second s)))
                     (if (and (symbol? name) (symbol? para))
                         (make-def name para body)
                         #f)))])))
    (def-parse s)))

(define (myparse s-exp da-f da-v)
  (if (empty? s-exp) #t
      (local ((define defOrF (def-try-parse (first s-exp))))
        (if (def? defOrF) 
            (myparse (rest s-exp) (cons defOrF da-f) da-v)
            (eval-function* (first s-exp) da-f da-v)))))
(trace myparse)
(myparse
    `((define (f x) (+ 3 x))
      (define (g y) (f (* 2 y)))
      (define (h v) (+ (f v) (g v)))
      (h 2)) empty empty)


















































