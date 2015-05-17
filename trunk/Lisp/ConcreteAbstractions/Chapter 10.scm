;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 10: Implementing Programming Languages

;; 10.1  Introduction

;; 10.2  Syntax

(define syntax-ok?
  (lambda (pmse)
    (define loop
      (lambda (p/a-list)
        (cond ((null? p/a-list) #f)
              ((matches? (pattern (car p/a-list)) pmse)
               (apply (action (car p/a-list))
                      (substitutions-in-to-match
                       (pattern (car p/a-list))
                       pmse)))
              (else (loop (cdr p/a-list)))))) ;end of loop
    (cond ((or (number? pmse) ;main syntax-ok? procedure
               (string? pmse)
               (boolean? pmse)) ;pmse is a literal
           #t)
          ((name? pmse) #t)  
          ((list? pmse) ;try matching it against the patterns
           (loop micro-scheme-syntax-ok?-p/a-list))
          (else #f))))
	   
(define micro-scheme-syntax-ok?-p/a-list
  (list
   (make-pattern/action '(if _ _ _)
                        (lambda (test if-true if-false)
                          (and (syntax-ok? test)
                               (syntax-ok? if-true)
                               (syntax-ok? if-false))))
   (make-pattern/action '(lambda _ _)
                        (lambda (parameters body)
                          (and (list? parameters)
                               ((all-are name?) parameters)
                               (syntax-ok? body))))
   (make-pattern/action '(quote _)
                        (lambda (datum) #t))
   (make-pattern/action '(...)   ; note that this *must* come last
                        (lambda (pmses)
                          ((all-are  syntax-ok?) pmses)))))

;; 10.3  Micro-Scheme

(define read-eval-print-loop
  (lambda ()
    (display ";Enter Micro-Scheme expression:")
    (newline)
    (let ((expression (read)))
      (let ((value (evaluate (parse expression))))
        (display ";Micro-Scheme value: ")
        (write value)
        (newline)))
    (read-eval-print-loop)))

(define parse
  (lambda (expression)
    (define loop
      (lambda (p/a-list)
        (cond ((null? p/a-list)
               (error "invalid expression" expression))
              ((matches? (pattern (car p/a-list)) expression)
               (apply (action (car p/a-list))
                      (substitutions-in-to-match
                       (pattern (car p/a-list))
                       expression)))
              (else (loop (cdr p/a-list)))))) ;end of loop
    (cond ((name? expression) ;start of main parse procedure
           (make-name-ast expression))
          ((or (number? expression)
               (string? expression)
               (boolean? expression))
           (make-constant-ast expression))
          ((list? expression)
           (loop micro-scheme-parsing-p/a-list))
          (else (error "invalid expression" expression)))))
	   
(define micro-scheme-parsing-p/a-list
  (list
   (make-pattern/action '(if _ _ _)
                        (lambda (test if-true if-false)
                          (make-conditional-ast (parse test)
                                                (parse if-true)
                                                (parse if-false))))
   (make-pattern/action '(lambda _ _)
                        (lambda (parameters body)
                          (if (and (list? parameters)
                                   ((all-are name?) parameters))  
                              (make-abstraction-ast parameters
                                                    (parse body))
                              (error "invalid expression"
                                     (list 'lambda
                                           parameters body)))))
   (make-pattern/action '(quote _)
                        (lambda (value)
                          (make-constant-ast value)))
   (make-pattern/action '(...)   ; note that this *must* come last
                        (lambda (operator&operands)
                          (let ((asts (map parse
                                           operator&operands)))
                            (make-application-ast (car asts)
                                                  (cdr asts)))))))

(define evaluate
  (lambda (ast)
    (ast 'evaluate)))

(define substitute-for-in
  (lambda (value name ast)
    ((ast 'substitute-for) value name)))

(define make-name-ast
  (lambda (name)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate) (look-up-value name))
              ((equal? message 'substitute-for)
               (lambda (value name-to-substitute-for)
                 (if (equal? name name-to-substitute-for)
                     (make-constant-ast value)
                     the-ast)))
              (else (error "unknown operation on a name AST"
                           message)))))
    the-ast))

(define make-constant-ast
  (lambda (value)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate) value)
              ((equal? message 'substitute-for)
               (lambda (value name)
                 the-ast))
              (else (error "unknown operation on a constant AST"
                           message)))))
    the-ast))

(define make-conditional-ast
  (lambda (test-ast if-true-ast if-false-ast)
    (lambda (message)
      (cond ((equal? message 'evaluate)
             (if (evaluate test-ast)
                 (evaluate if-true-ast)
                 (evaluate if-false-ast)))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-conditional-ast
                (substitute-for-in value name test-ast)
                (substitute-for-in value name if-true-ast)
                (substitute-for-in value name if-false-ast))))
            (else (error "unknown operation on a conditional AST"
                         message))))))

(define make-application-ast
  (lambda (operator-ast operand-asts)
    (lambda (message)
      (cond ((equal? message 'evaluate)
             (let ((procedure (evaluate operator-ast))
                   (arguments (map evaluate operand-asts)))
               (apply procedure arguments)))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-application-ast
                (substitute-for-in value name operator-ast)
                (map (lambda (operand-ast)
                       (substitute-for-in value name operand-ast))
                     operand-asts))))
            (else (error "unknown operation on an application AST"
                         message))))))

(define make-abstraction-ast
  (lambda (parameters body-ast)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate)
               (make-procedure parameters body-ast))
              ((equal? message 'substitute-for)
               (lambda (value name)
                 (if (member name parameters)
                     the-ast
                     (make-abstraction-ast
                      parameters
                      (substitute-for-in value name body-ast)))))
              (else (error "unknown operation on an abstraction AST"
                           message)))))
    the-ast))

((lambda (x) 
   (+ x
      ((lambda (x) (* x x))
       5)))
 3)

(define make-procedure
  (lambda (parameters body-ast)
    (lambda arguments
      (define loop
        (lambda (parameters arguments body-ast)
          (cond ((null? parameters)
                 (if (null? arguments)
                     (evaluate body-ast)
                     (error "too many arguments")))
                ((null? arguments)
                 (error "too few arguments"))
                (else
                 (loop (cdr parameters) (cdr arguments)
                       (substitute-for-in (car arguments)
                                          (car parameters)
                                          body-ast))))))
      (loop parameters arguments body-ast))))

(define foo (lambda x x))

;Enter Micro-Scheme expression:
(with x = (+ 2 1) compute (* x x))
;Micro-Scheme value: 9

;; 10.4  Global Definitions: Turning Micro-Scheme into Mini-Scheme

((lambda (x) (* x x))
 3)

(let ((square (lambda (x) (* x x))))
  (square 3))

(let ((square (lambda (x) (* x x))))
  (let ((cylinder-volume (lambda (radius height)
                           (* (* 3.1415927 (square radius))
                              height))))
    (cylinder-volume 5 4)))

(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (* (factorial (- n 1))
           n))))

(define read-eval-print-loop
  (lambda ()
    (define loop
      (lambda (global-environment)
        (display ";Enter Mini-Scheme expr. or definition:")
        (newline)
        (let ((expression-or-definition (read)))
          (if (definition? expression-or-definition)
              (let ((name (definition-name
                            expression-or-definition))
                    (value (evaluate-in
                            (parse (definition-expression
                                     expression-or-definition))
                            global-environment)))
                (display ";Mini-scheme defined: ")
                (write name)
                (newline)
                (loop (extend-global-environment-with-naming
                       global-environment
                       name value)))
              (let ((value (evaluate-in
                            (parse expression-or-definition)
                            global-environment)))
                (display ";Mini-scheme value: ")
                (write value)
                (newline)
                (loop global-environment))))))
    (loop (make-initial-global-environment))))

(define definition?
  (lambda (x)
    (and (list? x)
         (matches? '(define _ _) x))))

(define definition-name cadr)

(define definition-expression caddr)

(define evaluate-in
  (lambda (ast global-environment)
    ((ast 'evaluate-in) global-environment)))

(define make-name-ast
  (lambda (name)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate-in)
               (lambda (global-environment)
                 (look-up-value-in name global-environment)))
              ((equal? message 'substitute-for)
               (lambda (value name-to-substitute-for)
                 (if (equal? name name-to-substitute-for)
                     (make-constant-ast value)
                     the-ast)))
              (else (error "unknown operation on a name AST"
                           message)))))
    the-ast))

(define make-constant-ast
  (lambda (value)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate-in)
               (lambda (global-environment)
                 value))
              ((equal? message 'substitute-for)
               (lambda (value name)
                 the-ast))
              (else (error "unknown operation on a constant AST"
                           message)))))
    the-ast))

(define make-conditional-ast
  (lambda (test-ast if-true-ast if-false-ast)
    (lambda (message)
      (cond ((equal? message 'evaluate-in)
             (lambda (global-environment)
               (if (evaluate-in test-ast global-environment)
                   (evaluate-in if-true-ast global-environment)
                   (evaluate-in if-false-ast global-environment))))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-conditional-ast
                (substitute-for-in value name test-ast)
                (substitute-for-in value name if-true-ast)
                (substitute-for-in value name if-false-ast))))
            (else (error "unknown operation on a conditional AST"
                         message))))))

(define make-abstraction-ast
  (lambda (parameters body-ast)
    (define the-ast
      (lambda (message)
        (cond ((equal? message 'evaluate-in)
               (lambda (global-environment)
                 (make-procedure parameters body-ast)))
              ((equal? message 'substitute-for)
               (lambda (value name)
                 (if (member name parameters)
                     the-ast
                     (make-abstraction-ast
                      parameters
                      (substitute-for-in value name body-ast)))))
              (else (error "unknown operation on an abstraction AST"
                           message)))))
    the-ast))

(define make-application-ast
  (lambda (operator-ast operand-asts)
    (lambda (message)
      (cond ((equal? message 'evaluate-in)
             (lambda (global-environment)
               (let ((procedure (evaluate-in operator-ast
                                             global-environment))
                     (arguments (map (lambda (ast)
                                       (evaluate-in
                                        ast
                                        global-environment))
                                     operand-asts)))
                 (apply procedure
                        (cons global-environment arguments)))))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-application-ast
                (substitute-for-in value name operator-ast)
                (map (lambda (operand-ast)
                       (substitute-for-in value
                                          name
                                          operand-ast))
                     operand-asts))))
            (else (error "unknown operation on an application AST"
                         message))))))

(define make-procedure
  (lambda (parameters body-ast)
    (lambda global-environment&arguments
      (let ((global-environment (car global-environment&arguments))
            (arguments (cdr global-environment&arguments)))
        (define loop
          (lambda (parameters arguments body-ast)
            (cond ((null? parameters)
                   (if (null? arguments)
                       (evaluate-in body-ast global-environment)
                       (error "too many arguments")))
                  ((null? arguments)
                   (error "too few arguments"))
                  (else
                   (loop (cdr parameters) (cdr arguments)
                         (substitute-for-in (car arguments)
                                            (car parameters)
                                            body-ast))))))
        (loop parameters arguments body-ast)))))

(define look-up-value-in
  (lambda (name global-environment)
    (global-environment name)))

(define make-initial-global-environment
  (lambda ()
    (lambda (name)
      return the built-in procedure called name)))

(define extend-global-environment-with-naming
  (lambda (old-environment name value)
    (lambda (n)
      (if (equal? n name)
          value
          (old-environment n)))))

(define make-mini-scheme-version-of
  (lambda (procedure)
    (lambda global-environment&arguments
      (let ((global-environment (car global-environment&arguments))
            (arguments (cdr global-environment&arguments)))
        (apply procedure arguments)))))

(define ms+ (make-mini-scheme-version-of +))

(ms+ (make-initial-global-environment) 2 2)
;Value: 4

(define make-initial-global-environment
  (lambda ()
    (let ((ms+ (make-mini-scheme-version-of +))
          (ms- (make-mini-scheme-version-of -))
          ;; the rest get similarly converted in here
          )
      (lambda (name)
        (cond ((equal? name '+) ms+)
              ((equal? name '-) ms-)
              ;; the rest get similarly selected in here
              (else (error "Unrecognized name" name)))))))

;; 10.5  An Application: Adding Explanatory Output to Mini-Scheme

(define evaluate-in    ; Warning: this version doesn't work
  (lambda (ast global-environment)
    (display ";Mini-Scheme evaluating: ")
    (write ast)
    (newline)
    ((ast 'evaluate-in) global-environment)))

(define evaluate-in
  (lambda (ast global-environment)
    (display ";Mini-Scheme evaluating: ")
    (write (unparse ast))
    (newline)
    ((ast 'evaluate-in) global-environment)))

(define unparse
  (lambda (ast)
    (ast 'unparse)))

(define make-application-ast
  (lambda (operator-ast operand-asts)
    (lambda (message)
      (cond ((equal? message 'unparse)
             (cons (unparse operator-ast)
                   (map unparse operand-asts)))
            ((equal? message 'evaluate-in)
             (lambda (global-environment)
               (let ((procedure (evaluate-in operator-ast
                                             global-environment))
                     (arguments (map (lambda (ast)
                                       (evaluate-in
                                        ast
                                        global-environment))
                                     operand-asts)))
                 (apply procedure
                        (cons global-environment arguments)))))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-application-ast
                (substitute-for-in value name operator-ast)
                (map (lambda (operand-ast)
                       (substitute-for-in value
                                          name
                                          operand-ast))
                     operand-asts))))
            (else (error "unknown operation on an application AST"
                         message))))))

(define evaluate-in-at
  (lambda (ast global-environment level)
    (display ";Mini-Scheme evaluating:")
    (display-times " " level)
    (write (unparse ast))
    (newline)
    ((ast 'evaluate-in-at) global-environment level)))

(define display-times
  (lambda (output count)
    (if (= count 0)
        'done
        (begin (display output)
               (display-times output (- count 1))))))

(define make-application-ast
  (lambda (operator-ast operand-asts)
    (lambda (message)
      (cond ((equal? message 'unparse)
             (cons (unparse operator-ast)
                   (map unparse operand-asts)))
            ((equal? message 'evaluate-in-at)
             (lambda (global-environment level)
               (let ((procedure (evaluate-in-at operator-ast
                                                global-environment
                                                (+ level 1)))
                     (arguments (map (lambda (ast)
                                       (evaluate-in-at
                                        ast
                                        global-environment
                                        (+ level 1)))
                                     operand-asts)))
                 (apply procedure
                        (cons global-environment
                              arguments)))))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-application-ast
                (substitute-for-in value name operator-ast)
                (map (lambda (operand-ast)
                       (substitute-for-in value
                                          name
                                          operand-ast))
                     operand-asts))))
            (else (error "unknown operation on an application AST"
                         message))))))

;Enter Mini-Scheme expr. or definition:
(+ (* 3 5) (* 6 7))
;Mini-Scheme evaluating: (+ (* 3 5) (* 6 7))
;Mini-Scheme evaluating:  +
;Mini-Scheme evaluating:  (* 3 5)
;Mini-Scheme evaluating:   *
;Mini-Scheme evaluating:   3
;Mini-Scheme evaluating:   5
;Mini-Scheme evaluating:  (* 6 7)
;Mini-Scheme evaluating:   *
;Mini-Scheme evaluating:   6
;Mini-Scheme evaluating:   7
;Mini-scheme value: 57

(define evaluate-in-at
  (lambda (ast global-environment level)
    (display ";Mini-Scheme evaluating:")
    (display-times " " level)
    (write (unparse ast))
    (newline)
    (let ((value ((ast 'evaluate-in-at) global-environment level)))
      (display ";Mini-Scheme value     :")
      (display-times " " level)
      (write value)
      (newline)
      value)))

;Enter Mini-Scheme expr. or definition:
(+ (* 3 5) (* 6 7))
;Mini-Scheme evaluating: (+ (* 3 5) (* 6 7))
;Mini-Scheme evaluating:  +
;Mini-Scheme value     :  #<procedure>
;Mini-Scheme evaluating:  (* 3 5)
;Mini-Scheme evaluating:   *
;Mini-Scheme value     :   #<procedure>
;Mini-Scheme evaluating:   3
;Mini-Scheme value     :   3
;Mini-Scheme evaluating:   5
;Mini-Scheme value     :   5
;Mini-Scheme value     :  15
;Mini-Scheme evaluating:  (* 6 7)
;Mini-Scheme evaluating:   *
;Mini-Scheme value     :   #<procedure>
;Mini-Scheme evaluating:   6
;Mini-Scheme value     :   6
;Mini-Scheme evaluating:   7
;Mini-Scheme value     :   7
;Mini-Scheme value     :  42
;Mini-Scheme value     : 57
;Mini-scheme value: 57

+-< (+ (* 3 5) (* 6 7))
| 
| +-< +
| +-> #<procedure>
| 
| +-< (* 3 5)
| | 
| | +-< *
| | +-> #<procedure>
| | 
| | +-< 3
| | +-> 3
| | 
| | +-< 5
| | +-> 5
| | 
| +-> 15
| 
| +-< (* 6 7)
| | 
| | +-< *
| | +-> #<procedure>
| | 
| | +-< 6
| | +-> 6
| | 
| | +-< 7
| | +-> 7
| | 
| +-> 42
| 
+-> 57

+-< ((lambda (x) (if (= x 0) 5 (* x x))) (+ 2 1))
| 
| +-< (lambda (x) (if (= x 0) 5 (* x x)))
| +-> #<procedure>
| 
| +-< (+ 2 1)
| | 
| | +-< +
| | +-> #<procedure>
| | 
| | +-< 2
| | +-> 2
| | 
| | +-< 1
| | +-> 1
| | 
| +-> 3
| 
+-- (if (= 3 0) 5 (* 3 3))
| 
| +-< (= 3 0)
| | 
| | +-< =
| | +-> #<procedure>
| | 
| | +-< 3
| | +-> 3
| | 
| | +-< 0
| | +-> 0
| | 
| +-> #f
| 
+-- (* 3 3)
| 
| +-< *
| +-> #<procedure>
| 
| +-< 3
| +-> 3
| 
| +-< 3
| +-> 3
| 
+-> 9

| +-< (+ 2 1)

| +-> 3

+-- (* 3 3)

| |

(define write-with-at
  (lambda (thing indicator level)
    (display-times "| " (- level 1))
    (display "+-")
    (display indicator)
    (display " ")
    (write thing)
    (newline)))

(define blank-line-at
  (lambda (level)
    (display-times "| " level)
    (newline)))

(define evaluate-in-at
  (lambda (ast global-environment level)
    (blank-line-at (- level 1))
    (write-with-at (unparse ast) "<" level)
    (let ((value ((ast 'evaluate-in-at) global-environment level)))
      (write-with-at value ">" level)
      value)))

(define evaluate-additional-in-at
  (lambda (ast global-environment level)
    (blank-line-at level)
    (write-with-at (unparse ast) "-" level)
    ((ast 'evaluate-in-at) global-environment level)))

;; Review Problems

((lambda (x) x) (if (+ 2 3) + 3))

(define make-conditional-ast
  (lambda (test-ast if-true-ast if-false-ast)
    (lambda (message)
      (cond ((equal? message 'evaluate)
             (let ((test-value (evaluate test-ast))
                   (if-true-value (evaluate if-true-ast))
                   (if-false-value (evaluate if-false-ast)))
               (if test-value
                   if-true-value
                   if-false-value)))
            ((equal? message 'substitute-for)
             (lambda (value name)
               (make-conditional-ast
                (substitute-for-in value name test-ast)
                (substitute-for-in value name if-true-ast)
                (substitute-for-in value name if-false-ast))))
            (else (error "unknown operation on a conditional AST"
                         message))))))

(define expt
  (lambda (b n)
    (arithmetic-if n
                   (/ 1 (expt b (- n)))
                   1
                   (* b (expt b (- n 1))))))

(define make-arithmetic-if-ast
  (lambda (test-value-ast if-neg-ast if-zero-ast if-pos-ast)
    (lambda (message)
      (cond ((equal? message 'evaluate-in)
             (lambda (global-environment)
               code for evaluate-in))
            ((equal? message 'substitute-for)
             (lambda (value name)
               code for substitute-for))
            (else (error "unknown operation on a conditional AST"
                         message))))))

(uncons (cons 3 5) into x and y in (+ x y))

(define make-uncons-ast
  (lambda (pair-ast body-ast car-name cdr-name)
    (lambda (message)
      (cond ((equal? message 'evaluate)
             code for evaluate)
            ((equal? message 'substitute-for)
             (lambda (value name)
               code for substitute-for))
            (else (error "unknown operation on a for AST"
                         message))))))

;; Notes

;; factorial-maker makes factorial when given factorial-maker
(let ((factorial-maker
       (lambda (factorial-maker)
         (lambda (n)
           (if (= n 0)
               1
               (let ((factorial
                      (factorial-maker factorial-maker)))
                 (* (factorial (- n 1))
                    n)))))))
  (let ((factorial (factorial-maker factorial-maker)))
    (factorial 52)))
