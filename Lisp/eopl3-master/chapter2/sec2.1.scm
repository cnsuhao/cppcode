(module sec2.1 (lib "eopl.ss" "eopl")

  (require "utils.scm")

  (let ()
    ;; Unary Representation
    ;; page 33
    (define zero (lambda () '()))
    (define is-zero? (lambda (n) (null? n)))
    (define successor (lambda (n) (cons #t n)))
    (define predecessor (lambda (n) (cdr n)))

    ;; Need this style of definition to define a recursive function
    ;; inside a let, sorry.
    (define (plus x y)
      (if (is-zero? x)
        y
        (successor (plus (predecessor x) y))))

    (define (scheme-int->my-int n)
      (if (zero? n) (zero)
        (successor (scheme-int->my-int (- n 1)))))

    (define (my-int->scheme-int x)
      (if (is-zero? x) 0
        (+ 1 (my-int->scheme-int (predecessor x)))))

    (equal?? 
      (my-int->scheme-int
        (plus 
          (scheme-int->my-int 3)
          (scheme-int->my-int 7)))
      10)

    (report-unit-tests-completed 'unary-representation)
    )

  (let ()
    ;; Scheme number representation
    ;; page 33
    (define zero (lambda () 0))
    (define is-zero? (lambda (n) (zero? n)))
    (define successor (lambda (n) (+ n 1)))
    (define predecessor (lambda (n) (- n 1)))

    (define (plus x y)
      (if (is-zero? x)
        y
        (successor (plus (predecessor x) y))))

    (equal?? (plus 3 7) 10)

    (report-unit-tests-completed 'scheme-number-representation)

    )

  (let ()
    ;; Reverse-number representation
    ;; Represent n by the Scheme number 5-n
    (define zero (lambda () 5))
    (define is-zero? (lambda (n) (= n 5)))
    (define successor (lambda (n) (- n 5)))
    (define predecessor (lambda (n) (+ n 5)))

    ;; unchanged below here!

    (define plus
      (lambda (x y)
        (if (is-zero? x)
          y
          (successor (plus (predecessor x) y)))))

    (define (scheme-int->my-int n)
        (if (zero? n) (zero)
          (successor (scheme-int->my-int (- n 1)))))

    (define (my-int->scheme-int x)
        (if (is-zero? x) 0
          (+ 1 (my-int->scheme-int (predecessor x)))))

    (equal?? 
      (my-int->scheme-int
        (plus 
          (scheme-int->my-int 3)
          (scheme-int->my-int 7)))
      10)

    (report-unit-tests-completed 'reverse-number-representation)
    )
  
  (let ((N 10))
    ;; BigNumber representation
    (define zero (lambda () '(0)))
    (define is-zero? (lambda (n) (and (null? (cdr n)) (= (car n) 0))))
    (define successor 
      (lambda (n)
        (if (null? n)
            (successor (zero))
            (let ((least (car n))
                  (rest (cdr n)))
              (if (< least (- N 1))
                  (cons (+ least 1) rest)
                  (cons 0 (successor rest)))))))
          
    (define predecessor
      (lambda (n)
        (if (is-zero? n)
            (eopl:error "~s is zero" n)
            (let ((least (car n))
                  (rest (cdr n)))
              (if (= least 0)
                  (let ((rest-1 (predecessor rest)))
                    (if (is-zero? rest-1)
                        (cons (- N 1) '())
                        (cons (- N 1) rest-1)))
                  (cons (- least 1) rest))))))

    ;; unchanged below here!
    (define plus
      (lambda (x y)
        (if (is-zero? x)
          y
          (successor (plus (predecessor x) y)))))

    (define (scheme-int->my-int n)
        (if (zero? n) (zero)
          (successor (scheme-int->my-int (- n 1)))))

    (define (my-int->scheme-int x)
      (if (is-zero? x) 0
          (+ 1 (my-int->scheme-int (predecessor x)))))
        
    (equal?? 
      (my-int->scheme-int
        (plus 
          (scheme-int->my-int 3)
          (scheme-int->my-int 7)))
      10)

    (define (my-x m n)
      (if (or (is-zero? m) (is-zero? n)) (zero)
          (plus n (my-x (predecessor m) n))))
    (define (my-fact n)
      (if (is-zero? n) (successor n)
          (my-x n (my-fact (predecessor n)))))
    (equal?? (my-int->scheme-int (my-fact (scheme-int->my-int 3))) 6)
    (report-unit-tests-completed 'reverse-number-representation)
    )

  (let ()
    ;; DiffTree representation
    (define zero (lambda () '(diff (one) (one))))
    (define (eval-dt dt)
      (letrec ((eval-dt-impl 
             (lambda (dt result-list-pair)
               (let ((is-one? (lambda (dt) (eqv? 'one (car dt))))
                     (lo1 (car result-list-pair))
                     (lo-1 (cadr result-list-pair)))
                 (if (is-one? dt) 
                     (if (null? lo-1) 
                         (list (cons 'one lo1) lo-1)
                         (list lo1 (cdr lo-1)))
                     (let* ((dt-l (cadr dt))
                            (result-pair-l (eval-dt-impl dt-l result-list-pair))
                            (dt-r (caddr dt)))
                       (reverse (eval-dt-impl dt-r (reverse result-pair-l)))))))))
        (eval-dt-impl dt '(() ()))))
    
    (define is-zero? 
      (lambda (dt)
        (let* ((dt-value (eval-dt dt))
               (lo1 (car dt-value))
               (lo-1 (cadr dt-value)))
          (and (null? lo1) (null? lo-1)))))
    (define successor 
      (lambda (dt)
        (list 'diff dt '(one))))
    
    (define predecessor
      (lambda (dt)
        (let ((neg-one '(diff (diff (one) (one)) (one))))
          (list 'diff dt neg-one))))
    
    (define plus
      (lambda (dt-l dt-r)
        (let ((neg-dt
               (lambda (dt)
                 (if (eqv? (car dt) 'one) dt
                     (let ((dt-l (cadr dt))
                           (dt-r (caddr dt)))
                       (list 'diff dt-r dt-l))))))
          (list 'diff dt-l (neg-dt dt-r)))))

    (define (scheme-int->my-int n)
        (if (zero? n) (zero)
          (successor (scheme-int->my-int (- n 1)))))

    (define (my-int->scheme-int x)
      (if (is-zero? x) 0
          (+ 1 (my-int->scheme-int (predecessor x)))))
        
    (equal?? 
      (my-int->scheme-int
        (plus 
          (scheme-int->my-int 3)
          (scheme-int->my-int 7)))
      10)

    (define (my-x m n)
      (if (or (is-zero? m) (is-zero? n)) (zero)
          (plus n (my-x (predecessor m) n))))
    (define (my-fact n)
      (if (is-zero? n) (successor n)
          (my-x n (my-fact (predecessor n)))))
    (equal?? (my-int->scheme-int (my-fact (scheme-int->my-int 3))) 6)
    (report-unit-tests-completed 'reverse-number-representation)
    )
  )

