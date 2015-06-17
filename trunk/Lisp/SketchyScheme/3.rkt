;(define-syntax when
;  (syntax-rules ()
;    ((_ predicate . commands)
;     (if predicate (begin . commands)))))
;(when (= 1 1) (display "yes!") (newline))
;
;(define-syntax fresh
;  (syntax-rules ()
;    ((_ (sym ...) expr . exprs)
;     (let ((sym (if #f #f)) ...) expr . exprs))))
;(fresh (a b c) (list a b c))
;
;(define-syntax twins
;  (syntax-rules ()
;    ((_ x ...)
;     (list (quote (x x)) ...))))
;(twins 1 2 3)

;(define-syntax reverse-syntax
;  (syntax-rules ()
;    ((_ lst) (reverse-syntax lst ()))
;    ((_ () r) r)
;    ((_ (a . d) r) (reverse-syntax d (a . r)))))
;
;(reverse-syntax (7 5 cons))
;(reverse-syntax (1 2 3 +))

;(quasiquote (1 2 (unquote (+ 1 2))))
;`(1 2 ,(+ 1 2))
;`foo
;`,3
;(let ((var 'x))
;  `(lambda (,var)
;     (* ,var ,var)))
;(let ((var 'x))
;  (list 'lambda
;        (list var)
;        (list '* var var)))
;`(1 2 3 ,@(list 4 5 6))
;`(1 2 3 (unquote-splicing (list 4 5 6)))
;`(1 2 ,@(list 3 4))
;(let* ((var 'x)
;       (body
;        `((display ,var)
;          (newline)
;          ,var)))
;  `(lambda (,var) ,@body))
;((lambda (x)
;   `(,x ',x)) '(lambda (x)
;                 `(,x ',x)))
;(define (expand-qq form)
;  (letrec
;      ((does-splicing?
;        (lambda (form)
;          (and (pair? form)
;               (or (and (pair? (car form))
;                        (eq? 'unquote-splicing (caar form)))
;                   (does-splicing? (cdr form))))))
;       (expand-list
;        (lambda (form)
;          (if (does-splicing? form)
;              (cons 'append
;                    (map (lambda (x)
;                           (if (and (pair? x)
;                                    (eq? 'unquote-splicing
;                                         (car x)))
;                               (cadr x)
;                               (list 'list (expand x))))
;                         form))
;              (cons 'list (map expand form)))))
;       (expand
;        (lambda (form)
;          (cond ((not (pair? form))
;                 (list 'quote form))
;                ((eq? 'quasiquote (car form))
;                 (expand (cadr form)))
;                ((eq? 'unquote (car form))
;                 (cadr form))
;                (else (expand-list form))))))
;    (expand (cadr form))))

(define call/cc call-with-current-continuation)
;(call/cc (lambda (k) 'foo))
;(call/cc (lambda (k) (k 'bar)))
;(define (f hehe) hehe)
;(define (g hehe) `nimei)
;(f (call/cc (lambda (k) (g (k 'bar)))))
;(call/cc (lambda (k) (#f (k #t))))

;(define (checked-length x)
;  (letrec
;      ((proper-list?
;        (lambda (x)
;          (cond ((null? x) #t)
;                ((not (pair? x)) #f)
;                (else (proper-list? (cdr x))))))
;       (length
;        (lambda (x)
;          (cond ((null? x) 0)
;                (else (+ 1 (length (cdr x))))))))
;    (and (proper-list? x) (length x))))
;(define (broken-length x)
;  (cond ((null? x) 0)
;        ((not (pair? x)) #f)
;        (else (+ 1 (broken-length (cdr x))))))
;(define (checked-length-nl x)
;  (call/cc (lambda (exit)
;             (letrec
;                 ((length
;                   (lambda (x)
;                     (cond ((null? x) 0)
;                           ((not (pair? x)) (exit #f))
;                           (else (+ 1 (length (cdr x))))))))
;               (length x)))))
;(let ((x (call/cc (lambda (k)
;                    (cons k 'foo)))))
;  (let ((k (car x))
;        (v (cdr x)))
;    (cond ((eq? v 'foo) (k (cons k 'bar)))
;          ((eq? v 'bar) (k (cons k 'baz)))
;          (else v))))
;(letrec
;    ((print-and-return
;      (lambda (x)
;        (display x)
;        x)))
;  (+ (print-and-return 2)
;     (print-and-return 3)
;     (print-and-return 4)))
;(call/cc (lambda (k)
;           (#f (k 'left-to-right)
;               (k 'right-to-left))))
;(letrec ((x (call/cc list)))
;  (if (pair? x)
;      ((car x) (lambda () x))
;      (pair? (x))))
;(let ((x (call/cc list)))
;  (if (pair? x)
;      ((car x) (lambda () x))
;      (pair? (x))))

(letrec
    ((f (lambda (a)
          (cond ((zero? a) 1)
                (else (* a (f (- a 1))))))))
  (f 5))

(let
  ((f (lambda (g a)
        (cond ((zero? a) 1)
              (else (* a (g g (- a 1))))))))
  (f f 5))

((lambda (f x) (f f x))
 (lambda (g a)
   (cond ((zero? a) 1)
         (else (* a (g g (- a 1)))))) 5)

(((lambda (f) (lambda (x) ((f f) x)))
  (lambda (g)
    (lambda (a)
      (cond ((zero? a) 1)
          (else (* a ((g g) (- a 1)))))))) 5)

(((lambda (f) (lambda (x) ((f f) x)))
  (lambda (g)
    (let ((s (lambda (x) ((g g) x))))
      (lambda (a)
        (cond ((zero? a) 1)
              (else (* a (s (- a 1))))))))) 5)

(((lambda (f) (lambda (x) ((f f) x)))
  (lambda (g)
    ((lambda (s)
       (lambda (a)
         (cond ((zero? a) 1)
               (else (* a (s (- a 1)))))))
     (lambda (x) ((g g) x))))) 5)

(
 ((lambda (r) 
    ((lambda (f) (lambda (x) ((f f) x)))
     (lambda (g)
       (r (lambda (b) ((g g) b)))))) 
  (lambda (s)
    (lambda (a)
      (cond ((zero? a) 1)
            (else (* a (s (- a 1)))))))) 
 5)

(
 ((lambda (r) 
    ((lambda (f) (f f))
     (lambda (g)
       (r (lambda (b) ((g g) b)))))) 
  (lambda (s)
    (lambda (a)
      (cond ((zero? a) 1)
            (else (* a (s (- a 1)))))))) 
 5)


















