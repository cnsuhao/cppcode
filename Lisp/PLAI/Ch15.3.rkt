#lang plai-typed

(define (append3 l1 l2 l3)
  (append (append l1 l2) l3))
(define-type ExprC
  [numC (n : number)]
  [idC (s : symbol)]
  [appC (fun : ExprC) (arg : ExprC)]
  [plusC (l : ExprC) (r : ExprC)]
  
  [lamC (arg : symbol) (body : ExprC)]
  
  )

(define-type Constraints
  [eqCon (lhs : Term) (rhs : Term)])
 
(define-type Term
  [tExp (e : ExprC)]
  [tVar (s : symbol)]
  [tNum]
  [tArrow (dom : Term) (rng : Term)])

(define (cg [e : ExprC]) : (listof Constraints)
  (type-case ExprC e
    [numC (_) (list (eqCon (tExp e) (tNum)))]
    [idC (s) (list (eqCon (tExp e) (tVar s)))]
    [plusC (l r) (append3 (cg l)
                          (cg r)
                          (list (eqCon (tExp l) (tNum))
                                (eqCon (tExp r) (tNum))
                                (eqCon (tExp e) (tNum))))]
    [lamC (a b) (append (cg b)
                        (list (eqCon (tExp e) (tArrow (tVar a) (tExp b)))))]
    [appC (f a) (append3 (cg f)
                         (cg a)
                         (list (eqCon (tExp f) (tArrow (tExp a) (tExp e)))))]
    ))

(define-type-alias Subst (listof Substitution))
(define-type Substitution
  [sub [var : Term] [is : Term]])
 
(define (unify [cs : (listof Constraints)]) : Subst
  (unify/Θ cs empty))
(define (unify/Θ [cs : (listof Constraints)] [Θ : Subst]) : Subst
  (cond
    [(empty? cs) Θ]
    [(cons? cs)
     (let ([l (eqCon-lhs (first cs))]
           [r (eqCon-rhs (first cs))])
       (type-case Term l
         [tVar (s) (type-case (optionof Term) (lookup l Θ)
                     [some (bound)
                           (unify/Θ (cons (eqCon bound r)
                                          (rest cs))
                                    Θ)]
                     [none ()
                           (unify/Θ (rest cs)
                                    (extend+replace l r Θ))])]
         
         [tExp (e) (type-case (optionof Term) (lookup l Θ)
                     [some (bound)
                           (unify/Θ (cons (eqCon bound r)
                                          (rest cs))
                                    Θ)]
                     [none ()
                           (unify/Θ (rest cs)
                                    (extend+replace l r Θ))])]
         [tNum () (type-case Term r
                    [tNum () (unify/Θ (rest cs) Θ)]
                    [else (error 'unify "number and something else")])]
         [tArrow (d r) (type-case Term r
                         [tArrow (d2 r2)
                                 (unify/Θ (cons (eqCon d d2)
                                                (cons (eqCon r r2)
                                                      cs))
                                          Θ)]
                         [else (error 'unify "arrow and something else")])]
         ))]))



























