(module sec2.3 (lib "eopl.ss" "eopl")

  (require "utils.scm")

  ;; var-exp : Var -> Lc-exp
  (define var-exp
    (lambda (var)
      `(var-exp ,var)))

  ;; lambda-exp : Var * Lc-exp -> Lc-exp
  (define lambda-exp
    (lambda (var lc-exp)
      `(lambda-exp ,var ,lc-exp)))

  ;; app-exp : Lc-exp * Lc-exp -> Lc-exp
  (define app-exp
    (lambda (lc-exp1 lc-exp2)
      `(app-exp ,lc-exp1 ,lc-exp2)))

  ;; var-exp? : Lc-exp -> Bool
  (define var-exp?
    (lambda (x)
      (and (pair? x) (eq? (car x) 'var-exp))))

  ;; lambda-exp? : Lc-exp -> Bool
  (define lambda-exp?
    (lambda (x)
      (and (pair? x) (eq? (car x) 'lambda-exp))))

  ;; app-exp? : Lc-exp -> Bool 
  (define app-exp?
    (lambda (x)
      (and (pair? x) (eq? (car x) 'app-exp))))
  ;; var-exp->var : Lc-exp -> Var
  (define var-exp->var
    (lambda (x)
      (cadr x)))

  ;; lambda-exp->bound-var : Lc-exp -> Var
  (define lambda-exp->bound-var
    (lambda (x)
      (cadr x)))

  ;; lambda-exp->body : Lc-exp -> Lc-exp
  (define lambda-exp->body
    (lambda (x)
      (caddr x)))

  ;; app-exp->rator : Lc-exp -> Lc-exp
  (define app-exp->rator
    (lambda (x)
      (cadr x)))

  ;; app-exp->rand : Lc-exp -> Lc-exp
  (define app-exp->rand
    (lambda (x)
      (caddr x)))

  ;; occurs-free? : Sym * Lcexp -> Bool
  (define occurs-free?
    (lambda (search-var exp)
      (cond
        ((var-exp? exp) (eqv? search-var (var-exp->var exp)))
        ((lambda-exp? exp) 
         (and
           (not (eqv? search-var (lambda-exp->bound-var exp)))
           (occurs-free? search-var (lambda-exp->body exp))))
        (else
          (or
            (occurs-free? search-var (app-exp->rator exp))
            (occurs-free? search-var (app-exp->rand exp)))))))

  ;; a few small unit tests

  (equal??
    (occurs-free? 'a (lambda-exp 'a (app-exp (var-exp 'b) (var-exp 'a))))
    #f)

  (equal??
    (occurs-free? 'b (lambda-exp 'a (app-exp (var-exp 'b) (var-exp 'a))))
    #t)

  (report-unit-tests-completed 'occurs-free?)

  (let ()
    ;; var-exp : Var -> Lc-exp
    (define var-exp
      (lambda (var)
        var))

  ;; lambda-exp : Var * Lc-exp -> Lc-exp
  (define lambda-exp
    (lambda (var lc-exp)
      `(lambda ,var ,lc-exp)))

  ;; app-exp : Lc-exp * Lc-exp -> Lc-exp
  (define app-exp
    (lambda (lc-exp1 lc-exp2)
      `(,lc-exp1 ,lc-exp2)))

  ;; var-exp? : Lc-exp -> Bool
  (define var-exp?
    (lambda (x)
      (symbol? x)))

  ;; lambda-exp? : Lc-exp -> Bool
  (define lambda-exp?
    (lambda (x)
      (and (pair? x) (eq? (car x) 'lambda))))

  ;; app-exp? : Lc-exp -> Bool 
  (define app-exp?
    (lambda (x)
      (and (pair? x) (not (eq? (car x) 'lambda)))))
  ;; var-exp->var : Lc-exp -> Var
  (define var-exp->var
    (lambda (x)
      x))

  ;; lambda-exp->bound-var : Lc-exp -> Var
  (define lambda-exp->bound-var
    (lambda (x)
      (cadr x)))

  ;; lambda-exp->body : Lc-exp -> Lc-exp
  (define lambda-exp->body
    (lambda (x)
      (caddr x)))

  ;; app-exp->rator : Lc-exp -> Lc-exp
  (define app-exp->rator
    (lambda (x)
      (car x)))

  ;; app-exp->rand : Lc-exp -> Lc-exp
  (define app-exp->rand
    (lambda (x)
      (cadr x)))

  ;; occurs-free? : Sym * Lcexp -> Bool
  (define occurs-free?
    (lambda (search-var exp)
      (cond
        ((var-exp? exp) (eqv? search-var (var-exp->var exp)))
        ((lambda-exp? exp) 
         (and
           (not (eqv? search-var (lambda-exp->bound-var exp)))
           (occurs-free? search-var (lambda-exp->body exp))))
        (else
          (or
            (occurs-free? search-var (app-exp->rator exp))
            (occurs-free? search-var (app-exp->rand exp)))))))

  ;; a few small unit tests

  (equal??
    (occurs-free? 'a (lambda-exp 'a (app-exp (var-exp 'b) (var-exp 'a))))
    #f)

  (equal??
    (occurs-free? 'b (lambda-exp 'a (app-exp (var-exp 'b) (var-exp 'a))))
    #t)

  (report-unit-tests-completed 'occurs-free?)
    )
  
  (let ()
    (define number->sequence
      (lambda (n) (list n '() '())))
    (define current-element
      (lambda (nis)
        (car nis)))
    (define move-to-left
      (lambda (nis)
        (let ((cur (car nis))
              (left (cadr nis))
              (right (caddr nis)))
          (if (null? left) 
              (eopl:error 'move-to-left "~s has reached left end" nis)
              (list (car left) (cdr left) (cons cur right))))))
    
    (define move-to-right
      (lambda (nis)
        (let ((cur (car nis))
              (left (cadr nis))
              (right (caddr nis)))
          (if (null? right) 
              (eopl:error 'move-to-right "~s has reached right end" nis)
              (list (car right) (cons cur left) (cdr right))))))
    
    (define insert-to-left
      (lambda (node nis)
        (let ((cur (car nis))
              (left (cadr nis))
              (right (caddr nis)))
          (list cur (cons node left) right))))
    (define insert-to-right
      (lambda (node nis)
        (let ((cur (car nis))
              (left (cadr nis))
              (right (caddr nis)))
          (list cur left (cons node right)))))
    (define at-left-end?
      (lambda (nis)
        (null? (cadr nis))))
    (define at-right-end?
      (lambda (nis)
        (null? (caddr nis))))
    
    (equal?? (number->sequence 7) '(7 () ()))
    (equal?? (current-element '(6 (5 4 3 2 1) (7 8 9))) 6)
    (equal?? (move-to-left '(6 (5 4 3 2 1) (7 8 9))) '(5 (4 3 2 1) (6 7 8 9)))
    (equal?? (move-to-right '(6 (5 4 3 2 1) (7 8 9))) '(7 (6 5 4 3 2 1) (8 9)))
    (equal?? (insert-to-left 13 '(6 (5 4 3 2 1) (7 8 9))) '(6 (13 5 4 3 2 1) (7 8 9)))
    (equal?? (insert-to-right 13 '(6 (5 4 3 2 1) (7 8 9))) '(6 (5 4 3 2 1) (13 7 8 9)))
    (report-unit-tests-completed 'ex2.18)
    )
  
  (let ()
    (define number->bintree
      (lambda (n)
        (list n '() '())))
    (define current-element
      (lambda (bt)
        (car bt)))
    (define move-to-left
      (lambda (bt)
        (cadr bt)))
    (define move-to-right
      (lambda (bt)
        (caddr bt)))
    (define at-leaf?
      (lambda (bt)
        (null? bt)))
    (define insert-to-left
      (lambda (n bt)
        (let ((cur (car bt))
              (left (cadr bt))
              (right (caddr bt)))
          (list cur (list n left '()) right))))
    (define insert-to-right
      (lambda (n bt)
        (let ((cur (car bt))
              (left (cadr bt))
              (right (caddr bt)))
          (list cur left (list n '() right)))))
    (equal?? (number->bintree 13) '(13 () ()))
    (define t1
      (insert-to-right 
       14
       (insert-to-left 
        12
        (number->bintree 13))))
    (equal?? t1
             '(13
               (12 () ())
               (14 () ())))
    (equal?? (move-to-left '(13
                                 (12 () ())
                                 (14 () ())))  
             '(12 () ()))
    (equal?? (current-element (move-to-left t1)) 12)
    (equal?? (at-leaf? (move-to-right (move-to-left t1))) #t)
    (equal?? (insert-to-left 15 t1)
             '(13
               (15
                (12 () ())
                ())
               (14 () ())))
    (report-unit-tests-completed 'ex2.19)
    )
  (let ()
    (define mk-bintree-simple
      (lambda (n left-bt right-bt)
        (list n left-bt right-bt)))
    (define mk-bintree
      (lambda (bt-s add2parent)
        (list bt-s add2parent)))
    (define number->bintree
      (lambda (n)
        (mk-bintree (mk-bintree-simple n '() '()) 'none)))
    (define left-bt-s cadr)
    (define right-bt-s caddr)
    (define cur-bt-s car)
    (define add2parent-bt cadr)
    (define simple-bt car)
    
    (define move-to-left
      (lambda (bt)
        (let* ((bt-simple (simple-bt bt))
               (bt-s-left (left-bt-s bt-simple)))
          (mk-bintree
           (mk-bintree-simple 
            (cur-bt-s bt-s-left)
            (left-bt-s bt-s-left)
            (right-bt-s bt-s-left))
           (lambda (left-bt-s)
             (mk-bintree
              (mk-bintree-simple (cur-bt-s bt-simple)
                                 left-bt-s
                                 (right-bt-s bt-simple))
              (add2parent-bt bt)))))))
    
    (define move-to-right
      (lambda (bt)
        (let* ((bt-simple (simple-bt bt))
               (bt-s-right (right-bt-s bt-simple)))
          (mk-bintree
           (mk-bintree-simple 
            (cur-bt-s bt-s-right)
            (left-bt-s bt-s-right)
            (right-bt-s bt-s-right))
           (lambda (right-bt-s)
             (mk-bintree
              (mk-bintree-simple
               (cur-bt-s bt-simple)
               (left-bt-s bt-simple)
               right-bt-s)
              (add2parent-bt bt)))))))
    
    (define at-leaf?
      (lambda (bt)
        (null? bt)))
    (define at-root?
      (lambda (bt)
        (eqv? (add2parent-bt bt) 'none)))
    (define move-up
      (lambda (bt)
        (if (at-root? bt)
            (eopl:error move-up "~s has reached root" bt)
            ((add2parent-bt bt) (simple-bt bt)))))
    (define insert-to-left
      (lambda (n bt)
        (let ((bt-s (simple-bt bt)))
          (mk-bintree 
           (mk-bintree-simple 
            (cur-bt-s bt-s) 
            (mk-bintree-simple n (left-bt-s bt-s) '()) 
            (right-bt-s bt-s))
           (add2parent-bt bt)))))
    (define insert-to-right
      (lambda (n bt)
        (let ((bt-s (simple-bt bt)))
          (mk-bintree 
           (mk-bintree-simple 
            (cur-bt-s bt-s)
            (left-bt-s bt-s)
            (mk-bintree-simple n '() (right-bt-s bt-s)))
           (add2parent-bt bt)))))
    
    (equal?? (number->bintree 13) `((13 () ()) none))
    (define t1
      (insert-to-right 
       14
       (insert-to-left 
        12
        (number->bintree 13))))
    (equal?? t1
             `((13
                (12 () ())
                (14 () ()))
               none))
    (equal?? (move-up 
              (move-to-left t1))
             t1)
    (report-unit-tests-completed 'ex2.20)
    )
  )