#lang plai-typed

(define-type Type
  [numT]
  [funT (arg : Type) (ret : Type)])

(define-type Binding
  [bind (name : symbol) (val : Type)])
 
(define-type-alias TyEnv (listof Binding))
(define mt-ty-env empty)
(define extend-ty-env cons)

(define (lookup n tenv)
  (if (empty? tenv) (error 'lookup "can't find")
      (let ((first-bind (first tenv)))
        (if (symbol=? (bind-name first-bind) n)
            (bind-val first-bind)
            (lookup n (rest tenv))))))

(define-type TyExprC
  [numC (n : number)]
  [idC (s : symbol)]
  [appC (fun : TyExprC) (arg : TyExprC)]
  [plusC (l : TyExprC) (r : TyExprC)]
  [multC (l : TyExprC) (r : TyExprC)]
  [ifC (test : TyExprC) (conc : TyExprC) (alt : TyExprC)]
  [lamC (arg : symbol) (argT : Type) (retT : Type) (body : TyExprC)]
  [recC (func : symbol) (arg : symbol) (argT : Type) (retT : Type) (body : TyExprC) (use : TyExprC)]
  )

(define-type Value
  [numV (n : number)]
  [closV (arg : symbol) (body : TyExprC) (env : TyEnv)])

(define (tc [expr : TyExprC] [tenv : TyEnv]) : Type
  (type-case TyExprC expr
    [numC (n) (numT)]
    [idC (n) (lookup n tenv)]
    [plusC (l r) (let ([lt (tc l tenv)]
                       [rt (tc r tenv)])
                   (if (and (equal? lt (numT))
                            (equal? rt (numT)))
                       (numT)
                       (error 'tc "+ not both numbers")))]
    [multC (l r) (let ([lt (tc l tenv)]
                       [rt (tc r tenv)])
                   (if (and (equal? lt (numT))
                            (equal? rt (numT)))
                       (numT)
                       (error 'tc "* not both numbers")))]
    [ifC (cond conc alt)
         (let ([conc-t (tc conc tenv)]
               [alt-t (tc alt tenv)])
           alt-t)]
    [appC (f a) (let ([ft (tc f tenv)]
                      [at (tc a tenv)])
                  (cond
                    [(not (funT? ft))
                     (error 'tc "not a function")]
                    [(not (equal? (funT-arg ft) at))
                     (error 'tc "app arg mismatch")]
                    [else (funT-ret ft)]))]
    [lamC (a argT retT b)
          (if (equal? (tc b (extend-ty-env (bind a argT) tenv)) retT)
              (funT argT retT)
              (error 'tc "lam type mismatch"))]
    [recC (f a aT rT b u)
      (let ([extended-env
             (extend-ty-env (bind f (funT aT rT)) tenv)])
        (cond
          [(not (equal? rT (tc b
                               (extend-ty-env
                                (bind a aT)
                                extended-env))))
           (error 'tc "body return type not correct")]
          [else (tc u extended-env)]))]
    ))

;(tc (lamC 'y (numT) (numT) (plusC (idC 'y) (numC 1))) mt-ty-env)
;(tc (lamC 'x (numT) (funT (numT) (numT)) (lamC 'y (numT) (numT) (plusC (idC 'y) (idC 'x)))) mt-ty-env)

(tc (recC 'E 'n (numT) (numT)
          (ifC (idC 'n)
               (numC 0)
               (plusC (idC 'n) (appC (idC 'E) (plusC (idC 'n) (numC -1)))))
          (appC (idC 'E) (numC 10)))
    mt-ty-env)

(define-type BTnum
  [BTmt]
  [BTnd (n : number) (l : BTnum) (r : BTnum)])

(define-syntax define-poly
  (syntax-rules ()
    [(_ (name tyvar) body)
     (define-syntax (name stx)
       (syntax-case stx ()
         [(_ type)
          (with-syntax ([tyvar #'type])
            #'body)]))]))
(define-poly (id t) (lambda ([x : t]) : t x))
(define id_num (id number))

(define-poly (filter t)
  (lambda ([f : (t -> boolean)] [l : (listof t)]) : (listof t)
    (cond
      [(empty? l) empty]
      [(cons? l) (if (f (first l))
                     (cons (first l)
                           ((filter t) f (rest l)))
                     ((filter t) f (rest l)))])))

(define (mapper f l)
  (cond
    [(empty? l) empty]
    [(cons? l) (cons (f (first l)) (mapper f (rest l)))]))



































