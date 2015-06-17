;(cons 'a 'b)
;'(a . ())
;(append '(a b c) 'd)
;
;(define alist '((a . 1) (b . 2) (c . 3) (b . 4)))
;(assoc 'b alist)
;(assoc 'x alist)
;
;(define x 'foo)
;(assoc 'x '((x . bar)))
;
;(define alist '((#f . first)
;                ("hello" . second)
;                ((a b c) . third)))
;(assoc #f alist)
;(assoc "hello" alist)
;(assoc '(a b c) alist)

(define (depth x)
  (if (not (pair? x))
      0
      (max (+ 1 (depth (car x))) (depth (cdr x)))))

(depth `((3 ()) ((3))))