#lang plai-typed

(define table (make-hash empty))
(define-type-alias label number)

(define new-label
  (let ((nCount 0))
    (lambda ()
      (begin (set! nCount (+ nCount 1))
             nCount))))
(define (read-number/suspend [prompt : string] rest)
  (let ([g (new-label)])
    (begin
      (hash-set! table g rest)
      (display prompt)
      (display " To enter it, use the action field label ")
      (display g)
      )))

;(define (resume [g : label] [n : number])
;  ((some-v (hash-ref table g)) n))
;
;(read-number/suspend "First number"
;                     (lambda (v1)
;                       (read-number/suspend "Second number"
;                                            (lambda (v2)
;                                              (display
;                                               (+ v1 v2))))))


(define-syntax (cps e)
  (syntax-case e (with rec lam cnd seq set quote display read-number generator let/cc)
    
    [(_ (with (v e) b))
     #'(cps ((lam (v) b) e))]
    
    [(_ (rec (v f) b))
     #'(cps (with (v (lam (arg) (error 'dummy "nothing")))
                  (seq
                   (set v f)
                   b)))]
    
    [(_ (lam (a) b))
     (identifier? #'a)
     #'(lambda (k)
         (k (lambda (a dyn-k)
              ((cps b) dyn-k))))]
    
    [(_ (cnd tst thn els))
     #'(lambda (k)
         ((cps tst) (lambda (tstv)
                      (if tstv
                          ((cps thn) k)
                          ((cps els) k)))))]
    
    [(_ (seq e1 e2))
     #'(lambda (k)
         ((cps e1) (lambda (_)
                     ((cps e2) k))))]
    
    [(_ (set v e))
     #'(lambda (k)
         ((cps e) (lambda (ev)
                    (k (set! v ev)))))]
    
    [(_ 'e)
     #'(lambda (k) (k 'e))]
    
    [(_ (display output))
     #'(lambda (k)
         ((cps output) (lambda (ov)
                         (k (display ov)))))]
    
    [(_ (read-number prompt))
     #'(lambda (k)
         ((cps prompt) (lambda (pv)
                         (read-number/suspend pv k))))]
    
    [(_ (f a))
     #'(lambda (k)
         ((cps f) (lambda (fv)
                    ((cps a) (lambda (av)
                               (fv av k))))))]
    [(_ (let/cc kont b))
     (identifier? #'kont)
     #'(lambda (k)
         (let ([kont (lambda (v dyn-k)
                       (k v))])
           ((cps b) k)))]
    [(_ (f a b))
     #'(lambda (k)
         ((cps a) (lambda (av)
                    ((cps b) (lambda (bv)
                               (k (f av bv)))))))]
    
    [(_ atomic)
     #'(lambda (k)
         (k atomic))]
    [(_ (generator (yield) (v) b))
     (and (identifier? #'v) (identifier? #'yield))
     #'(lambda (k)
         (let ([where-to-go (lambda (v) (error 'where-to-go "nothing"))])
           (letrec([resumer (lambda (v)
                              ((cps b) (lambda (k)
                                         (error 'generator "fell through"))))]
                   [yield (lambda (v gen-k)
                            (begin
                              (set! resumer gen-k)
                              (where-to-go v)))])
             (lambda (v dyn-k)
               (begin
                 (set! where-to-go dyn-k)
                 (resumer v))))))]
    
    ))

(define (run c) (c identity))
(test (run (cps 3))                           3)
(test (run (cps 'a))                          'a)
(test (run (cps ((lam (a)    5)       6)))      5)
(test (run (cps ((lam (x)   (* x x)) 5)))     25)
(test (run (cps (+ 5 ((lam (x) (* x x)) 5)))) 30)
;(run (cps (display (+ (read-number "First")
;                      (read-number "Second")))))

(test (run (cps (+ 1 (let/cc esc (+ 2 (esc 3)))))) 4)






