;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 7: Lists

;; 7.3  Basic List Processing Techniques

(define sum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (sum (cdr lst))))))

(define filter
  (lambda (ok? lst)
    (cond ((null? lst)
           '())
          ((ok? (car lst))
           (cons (car lst) (filter ok? (cdr lst))))
          (else
           (filter ok? (cdr lst))))))

;; Chapter 8: Trees

;; 8.4  An Application: Automated Phone Books

(define make-empty-trie
  (lambda () '()))

(define make-nonempty-trie
  (lambda (root-values ordered-subtries)
    (list root-values ordered-subtries)))

(define empty-trie? null?)

(define root-values car)

(define subtries cadr)

(define subtrie-with-label
  (lambda (trie label)
    (list-ref (subtries trie) (- label 2))))

(define make-person
  (lambda (name phone-number)
    (list name phone-number)))

(define name car)

(define phone-number cadr)

;; The definition below of phone-trie is the *wrong* way to define it,
;; really, but lets you try out trie operations before you get to the
;; point of writing the values->trie constructor. This version isn't
;; in the book.  The right version, as given in the book, is at the
;; end of this file, but commented out with semicolons. Once you have
;; written values->trie, and the procedures it uses, you can delete
;; the semicolons and thereby use that definition.

(define phone-trie '(() ((() ((() (() (() ((() (() () () () () () (() (() () () () () (() (() () () () () () () (((cadbury 7464)) (() () () () () () () ())))) () ())) ())) () () () () () () ())) () (() (() (() (() () () () () (((baker 7465)) (() () () () () () () ())) () ())) () (() (() (() ((() ((() (() () () () () () (() (() () () () () () (((callebaut 7480)) (() () () () () () () ())) ())) ())) () () () () () () ())) () () () () () () ())) () () () () () ())) () () () ())) () () () ())) () () () () () () ())) () (() (() (() (() () () () () (() (() () () () () (() (() () (() (() (() (() () () () () () () (((hershey 7482)) (() () () () () () () ())))) () () () () () ())) () () () () ())) () ())) () ())) (() (() () (() (() () () () () (() ((() (() (() (() (() (() () () (() (() () () (() (() () (((ghiradelli 7476)) (() () () () () () () ())) () () () () ())) () () () ())) () () () ())) () () () () () ())) () () () () () ())) () () () () () () ())) () ())) () () () () ())) () () () () ())) (() (() () (() (() () () () (() (() (() (() () () () () () (((lindt 7483)) (() () () () () () () ())) ())) () () () () () ())) () () ())) () () () () ())) (() ((() (() () (() (() () () (() (() () () (() ((() (() () () () () (() (() (((maillard 7477)) (() () () () () () () ())) () () () () () ())) () ())) () () () () () () ())) () () () ())) () () () ())) () () () () ())) (() (() () () () () (() (() () () (() (() (() (() () () () (() (() () () () () (((merkens 7469)) (() () () () () () () ())) () ())) () () ())) () () () () () ())) () () () ())) () ())) () () () () () ())) (() (() (() (() (((see 7463)) (() () () () () () () ())) () () () (() (() () () () () () (() (() () (() (() () (() (() () () () (() ((((perugina 7007)) (() () () () () () () ())) () () () () () () ())) () () ())) () () () () ())) () () () () ())) ())) () ())) (() (() () () () () () (() (() () () () () () (() (() (() (() () () () () (((ritter 7479)) (() () () () () () () ())) () ())) () () () () () ())) ())) ())) () () (() (() () () () () (() (() () () () () () (() (() (() (() () () () (() (() () (() (() () () (() (() () (((spruengli 7009)) (() () () () () () () ())) () () () () ())) () () () ())) () () () () ())) () () ())) () () () () () ())) ())) () ())) (() ((() (() () (() ((() (() () () () () (() (() (((suchard 7654)) (() () () () () () () ())) () () () () () ())) () ())) () () () () () () ())) () () () () ())) () () () () () () ())) ())) (() (() () () () (() ((() (() () () (() (() (() (() () () () () (((tobler 7481)) (() () () () () () () ())) () ())) () () () () () ())) () () () ())) () () () () () () ())) () () ())) (() (() () (() (() () () (() ((() (() () () () () () (() (() () () () () (((wilbur 7466)) (() () () () () () () ())) () ())) ())) () () () () () () ())) () () () ())) () () () () ())))))

(define look-up-with-menu
  (lambda (phone-trie)
    (menu)
    (look-up-phone-number phone-trie)))

(define menu
  (lambda ()
    (newline)
    (display "Enter the name, one digit at a time.")
    (newline)
    (display "Indicate you are done by 0.")
    (newline)))

(define look-up-phone-number
  (lambda (phone-trie)
    (newline)
    (if (empty-trie? phone-trie)
        (display "Sorry we can't find that name.")
        (let ((user-input (read)))
          (if (= user-input 0)
              (display-phone-numbers (root-values phone-trie))
              (look-up-phone-number (subtrie-with-label
                                     phone-trie
                                     user-input)))))))

(define display-phone-numbers
  (lambda (people)
    (define display-loop
      (lambda (people)
        (cond ((null? people) 'done)
              (else (newline)
                    (display (name (car people)))
                    (display "'s phone number is ")
                    (display (phone-number (car people)))
                    (display-loop (cdr people))))))
    (if (null? people)
        (display "Sorry we can't find that name.")
        (display-loop people))))

(define explode-symbol
  (lambda (sym)
    (map string->symbol
         (map string
              (string->list (symbol->string sym))))))

(define make-labeled-value
  (lambda (labels value)
    (list labels value)))

(define labels car)

(define value cadr)

(define values->trie
  (lambda (values)
    (labeled-values->trie (map value->labeled-value
                               values))))

;; To use the version of phone-trie below, you will need to write
;; values->trie and the procedures it uses, and then you can delete
;; the semicolons that are commenting-out this version.  Until you do
;; so, there is an alternate version, earlier in this file.

;(define phone-trie
;  (values->trie (list (make-person 'lindt             7483)
;                      (make-person 'cadbury           7464)
;                      (make-person 'wilbur            7466)
;                      (make-person 'hershey           7482)
;                      (make-person 'spruengli         7009)
;                      (make-person 'merkens           7469)
;                      (make-person 'baker             7465)
;                      (make-person 'ghiradelli        7476)
;                      (make-person 'tobler            7481)
;                      (make-person 'suchard           7654)
;                      (make-person 'callebaut         7480)
;                      (make-person 'ritter            7479)
;                      (make-person 'maillard          7477)
;                      (make-person 'see               7463)
;                      (make-person 'perugina          7007))))
