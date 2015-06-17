;(define (fv2 a b . c) c)
;(fv2 'foo 'bar 'baz)
;(fv2 'a 'b 'c 'd 'e 'f)
;
;((lambda (a . b) b) 'foo 'bar)
;((lambda (a . b) b) 'a 'b 'c)
;((lambda (a . b) b) 'foo)
;
;((lambda x x) 'a 'b 'c)
;((lambda x x) 'foo)
;((lambda x x))
;
;(define (limits . a)
;  (list (apply min a)
;        (apply max a)))
;(apply limits `(1  4 2 3))
;(apply cons '(a b))
;
;(eq? 'foo 'foo)
;(eq? 'foo 'bar)
;(eq? 'foo (car '(foo)))
;
;(eq? '() '())
;(eq? 'foo '())
;
;(eq? #f #f)
;(eq? #t #t)
;
;(eq? 'foo 5)
;(eq? #t #\x)
;(eq? '() '(y))
;
;(eq? 5 5)
;(eq? #\a #\a)
;(eq? '(x) '(x))
;
;(char-ci<? #\a #\B)
;
;(string=? "abcd" "abcd")
;(string=? "dcba" "abcd")
;(string<? "abcd" "abcz")
;(string>? "abcd" "abca")
;
;(eqv? 'x 'x)
;(eqv? #f #f)
;(eqv? '(x) '(x))
;(eqv? #\Z #\Z)
;(eqv? -123 -123)
;
;(define (eql? a b)
;  (if (and (pair? a) (pair? b))
;      (and (eql? (car a) (car b)) (eql? (cdr a) (cdr b)))
;      (eq? a b)))
;(define (myequal? a b)
;  (cond ((number? a) (and (number? b) (= a b)))
;        ((char? a) (and (char? b) (char=? a b)))
;        ((string? a) (and (string? b) (string=? a b)))
;        ((and (pair? a) (pair? b))
;         (and (equal? (car a) (car b))
;              (equal? (cdr a) (cdr b))))
;        ((or (procedure? a) (procedure? b)) (bottom))
;        (else (eq? a b))))
;(myequal? '(x y 1) '(x y 1))
;(myequal? '(a (12) (b . c)) '(a (12) (b . c)))
;(myequal? '(a . b) '(a . c))
;
;(and)
;(or)
;
;(memq 'y '(x y z))
;(member '(c d) '((a b) (c d) (e f)))

;(define (mapcar a f)
;  (cond ((null? a) '())
;        (else (cons (f (car a))
;                    (mapcar (cdr a) f)))))
;
;(define (sum-of-squares . x)
;  (apply + (mapcar x (lambda (x) (* x x)))))
;(sum-of-squares 2 3 5 7)
;(define (least-abs . x)
;  (apply min (mapcar x abs)))
;(least-abs -2 3 5 7)

;(define (v* a b) (apply + (map * a b)))
;(v* `(2 4 6) `(1 3 5))
;(define (v+ a b) (map + a b))
;(v+ `(2 4 6) `(1 3 5))
;(define (v+* . a) (apply map + a))
;(v+* `(2 4 6) `(1 3 5) `(1 3 5))
;(apply list 2 3 4 '(5 6 7))
;
;(define (any? p a)
;  (cond ((null? a) #f)
;        ((p (car a)) #t)
;        (else (any? p (cdr a)))))
;(define (any-null? x) (any? null? x))
;(define (car-of a) (mapcar a car))
;(define (cdr-of a) (mapcar a cdr))
;(define (mymap f . a)
;  (letrec
;      ((map2
;        (lambda (a b)
;          (cond ((any-null? a)
;                 (reverse b))
;                (else
;                 (map2 (cdr-of a)
;                       (cons (apply f (car-of a)) b)))))))
;    (map2 a '())))
;
;(mymap + `(1 2) `(3 4) `(5 6))
;
;(define (depth a)
;  (if (pair? a)
;      (+ 1 (apply max (map depth a)))
;      0))
;(depth `((())))
;
;(define (xif pred true false)
;  (if (pred) (true) (false)))
;(letrec
;    ((down
;      (lambda (n)
;        (xif (lambda () (zero? n))
;             (lambda () 0)
;             (lambda () (down (- n 1)))))))
;  (down 4))

;(define (kons a b) (lambda (p) (p a b)))
;(define (kar x) (x (lambda (a b) a)))
;(define (kdr x) (x (lambda (a b) b)))
;(kons 'head 'tail)
;(kar (kons 'head 'tail))
;(kdr (kons 'head 'tail))
;
;(define (S f x) (f f x))
;((lambda (f x) (f f x)) 
; (lambda (f x)
;   (cond ((zero? x) 1)
;         (else (* x (f f (- x 1))))))
; 5)

;(define (myreverse a)
;  (letrec
;      ((reverse2
;        (lambda (a b)
;          (cond ((null? a) b)
;                (else (reverse2 (cdr a)
;                                (cons (car a) b)))))))
;    (reverse2 a '())))
;
;(list->string
; (reverse
;  (string->list "Hello, World!")))

;(define (explode x)
;  (map (lambda (y)
;         (string->symbol (string y)))
;       (string->list (symbol->string x))))
;(explode `xyz)
;
;(define (implode x)
;  (letrec
;      ((sym->char
;        (lambda (x)
;          (let ((str (symbol->string x)))
;            (if (not (= (string-length str) 1))
;                (bottom "bad symbol in implode")
;                (string-ref str 0))))))
;    (string->symbol
;     (list->string (map sym->char x)))))
;(implode `(x y z))

;(define (int->list x)
;  (letrec
;      ((convert
;        (lambda (in out)
;          (if (zero? in)
;              out
;              (convert (quotient in 10)
;                       (cons (remainder in 10) out))))))
;    (if (zero? x) '(0) (convert x '()))))
;
;(define (add a b)
;  (letrec
;      ((result
;        (lambda (a b c)
;          (if (> (+ a b c) 9)
;              (- (+ a b c) 10)
;              (+ a b c))))
;       (carry
;        (lambda (a b c)
;          (if (> (+ a b c) 9) 1 0)))
;       (add2c
;        (lambda (a b r c)
;          (cond ((null? a)
;                 (if (null? b)
;                     (cons c r)
;                     (add2c '()
;                            (cdr b)
;                            (cons (result 0 (car b) c) r)
;                            (carry 0 (car b) c))))
;                ((null? b)
;                 (add2c (cdr a)
;                        '()
;                        (cons (result (car a) 0 c) r)
;                        (carry (car a) 0 c)))
;                (else (add2c (cdr a)
;                             (cdr b)
;                             (cons (result (car a) (car b) c) r)
;                             (carry (car a) (car b) c)))))))
;    (let ((r (add2c (reverse a) (reverse b) '() 0)))
;      (if (= (car r) 0) (cdr r) r))))
;
;(define (list->int x)
;  (letrec
;      ((convert
;        (lambda (in out)
;          (if (null? in)
;              out
;              (convert (cdr in)
;                       (+ (car in) (* 10 out)))))))
;    (convert x 0)))

;(define (char-properties x)
;  (apply append
;         (map (lambda (prop)
;                (cond (((car prop) x) (cdr prop))
;                      (else '())))
;              (list (cons char-alphabetic? '(alphabetic))
;                    (cons char-numeric? '(numeric))
;                    (cons char-upper-case? '(upper-case))
;                    (cons char-lower-case? '(lower-case))
;                    (cons char-whitespace? '(whitespace))))))
;
;(char-properties #\x)
;(char-properties #\0)
;(char-properties #\newline)

;(define (fixed-length-substrings s n)
;  (let ((len (string-length s)))
;    (letrec
;        ((f-l-subs
;          (lambda (pos)
;            (if (> (+ pos n) len)
;                '()
;                (cons (substring s pos (+ pos n))
;                      (f-l-subs (+ pos 1)))))))
;      (f-l-subs 0))))
;(define (sub-strings s)
;  (let ((len (string-length s)))
;    (letrec
;        ((subs
;          (lambda (n)
;            (if (> n len)
;                '()
;                (append (fixed-length-substrings s n)
;                        (subs (+ n 1)))))))
;      (subs 1))))
;
;(sub-strings "Scheme")

;(define (first-of s) (string (string-ref s 0)))
;(define (rest-of s) (substring s 1 (string-length s)))
;(define (rotate s)
;  (string-append (rest-of s)
;                 (first-of s)))
;(define (rotations s)
;  (letrec
;      ((rot (lambda (s n)
;              (if (zero? n)
;                  '()
;                  (cons s (rot (rotate s) (- n 1)))))))
;    (rot s (string-length s))))
;(define (permute str)
;  (cond ((= (string-length str) 0) '())
;        ((= (string-length str) 1) (list str))
;        (else (apply append
;                     (map (lambda (rotn)
;                            (map (lambda (perm)
;                                   (string-append
;                                    (first-of rotn)
;                                    perm))
;                                 (permute (rest-of rotn))))
;                          (rotations str))))))
;(write cons)
;(write (lambda () 'foo))
;(write "Hello, World!")
(define (read-line)
  (letrec
      ((collect-chars
        (lambda (c s)
          (cond ((eof-object? c)
                 (cond ((null? s) c)
                       (else (apply string (reverse s)))))
                ((char=? c #\newline)
                 (apply string (reverse s)))
                (else (collect-chars (read-char)
                                     (cons c s)))))))
    (collect-chars (read-char) '())))

(define (type from)
  (with-input-from-file from
    (lambda ()
      (letrec
          ((type-chars
            (lambda (c)
              (cond ((eof-object? c) c)
                    (else (display c)
                          (type-chars (read-char)))))))
        (type-chars (read-char))))))
(define (copy from to)
  (with-output-to-file to
    (lambda ()
      (type from))))





























