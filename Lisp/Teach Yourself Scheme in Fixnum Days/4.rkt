;(define p 80)
;
;(if (> p 70) 
;    'safe
;    'unsafe)
;
;(if (< p 90)
;    'low-pressure) ;no ``else'' branch
;
;(define c #\c)
;(if (char<? c #\c) -1
;    (if (char=? c #\c) 0
;        1))
;(cond ((char<? c #\c) -1)
;      ((char=? c #\c) 0)
;      (else 1))
;
;(case c
;  ((#\a) 1)
;  ((#\b) 2)
;  ((#\c) 3)
;  (else 4))

(and 1 2) 
(and #f 1) 
(or 1 2) 
(or #f #f) 
(and 1 #f expression-guaranteed-to-cause-error)
(or 1 #f expression-guaranteed-to-cause-error)