(module sec2.2-ds-rep (lib "eopl.ss" "eopl")

  ;; Simple data structure representation of environments
  ;; Page: 38

  (require "utils.scm")

  ;; data definition:
  ;; Env ::= (empty-env) | (extend-env Var Schemeval Env)

  ;; empty-env : () -> Env
  (define empty-env
    (lambda () (list 'empty-env)))
  
  ;; extend-env : Var * Schemeval * Env -> Env
  (define extend-env
    (lambda (var val env)
      (list 'extend-env var val env)))
  
  ;; apply-env : Env * Var -> Schemeval
  (define apply-env
    (lambda (env search-var)
      (cond
        ((eqv? (car env) 'empty-env)
         (report-no-binding-found search-var))
        ((eqv? (car env) 'extend-env)
         (let ((saved-var (cadr env))
               (saved-val (caddr env))
               (saved-env (cadddr env)))
           (if (eqv? search-var saved-var)
             saved-val
             (apply-env saved-env search-var))))
        (else
          (report-invalid-env env)))))
  
  (define report-no-binding-found
    (lambda (search-var)
      (eopl:error 'apply-env "No binding for ~s" search-var)))
  
  (define report-invalid-env
    (lambda (env)
      (eopl:error 'apply-env "Bad environment: ~s" env)))

  (define e
    (extend-env 'd 6
      (extend-env 'y 8
        (extend-env 'x 7
          (extend-env 'y 14
            (empty-env))))))

  (equal?? (apply-env e 'd) 6)
  (equal?? (apply-env e 'y) 8)
  (equal?? (apply-env e 'x) 7)

  (report-unit-tests-completed 'apply-env)
  
  (define empty-env-alist (lambda () '()))
  (define extend-env-alist
    (lambda (var val saved-env)
      (cons (list var val) saved-env)))
  (define apply-env-alist
    (lambda (env search-var)
      (cond [(null? env)
             (report-no-binding-found search-var)]
            [(pair? (car env)) 
             (let ((var (caar env))
                   (val (cadar env)))
               (if (eqv? var search-var)
                   val
                   (apply-env-alist (cdr env) search-var)))]
            [else (report-invalid-env env)])))
  (define f
    (extend-env-alist 
     'd 6
     (extend-env-alist 
      'y 8
      (extend-env-alist 
       'x 7
       (extend-env-alist 
        'y 14
        (empty-env-alist))))))
  (equal?? (apply-env-alist f 'd) 6)
  (equal?? (apply-env-alist f 'y) 8)
  (equal?? (apply-env-alist f 'x) 7)
  
  (define extend-env*
    (lambda (lovar loval saved-env)
      (if (null? lovar) saved-env
          (let ((var (car lovar))
                (val (car loval)))
          (extend-env* (cdr lovar) (cdr loval) (extend-env-alist var val saved-env))))))
  
  (let ()
    (define report-no-binding-found
      (lambda (search-var)
        (eopl:error 'apply-env "No binding for ~s" search-var)))
    
    (define report-invalid-env
      (lambda (env)
        (eopl:error 'apply-env "Bad environment: ~s" env)))
    (define empty-env
      (lambda () '()))
    (define extend-env
      (lambda (lovar loval saved-env)
        (cons (list lovar loval) saved-env)))
    (define apply-env
      (lambda (env search-var)
        (letrec ((search-list 
                  (lambda (varlist vallist)
                    (if (null? varlist) #f
                        (if (eqv? search-var (car varlist))
                            (car vallist)
                            (search-list (cdr varlist) (cdr vallist))))))
                 (getlovar caar)
                 (getloval cadar))
          (cond [(null? env) (report-no-binding-found search-var)]
                [(and (pair? (car env)) (pair? (getlovar env)) (pair? (getloval env)))
                 (let ((checkedval (search-list (getlovar env) (getloval env))))
                   (if (eqv? checkedval #f)
                       (apply-env (cdr env) search-var)
                       checkedval))]
                [else (report-invalid-env env)]))))
    
    (define e
      (extend-env '(d y x y) '(6 8 7 14) (empty-env)))

    (equal?? (apply-env e 'd) 6)
    (equal?? (apply-env e 'y) 8)
    (equal?? (apply-env e 'x) 7)
    
    (report-unit-tests-completed 'ribs-representation)
    )
  )
