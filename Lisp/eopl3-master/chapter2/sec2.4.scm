(module sec2.4 (lib "eopl.ss" "eopl")

  (require "utils.scm")

  (define identifier? symbol?)

  (define-datatype lc-exp lc-exp? 
    (var-exp
      (var identifier?))
    (lambda-exp
      (bound-var identifier?)
      (body lc-exp?))
    (app-exp
      (rator lc-exp?)
      (rand lc-exp?)))

  ;; occurs-free? : Sym * Lcexp -> Bool
  (define occurs-free?
    (lambda (search-var exp)
      (cases lc-exp exp
        (var-exp (var) (eqv? var search-var))
        (lambda-exp (bound-var body)
          (and
            (not (eqv? search-var bound-var))
            (occurs-free? search-var body)))
        (app-exp (rator rand)
          (or
            (occurs-free? search-var rator)
            (occurs-free? search-var rand))))))

  ;; test items
  (equal?? (occurs-free? 'x (var-exp 'x)) #t)

  (equal?? (occurs-free? 'x (var-exp 'y)) #f)

  (equal?? (occurs-free? 'x (lambda-exp 'x
                              (app-exp (var-exp 'x) (var-exp 'y))))
    #f)

  (equal??
    (occurs-free? 'x (lambda-exp 'y
                       (app-exp (var-exp 'x) (var-exp 'y))))
    #t)

  (equal??
    (occurs-free? 'x 
      (app-exp
        (lambda-exp 'x (var-exp 'x))
        (app-exp (var-exp 'x) (var-exp 'y))))
    #t)

  (equal?? 
    (occurs-free? 'x
      (lambda-exp 'y
        (lambda-exp 'z
          (app-exp (var-exp 'x)
            (app-exp (var-exp 'y) (var-exp 'z))))))
    #t)

  (define-datatype s-list s-list? 
    (empty-s-list)
    (non-empty-s-list 
      (first s-exp?)
      (rest s-list?)))
  
  (define-datatype s-exp s-exp? 
    (symbol-s-exp
      (sym symbol?))
    (s-list-s-exp
      (slst s-list?)))

  ;; page 48: alternate definition 
  (define-datatype s-list-alt s-list-alt? 
    (an-s-list
      (sexps (list-of s-exp?))))
  
  (define list-of
    (lambda (pred)
      (lambda (val)
        (or (null? val)
          (and (pair? val)
            (pred (car val))
            ((list-of pred) (cdr val)))))))

  ;; For exercises 2.24-2.25
  (define-datatype bintree bintree? 
    (leaf-node 
      (num integer?))
    (interior-node
      (key symbol?) 
      (left bintree?)
      (right bintree?)))

  (define bintree-to-list
    (lambda (bt)
      (cases bintree bt
        (leaf-node (n) `(leaf-node ,n))
        (interior-node (key left right)
                       `(interior-node ,key 
                                       ,(bintree-to-list left)
                                       ,(bintree-to-list right))))))
  (equal??
   (bintree-to-list
    (interior-node
     'a
     (leaf-node 3)
     (leaf-node 4)))
   '(interior-node a (leaf-node 3) (leaf-node 4)))

  (define-datatype env-exp env-exp?
    (empty-env)
    (extend-env (var symbol?)
                (val scheme-value?)
                (saved-env env-exp?)))
  (define scheme-value? (lambda (s) #t))
  
  (define-datatype bt-sum bt-sum?
    (leaf-n (sum number?))
    (inter-sum (sum number?)
               (key-max symbol?)
               (sum-max number?)))
  (define max-interior
    (lambda (bt)
      (cases bintree bt
        (leaf-node (num) (leaf-n num))
        (interior-node 
         (key left right)
         (let ((bt-sum-left (max-interior left))
               (bt-sum-right (max-interior right)))
           (cases bt-sum bt-sum-left
             (leaf-n (sum-l)
                     (cases bt-sum bt-sum-right
                       (leaf-n (sum-r)
                               (inter-sum (+ sum-l sum-r) key (+ sum-l sum-r)))
                       (inter-sum (sum-r key-max-r sum-max-r)
                                  (let ((new-sum (+ sum-l sum-r)))
                                    (if (> new-sum sum-max-r)
                                        (inter-sum new-sum key new-sum)
                                        (inter-sum new-sum key-max-r sum-max-r))))))
             (inter-sum (sum-l key-max-l sum-max-l)
                        (cases bt-sum bt-sum-right
                          (leaf-n (sum-r)
                                  (let ((new-sum (+ sum-l sum-r)))
                                    (if (> new-sum sum-max-l)
                                      (inter-sum new-sum key new-sum)
                                      (inter-sum new-sum key-max-l sum-max-l))))
                          (inter-sum (sum-r key-max-r sum-max-r)
                                     (let ((new-sum (+ sum-l sum-r)))
                                       (cond [(and (< new-sum sum-max-r) 
                                                   (< sum-max-l sum-max-r))
                                              (inter-sum new-sum key-max-r sum-max-r)]
                                             [(and (< new-sum sum-max-l) 
                                                   (< sum-max-r sum-max-l))
                                              (inter-sum new-sum key-max-l sum-max-l)]
                                             [else
                                              (inter-sum new-sum key new-sum)])))))))))))
          
  (define tree-1
    (interior-node 'foo (leaf-node 2) (leaf-node 3)))
  (define tree-2
    (interior-node 'bar (leaf-node -1) tree-1))
  (define tree-3
    (interior-node 'baz tree-2 (leaf-node 1)))
  (write (max-interior tree-2))
  (write (max-interior tree-3))
    
  (eopl:printf "unit tests completed successfully.~%")

  )