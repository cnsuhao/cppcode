(module test-chap1 mzscheme

  ;; This collects the code in chapter 1.  It uses a very primitive
  ;; testing macro, equal??.  This needs to be a macro because we print
  ;; the test as well as evaluate it.

  ;; We use a more sophisticated testing setup for the interpreters
  ;; later on.

  (define-syntax equal??
    (syntax-rules ()
      ((_ test-exp correct-ans)
       (let ((observed-ans test-exp))
         (if (not (equal? observed-ans correct-ans))
           (printf "~s returned ~s, should have returned ~s~%"
             'test-exp
             observed-ans
             correct-ans))))))


  ;; in-S? : N -> Bool
  ;; usage: (in-S? n) = #t if n is in S, #f otherwise
  ;; The set S is defined in Definition 1.1.1 on page 2.
  (define in-S?
    (lambda (n)
      (if (zero? n) #t
        (if (>= (- n 3) 0) (in-S? (- n 3))
          #f))))

  (equal?? (in-S? 4) #f)
  (equal?? (in-S? 9) #t)


  ;; list-length : List -> Int
  ;; usage: (list-length l) = the length of l
  ;; Page: 14
  (define list-length
    (lambda (lst)
      (if (null? lst)
        0
        (+ 1 (list-length (cdr lst))))))

  (equal?? (list-length '(a (b c) d)) 3)


  ;; nth-element : List * Int -> SchemeVal
  ;; usage: (nth-element lst n) = the nth element of lst
  ;; Page: 15
  (define nth-element
    (lambda (lst n)
      (if (<= (list-length lst) n)
          (report-list-too-short lst n)
          (if (zero? n)
              (car lst)
              (nth-element (cdr lst) (- n 1))))))

  (define report-list-too-short
    (lambda (lst n)
      (error 'nth-element 
        "~s List too short by ~s elements.~%" lst (+ n 1))))

  ;; uncomment these to test equal??
  ;; (equal?? (nth-element '(a b c d) 2) 'foo)
  ;; (equal?? (nth-element '(a b c d) 3) 'bar)

  (equal?? (nth-element '(a b c d) 2) 'c)

  ;; remove-first : Sym * Listof(Sym) -> Listof(Sym)
  ;; Page: 18
  (define remove-first
    (lambda (s los)
      (if (null? los)
        '()
        (if (eqv? (car los) s)
          (cdr los)
          (cons (car los) (remove-first s (cdr los)))))))

  (equal?? (remove-first 'a '(a b c)) '(b c))

  (equal?? (remove-first 'b '(e f g)) '(e f g))

  (equal?? (remove-first 'a4 '(c1 a4 c1 a4)) '(c1 c1 a4))

  (equal?? (remove-first 'x '()) '())

  ;; occurs-free? : Sym * Lcexp -> Bool
  ;; usage:
  ;;   returns #t if the symbol var occurs free in exp,
  ;;   otherwise returns #f.
  ;; Page: 19
  (define occurs-free?
    (lambda (var exp)
      (cond
        ((symbol? exp) (eqv? var exp))  
        ((eqv? (car exp) 'lambda)
         (and
           (not (eqv? var (car (cadr exp))))
           (occurs-free? var (caddr exp))))
        (else
          (or
            (occurs-free? var (car exp))
            (occurs-free? var (cadr exp)))))))


  (equal?? (occurs-free? 'x 'x) #t)

  (equal?? (occurs-free? 'x 'y) #f)

  (equal?? (occurs-free? 'x '(lambda (x) (x y))) #f)

  (equal?? (occurs-free? 'x '(lambda (y) (x y))) #t)

  (equal?? (occurs-free? 'x '((lambda (x) x) (x y))) #t)

  (equal?? (occurs-free? 'x '(lambda (y) (lambda (z) (x (y z))))) #t)

  ;; subst : Sym * Sym * S-list -> S-list
  ;; Page: 21
  (define subst
    (lambda (new old slist)
      (if (null? slist)
        '()
        (cons
          (subst-in-s-exp new old (car slist)) 
          (subst new old (cdr slist))))))

  ;; subst-in-s-exp : Sym * Sym * S-exp -> S-exp
  ;; Page: 21
  (define subst-in-s-exp
    (lambda (new old sexp)
      (if (symbol? sexp) 
        (if (eqv? sexp old) new sexp)
        (subst new old sexp))))
  (define (hehe s-exp)
    (subst-in-s-exp 'a 'b s-exp))
  (equal?? (subst 'a 'b '((b c) (b () d))) '((a c) (a () d)))

  ;; number-elements-from : Listof(SchemeVal) * Int ->
  ;;                           Listof(List(Int,SchemeVal))  
  ;; usage: (number-elements-from '(v0 v1 v2  ...) n) 
  ;;         = ((n v0 ) (n+1 v1) (n+2 v2) ...)
  ;; Page: 23
  (define number-elements-from
    (lambda (lst n)
      (if (null? lst) '()
        (cons
          (list n (car lst))
          (number-elements-from (cdr lst) (+ n 1))))))

  ;; number-elements : List -> Listof(List(Int,SchemeVal))
  ;; Page: 23.
  (define number-elements
    (lambda (lst)
      (number-elements-from lst 0)))

  (equal?? (number-elements '(a b c d e)) '((0 a) (1 b) (2 c) (3 d) (4 e)))

  ;; list-sum : Listof(Int) -> Int
  ;; Page: 24
  (define list-sum
    (lambda (loi)
      (if (null? loi)
        0
        (+ (car loi) 
          (list-sum (cdr loi))))))

  (equal?? (list-sum (list 1 2 3 4 5)) 15)

  ;; partial-vector-sum : Vectorof(Int) * Int -> Int
  ;; usage if 0 <= n < length(v), then
  ;;            (partial-vector-sum v n) = SUM(v_i from 0 <= i <= n)
  ;; Page: 25
  (define partial-vector-sum
    (lambda (v n)
      (if (zero? n)
        (vector-ref v 0)
        (+ (vector-ref v n)
          (partial-vector-sum v (- n 1))))))

  ;; vector-sum : Vectorof(Int) -> Int
  ;; usage (vector-sum v) = SUM(v_i from 0 <= i <= length(v)-1)
  ;; Page: 25
  (define vector-sum
    (lambda (v)
      (let ((n (vector-length v)))
        (if (zero? n)
          0
          (partial-vector-sum v (- n 1))))))

  (equal?? (vector-sum (vector 1 2 3 4 5)) 15)

  (define (duple n x)
    (if (zero? n) '()
        (cons x (duple (- n 1) x))))
  (equal?? (duple 3 6) '(6 6 6))
  
  (define (invert2 p)
    (cons (cadr p) (cons (car p) '())))
  (define (invertlo2 lo2)
    (if (null? lo2) '()
        (cons (invert2 (car lo2)) (invertlo2 (cdr lo2)))))
  (equal?? (invertlo2 '((a 1) (a 2) (1 b) (2 b))) '((1 a) (2 a) (b 1) (b 2)))
  
  (define (down lst)
    (map list lst))
  (equal?? (down '(1 2 3)) '((1) (2) (3)))
  
  (define (swapper-exp s1 s2 s-exp)
    (if (symbol? s-exp)
        (cond [(eqv? s-exp s1) s2]
              [(eqv? s-exp s2) s1]
              [else s-exp])
        (swapper s1 s2 s-exp)))
  (define (swapper s1 s2 slist)
    (map (lambda (s-exp) (swapper-exp s1 s2 s-exp))
         slist))
  (equal?? (swapper 'a 'd '(a d () c d)) '(d a () c a))
  
  (define (list-set lst n x)
    (if (zero? n) (cons x (cdr lst))
        (cons (car lst) (list-set (cdr lst) (- n 1) x))))
  (equal?? (list-set '(a b c d) 2 '(1 2)) '(a b (1 2) d))
  
  (define (count-occurrences-exp s s-exp)
    (if (symbol? s-exp)
        (if (eqv? s s-exp) 1 0)
        (count-occurrences s s-exp)))
  (define (count-occurrences s slist)
    (if (null? slist) 0
        (+ (count-occurrences-exp s (car slist)) (count-occurrences s (cdr slist)))))
  (equal?? (count-occurrences 'x '((f x) y (((x z) () x)))) 3)
  
  (define (product-partial s1 sos2)
    (if (null? sos2) '()
        (cons (list s1 (car sos2)) (product-partial s1 (cdr sos2)))))
  (define (product sos1 sos2)
    (if (null? sos1) '()
        (append (product-partial (car sos1) sos2) (product (cdr sos1) sos2))))
  (equal?? (product '(a b c) '(x y)) '((a x) (a y) (b x) (b y) (c x) (c y)))
  
  (define (filter-in pred lst)
    (if (null? lst) '()
        (let ((cdr-part (filter-in pred (cdr lst))))
          (if (pred (car lst))
              (cons (car lst) cdr-part)
              cdr-part))))
  (equal?? (filter-in number? '(a 2 (1 3) b 7)) '(2 7))
  
  (define (list-index-auxi pred lst index)
    (if (null? lst) #f
        (if (pred (car lst)) index
            (list-index-auxi pred (cdr lst) (+ index 1)))))
  (define (list-index pred lst)
    (list-index-auxi pred lst 0))
  (equal?? (list-index number? '(a 2 (1 3) b 7)) 1)
  
  (define (every? pred lst)
    (let ((car-part (pred (car lst)))
          (cdr-part (cdr lst)))         
    (if (null? cdr-part) car-part
        (and car-part (every? pred cdr-part)))))
  (equal?? (every? number? '(1 2 3 5 4)) #t)
  (define (exists? pred lst)
    (not (every? (lambda (x) (not (pred x))) lst))
    )
  (equal?? (exists? number? '(a b c 3 e)) #t)
  
  (define (up lst)
    (if (null? lst) '()
        (let ((head (car lst))
              (result-tail (up (cdr lst))))
        (if (symbol? head) (cons head result-tail)
            (append head result-tail)))))
  (equal?? (up '((x (y)) z)) '(x (y) z))
  
  (define (flatten-exp s-exp)
    (if (symbol? s-exp) s-exp
        (flatten s-exp)))
        
  (define (flatten slist)
    (if (null? slist) '()
        (let ((result-head (flatten-exp (car slist)))
              (result-tail (flatten (cdr slist))))
        (if (symbol? result-head) (cons result-head result-tail)
            (append result-head result-tail)))))
  (equal?? (flatten '((a b) c (((d)) e))) '(a b c d e))
  
  (define (merge loi1 loi2)
    (cond [(null? loi1) loi2]
          [(null? loi2) loi1]
          [else
           (let ((head1 (car loi1))
                 (head2 (car loi2)))
             (if (< head1 head2) (cons head1 (merge (cdr loi1) loi2))
                 (cons head2 (merge loi1 (cdr loi2)))))]))
  (equal?? (merge '(35 62 81 90 91) '(3 83 85 90)) '(3 35 62 81 83 85 90 90 91))
  
  (define (popo pred loi loi-result)
    (if (null? (cdr loi)) 
        (if (null? loi-result) loi
            (append loi (popo pred loi-result '())))
        (let ((first (car loi))
              (second (cadr loi))
              (rest (cddr loi)))
          (if (pred first second) 
              (popo pred (cons first rest) (cons second loi-result))
              (popo pred (cons second rest) (cons first loi-result))))))

  (define (sort/predicate pred loi)
    (popo pred loi '()))
  
  (define (leaf n) n)
  (define (interior-node sym bt_l bt_r)
    (list sym bt_l bt_r))
  (define (leaf? bt) (number? bt))
  (define (lson bt) (cadr bt))
  (define (rson bt) (caddr bt))
  (define (contents-of bt)
    (if (leaf? bt) bt
        (car bt)))
  (define (double-tree bt)
    (if (leaf? bt) (* bt 2)
        (interior-node
         (contents-of bt)
         (double-tree (lson bt))
         (double-tree (rson bt)))))
  (equal?? (double-tree (interior-node 'a (interior-node 'b 1 2) (interior-node 'c 3 4)))
           '(a (b 2 4) (c 6 8)))
  (define (mark-leaves-with-red-depth bt)
    (letrec ((hehe 
              (lambda (bt nRed)
                (if (leaf? bt) nRed
                    (let* ((cont (contents-of bt))
                           (nNewRed (if (eqv? cont 'Red) (+ nRed 1) nRed)))
                      (interior-node
                       cont
                       (hehe (lson bt) nNewRed)
                       (hehe (rson bt) nNewRed)))
                    ))))
      (hehe bt 0)))
  (equal?? (mark-leaves-with-red-depth
            (interior-node 'Red
                           (interior-node 'bar
                                          (leaf 26)
                                          (leaf 12))
                           (interior-node 'Red
                                          (leaf 11)
                                          (interior-node 'quux
                                                         (leaf 117)
                                                         (leaf 14)))))
           '(Red (bar 1 1) (Red 2 (quux 2 2))))
  
  (define (path n bst)
    (let ((m (car bst))
          (l (cadr bst))
          (r (caddr bst)))
      (cond [(= m n) '()]
            [(< n m) (cons 'left (path n l))]
            [else (cons 'right (path n r))])))
  (equal?? (path 17 '(14 (7 () (12 () ()))
                         (26 (20 (17 () ())
                                 ())
                             (31 () ()))))
           '(right left left))
  
  (define (number-leaves-impl bt n DoWithBtN)
    (if (leaf? bt)
        (DoWithBtN n (+ n 1))
        (number-leaves-impl
         (lson bt)
         n
         (lambda (left n)
           (number-leaves-impl
            (rson bt)
            n
            (lambda (right n)
              (DoWithBtN
               (interior-node
                (contents-of bt)
                left
                right)
               n)))))))
  (define (number-leaves-N bt n)
    (if (leaf? bt) n
        (number-leaves-impl
         (lson bt)
         n
         (lambda (left n)
           (interior-node
            (contents-of bt)
            left
            (number-leaves-N
             (rson bt)
             n))))))
  (define (number-leaves bt)
    (number-leaves-N bt 0))
  
  (equal?? (number-leaves
            (interior-node 'foo
                           (interior-node 'bar
                                          (leaf 26)
                                          (leaf 12))
                           (interior-node 'baz
                                          (leaf 11)
                                          (interior-node 'quux
                                                         (leaf 117)
                                                         (leaf 14)))))
           '(foo (bar 0 1) (baz 2 (quux 3 4))))
  
  (define (number++ lst)
    (if (null? lst) '()
        (cons
         (cons (+ 1 (caar lst)) (cdar lst))
         (number++ (cdr lst)))))
  (define (g head tail)
    (cons head (number++ tail)))
  (define my-number-elements
    (lambda (lst)
      (if (null? lst) '()
          (g (list 0 (car lst)) (my-number-elements (cdr lst))))))
  
  (define number-leaves-hehe
    (lambda (b)
      (letrec ((loop
                (lambda (b n)
                  (if (leaf? b)
                      (cons n (+ n 1))
                      (let* ((bnl (loop (lson b) n))
                             (bnr (loop (rson b) (cdr bnl))))
                        (cons (interior-node (contents-of b) (car bnl) (car bnr))
                              (cdr bnr)))))))
        (car (loop b 0)))))
  )

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  