;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 8: Trees

;; 8.1  Binary Search Trees

(4 (2 (1 () ()) (3 () ())) (6 (5 () ()) (7 () ())))

(4 
 (2 
  (1 () ()) 
  (3 () ())) 
 (6 
  (5 () ()) 
  (7 () ())))

(define make-empty-tree
  (lambda () '()))

(define make-nonempty-tree
  (lambda (root left-subtree right-subtree)
    (list root left-subtree right-subtree)))

(define empty-tree? null?)

(define root car)

(define left-subtree cadr)

(define right-subtree caddr)

(define in?
  (lambda (value tree)
    (cond
     ((empty-tree? tree) #f)
     ((= value (root tree)) #t)
     ((< value (root tree)) (in? value (left-subtree tree)))
     (else ; the value must be greater than the root
      (in? value (right-subtree tree))))))

(define compare-by-director
  (lambda (video-record name)
    ; Returns one of the symbols <, =, or > according to how the
    ; director in video-record compares alphabetically to name.
    ; For example, if video-record's director alphabetically
    ; precedes name, < would be returned.
    the code implementing this would go here))

(define list-by-key
  (lambda (key-value comparator tree)
    (if (empty-tree? tree)
        '()
        (let ((comparison-result (comparator (root tree) 
                                             key-value))) 
          (cond
           ((equal? comparison-result '=)
            (cons (root tree)
                  (append (list-by-key key-value comparator
                                       (left-subtree tree))
                          (list-by-key key-value comparator
                                       (right-subtree tree)))))
           ((equal? comparison-result '<)
            (list-by-key key-value comparator
                         (right-subtree tree)))
           (else ;it must be the symbol >
            (list-by-key key-value comparator
                         (left-subtree tree))))))))

(append '(a b c) '(1 2 3 4))
;Value: (a b c 1 2 3 4)

(define preorder
  (lambda (tree)
    (if (empty-tree? tree)
        '()
        (cons (root tree)
              (append (preorder (left-subtree tree))
                      (preorder (right-subtree tree)))))))

(define preorder
  (lambda (tree)
    (preorder-onto tree '())))

(define preorder-onto
  (lambda (tree list)
    (if (empty-tree? tree)
        list
        (cons (root tree)
              (preorder-onto (left-subtree tree)
                             (preorder-onto (right-subtree tree)
                                            list))))))

(define inorder
  (lambda (tree)
    (if (empty-tree? tree)
        '()
        (append (inorder (left-subtree tree))
                (cons (root tree) 
                      (inorder (right-subtree tree)))))))

;; 8.2  Efficiency Issues with Binary Search Trees

;; 8.3  Expression Trees

(define make-constant
  (lambda (x) x))

(define constant? number?)

(define make-expr
  (lambda (left-operand operator right-operand)
    (list left-operand operator right-operand)))

(define operator cadr)

(define left-operand car)

(define right-operand caddr)

(define evaluate
  (lambda (expr)
    (cond ((constant? expr) expr)
          (else ((look-up-value (operator expr))
                 (evaluate (left-operand expr))
                 (evaluate (right-operand expr)))))))

(define look-up-value
  (lambda (name)
    (cond ((equal? name '+) +)
          ((equal? name '*) *)
          ((equal? name '-) -)
          ((equal? name '/) /)
          (else (error "Unrecognized name" name)))))

(evaluate '(1 + (2 * (3 - 5))))
;Value: -3

(define post-order
  (lambda (tree)
    (define post-order-onto
      (lambda (tree list)
        (if (constant? tree)
            (cons tree list)
            (post-order-onto (left-operand tree)
                             (post-order-onto
                              (right-operand tree)
                              (cons (operator tree) list))))))
    (post-order-onto tree '())))

(post-order '(1 + (2 * (3 - 5))))
;Value: (1 2 3 5 - * +)

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

(define phone-trie   ;; This definition can't be used yet, see below
  (values->trie (list (make-person 'lindt             7483)
                      (make-person 'cadbury           7464)
                      (make-person 'wilbur            7466)
                      (make-person 'hershey           7482)
                      (make-person 'spruengli         7009)
                      (make-person 'merkens           7469)
                      (make-person 'baker             7465)
                      (make-person 'ghiradelli        7476)
                      (make-person 'tobler            7481)
                      (make-person 'suchard           7654)
                      (make-person 'callebaut         7480)
                      (make-person 'ritter            7479)
                      (make-person 'maillard          7477)
                      (make-person 'see               7463)
                      (make-person 'perugina          7007))))

;; This next definition of phone-trie is the *wrong* way to define
;;  it, really, but lets you try out trie operations before you get
;;  to the point of writing the values->trie constructor. (This isn't
;;  in the book.)
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

(look-up-with-menu phone-trie)
Enter the name, one digit at a time.
Indicate you are done with 0.

7
7
7
8
3
6
4
5
4
0
spruengli's phone number is 7009

(define explode-symbol
  (lambda (sym)
    (map string->symbol
         (map string
              (string->list (symbol->string sym))))))

(name->labels 'ritter)
;Value: (7 4 8 8 3 7)

(define make-labeled-value
  (lambda (labels value)
    (list labels value)))

(define labels car)

(define value cadr)

(define labeled-ritter
  (make-labeled-value '(7 4 8 8 3 7)
                      (make-person 'ritter 7479)))

(labels (strip-one-label labeled-ritter))
;Value: (4 8 8 3 7)

(name (value (strip-one-label labeled-ritter)))
;Value: ritter

(phone-number (value (strip-one-label labeled-ritter)))
;Value: 7479

(define values->trie
  (lambda (values)
    (labeled-values->trie (map value->labeled-value
                               values))))

(filter empty-labels? labeled-values)

;; Review Problems

(define successor-of-in-or
  (lambda (value bst if-none)
    (cond ((empty-tree? bst)
           __________)
          ((<= (root bst) value)
           (successor-of-in-or __________
                               __________
                               __________))
          (else
           (successor-of-in-or __________
                               __________
                               __________)))))
