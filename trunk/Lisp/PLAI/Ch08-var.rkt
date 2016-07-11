#lang plai-typed

(define new-loc
  (let ([n (box 0)])
    (lambda ()
      (begin
        (set-box! n (add1 (unbox n)))
        (unbox n)))))

(define-type ExprC
  [numC (n : number)]
  [varC (s : symbol)]
  [appC (fun : ExprC) (arg : ExprC)]
  [plusC (l : ExprC) (r : ExprC)]
  [multC (l : ExprC) (r : ExprC)]
  [lamC (arg : symbol) (body : ExprC)]
  [setC (var : symbol) (v : ExprC)]
  [seqC (b1 : ExprC) (b2 : ExprC)])

(define-type-alias Location number)

(define-type Value
  [numV (n : number)]
  [closV (arg : symbol) (body : ExprC) (env : Env)])

(define-type Binding
  [bind (name : symbol) (val : Location)])
 
(define-type-alias Env (listof Binding))
(define mt-env empty)
(define extend-env cons)
 
(define-type Storage
  [cell (location : Location) (val : Value)])
 
(define-type-alias Store (listof Storage))
(define mt-store empty)
(define override-store cons)

(define (lookup [for : symbol] [env : Env]) : Location
  (if (empty? env)
      (error 'lookup (string-append "Can't find sysbol:" (to-string for)))
      (if (symbol=? for (bind-name (first env)))
          (bind-val (first env))
          (lookup for (rest env)))))
                    
(define (fetch [loc : Location] [sto : Store]) : Value
  (if (empty? sto)
      (error 'lookup (string-append "Can't find loc:" (to-string loc)))
      (if (= loc (cell-location (first sto)))
          (cell-val (first sto))
          (fetch loc (rest sto)))))

(define-type Result
  [v*s (v : Value) (s : Store)])

(define (num+ [l : Value] [r : Value]) : Value
  (if (and (numV? l) (numV? r))
      (numV (+ (numV-n l) (numV-n r)))
      (error 'num+ "wrong params")))

(define (num* [l : Value] [r : Value]) : Value
  (if (and (numV? l) (numV? r))
      (numV (* (numV-n l) (numV-n r)))
      (error 'num+ "wrong params")))

(define (interp [expr : ExprC] [env : Env] [sto : Store]) : Result
  (type-case ExprC expr
    [numC (n) (v*s (numV n) sto)]
    [varC (n) (v*s (fetch (lookup n env) sto) sto)]
    [appC (f a) (type-case Result (interp f env sto)
                  [v*s (v-f s-f)
                       (type-case Result (interp a env s-f)
                         [v*s (v-a s-a)
                              (let ((where (new-loc)))
                                (interp (closV-body v-f)
                                        (extend-env (bind (closV-arg v-f) where)
                                                    (closV-env v-f))
                                        (override-store (cell where v-a) s-a)))])])]
    [plusC (l r) (type-case Result (interp l env sto)
                   [v*s (v-l s-l)
                        (type-case Result (interp r env s-l)
                          [v*s (v-r s-r)
                               (v*s (num+ v-l v-r) s-r)])])]
    [multC (l r) (type-case Result (interp l env sto)
                   [v*s (v-l s-l)
                        (type-case Result (interp r env s-l)
                          [v*s (v-r s-r)
                               (v*s (num* v-l v-r) s-r)])])]
    [lamC (a b) (v*s (closV a b env) sto)]
    [setC (var val) (type-case Result (interp val env sto)
                      [v*s (v-val s-val)
                           (let ([where (lookup var env)])
                             (v*s v-val
                                  (override-store (cell where v-val)
                                                  s-val)))])]
    [seqC (b1 b2) (type-case Result (interp b1 env sto)
                    [v*s (v-b1 s-b1)
                         (interp b2 env s-b1)])]))

(interp (appC (lamC 'm-var (seqC (setC 'm-var (plusC (numC 1) (varC 'm-var)))
                                 (varC 'm-var)))
              (numC 1))
        mt-env
        mt-store)




