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

































