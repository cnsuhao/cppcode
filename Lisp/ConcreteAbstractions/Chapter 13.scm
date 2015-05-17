;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 13: Object-based Abstractions

;; 13.1  Introduction

;; 13.2  Arithmetic Expressions Revisited

(evaluate '((3 + 4) * (9 - (2 * 3))))
;Value: 21

'((3 + 4) * 9 - 2 * 3)

'(3 - 4 + 5)

'(3 - 4 * 5)

(evaluate "(3+2)*4-40/5")

(tokenize "(3+2)*4-40/5")
;Value: (lparen 3 + 2 rparen * 4 - 40 / 5 $)

(make-ra-stack) 
  ;; returns a newly created empty stack.

(empty-ra-stack? ra-stack) 
  ;; returns #t if ra-stack is empty, otherwise #f.

(height ra-stack) 
  ;; returns the height (i.e., number of elements) in ra-stack.

(top-minus ra-stack offset) 
  ;; returns the element which is offset items below the top of
  ;; ra-stack, provided 0 <= offset < (height ra-stack).
  ;; In particular, (top-minus ra-stack 0) returns the top of 
  ;; ra-stack, provided ra-stack is non-empty.

(pop! ra-stack) 
  ;; removes the top element of ra-stack, provided ra-stack is
  ;; non-empty.
  ;; The return value is the modified ra-stack.

(push! ra-stack item) 
  ;; pushes item onto the top of ra-stack.
  ;; The return value is the modified ra-stack.

(define evaluate
  (lambda (expression-string)
    (let ((expr-stack (make-ra-stack)))
      (define process
        (lambda (rest-of-expr)
          (let ((next-token (car rest-of-expr)))
            (cond ((accept? expr-stack next-token)
                   (top-minus expr-stack 0))
                  ((reduce? expr-stack next-token)
                   (reduce! expr-stack)
                   (process rest-of-expr))
                  ((shift? expr-stack next-token)
                   (push! expr-stack next-token)
                   (process (cdr rest-of-expr)))
                  (else  ; error
                   (error "EVALUATE: syntax error"
                          expr-stack rest-of-expr))))))
      (push! expr-stack '$)
      (process (tokenize expression-string)))))

(define accept?
  (lambda (expr-stack next-token)
    (if (and (number? (top-minus expr-stack 0))
             (equal? next-token '$))
        (equal? (top-minus expr-stack 1) '$)
        #f)))

(define reduce?
  (lambda (expr-stack next-token)
    (let ((stack-top (top-minus expr-stack 0)))
      (cond ((number? stack-top)
             (let ((stack-second (top-minus expr-stack 1)))
               (cond ((equal? next-token '$)
                      (operator? stack-second))
                     ((operator? next-token)
                      (and (operator? stack-second)
                           (not (lower-precedence?
                                 stack-second
                                 next-token))))
                     ((equal? next-token 'rparen)
                      (operator? stack-second))
                     (else #f))))
            ((equal? stack-top 'rparen)
             (or (equal? next-token '$)
                 (operator? next-token)
                 (equal? next-token 'rparen)))
            (else #f)))))

(define shift?
  (lambda (expr-stack next-token)
    (let ((stack-top (top-minus expr-stack 0)))
      (cond ((or (operator? stack-top)
                 (member stack-top '($ lparen)))
             (or (number? next-token)
                 (equal? next-token 'lparen)))
            ((number? stack-top)
             (let ((stack-second (top-minus expr-stack 1)))
               (cond ((operator? next-token)
                      (or (not (operator? stack-second))
                          (lower-precedence? stack-second
                                             next-token)))
                     ((equal? next-token 'rparen)
                      (equal? stack-second 'lparen))
                     (else #f))))
            (else #f)))))

(define reduce!
  (lambda (expr-stack)
    (cond ((equal? (top-minus expr-stack 0) 'rparen)
           (let ((value (top-minus expr-stack 1)))
             (pop! expr-stack)  ; remove rparen
             (pop! expr-stack)  ; remove the value
             (pop! expr-stack)  ; remove lparen
             (push! expr-stack value)))
          (else ; a simple arithmetic operation
           (let ((left-operand  (top-minus expr-stack 2))
                 (operator      (top-minus expr-stack 1))
                 (right-operand (top-minus expr-stack 0)))
             (pop! expr-stack)  ; remove the right operand
             (pop! expr-stack)  ; remove the operator
             (pop! expr-stack)  ; remove the left operand
             (push! expr-stack
                    ((look-up-value operator)
                      left-operand
                      right-operand)))))))

(define operator?
  (lambda (token)
    (member token '(+ - * /))))

(define lower-precedence?
  (lambda (op-1 op-2)
    (and (member op-1 '(+ -))
         (member op-2 '(* /)))))

(define operator-char?
  (lambda (char)
    (member char '(#\+ #\- #\* #\/))))

(define tokenize
  (lambda (input-string)
    (define iter
      (lambda (i prev-state acc-lst)
        (if (= i (string-length input-string))
            acc-lst
            (let ((next-char (string-ref input-string i)))
              (cond ((equal? next-char #\space)
                     (iter (+ i 1) 'read-space
                           acc-lst))
                    ((char-numeric? next-char) ;next-char is a digit
                     (if (equal? prev-state 'read-numeric)
                         ;; continue constructing the number, digit
                         ;; by digit, by adding the current digit
                         ;; to 10 times the amount read so far
                         (iter (+ i 1) 'read-numeric
                               (cons (+ (* 10 (car acc-lst))
                                        (digit->number next-char))
                                     (cdr acc-lst)))
                         (iter (+ i 1) 'read-numeric
                               (cons (digit->number next-char)
                                     acc-lst))))
                    ((operator-char? next-char)
                     (iter (+ i 1) 'read-operator
                           (cons (string->symbol
                                  (make-string 1 next-char))
                                 acc-lst)))
                    ((equal? next-char #\()
                     (iter (+ i 1) 'read-lparen
                           (cons 'lparen
                                 acc-lst)))
                    ((equal? next-char #\))
                     (iter (+ i 1) 'read-rparen
                           (cons 'rparen
                                 acc-lst)))
                    (else
                     (error "illegal character in input"
                            next-char)))))))
    (reverse (cons '$ (iter 0 'start '())))))

(define digit->number
  (lambda (digit-char)
    (string->number (string digit-char))))

;; 13.3  RA-Stack Implementations and Representation Invariants

(define display-ra-stack
  (lambda (ra-stack)
    (define display-from
      (lambda (offset)
        (cond ((= offset 0)
               (display (top-minus ra-stack 0))
               'done)
              (else    
               (display (top-minus ra-stack offset))
               (display " ")
               (display-from (- offset 1))))))
    (if (empty-ra-stack? ra-stack)
        (display "empty-stack")
        (display-from (- (height ra-stack) 1)))))

(make-ra-stack-with-at-most max-num) 
  ;; returns an empty stack that can't grow beyond max-num items

(define make-ra-stack
  (lambda ()
    (make-ra-stack-with-at-most 8))) 

(define make-ra-stack-with-at-most
  (lambda (max-height)
    (let ((header (make-vector 2))
          (cells (make-vector max-height)))
      (vector-set! header 0 0)     ; header[0] = height = 0
      (vector-set! header 1 cells) ; header[1] = cells
      header)))

(define height
  (lambda (ra-stack)
    (vector-ref ra-stack 0)))

(define empty-ra-stack?
  (lambda (ra-stack)
    (= 0 (height ra-stack))))

(define cells  ; use only within the ADT implementation
  (lambda (ra-stack)
    (vector-ref ra-stack 1)))

(define top-minus
  (lambda (ra-stack offset)
    (cond ((< offset 0)
           (error "TOP-MINUS: offset < 0" offset))
          ((>= offset (height ra-stack))
           (error "TOP-MINUS: offset too large for stack"
                  offset (height ra-stack)))
          (else
           (vector-ref (cells ra-stack)
                       (- (height ra-stack)
                          (+ offset 1)))))))

(define pop!
  (lambda (ra-stack)
    (if (empty-ra-stack? ra-stack)
        (error "POP!: attempted pop from an empty stack")
        (begin
          (set-height! ra-stack
                       (- (height ra-stack) 1))
          ra-stack))))

(define set-height!  ; use only within the ADT implementation
  (lambda (ra-stack new-height)
    (vector-set! ra-stack 0 new-height)))

(define push!
  (lambda (ra-stack item)
    (if (<= (vector-length (cells ra-stack))
            (height ra-stack))
        (error "PUSH!: attempted push onto a full stack")
        (begin
          (vector-set! (cells ra-stack)
                       (height ra-stack)
                       item)
          (set-height! ra-stack
                       (+ (height ra-stack) 1))
          ra-stack))))

(define make-node
  (lambda (element rest)
    (let ((node (make-vector 2)))
      (vector-set! node 0 element)
      (vector-set! node 1 rest)
      node)))

(define node-element
  (lambda (node)
    (vector-ref node 0)))

(define node-rest
  (lambda (node)
    (vector-ref node 1)))

(define make-ra-stack
  (lambda ()
    (make-node 0 '()))) ; height 0, no other nodes

(define height
  (lambda (ra-stack)
    (node-element ra-stack)))

(define nodes-down
  (lambda (n node-list)
    (if (= n 0)
        node-list
        (nodes-down (- n 1) (node-rest node-list)))))

(define top-minus
  (lambda (ra-stack offset)
    (cond ((< offset 0)
           (error "TOP-MINUS: offset < 0" offset))
          ((>= offset (height ra-stack))
           (error "TOP-MINUS: offset too large for stack"
                  offset (height ra-stack)))
          (else
           (node-element (nodes-down (+ offset 1) ra-stack))))))

(define node-set-element!
  (lambda (node new-element)
    (vector-set! node 0 new-element)))

(define node-set-rest!
  (lambda (node new-rest)
    (vector-set! node 1 new-rest)))

(node-set-element! ra-stack (- (height ra-stack) 1))

(node-set-rest! ra-stack (nodes-down ra-stack 2))

(define pop!
  (lambda (ra-stack)
    (if (empty-ra-stack? ra-stack)
        (error "POP!: attempted pop from an empty stack")
        (begin (node-set-element! ra-stack (- (height ra-stack) 1))
               (node-set-rest! ra-stack (nodes-down 2 ra-stack))
               ra-stack))))

(define push!
  (lambda (ra-stack item)
    (let ((new-node (make-node item (node-rest ra-stack))))
      (node-set-rest! ra-stack new-node)
      (node-set-element! ra-stack (+ (height ra-stack) 1))
      ra-stack)))

(define make-node cons)
(define node-element car)
(define node-rest cdr)
(define node-set-element! set-car!)
(define node-set-rest! set-cdr!)

;; 13.4  Queues

(make-queue) 
  ;; returns a newly created empty queue.

(empty-queue? queue) 
  ;; returns #t if queue is empty, otherwise #f.

(head queue) 
  ;; returns the element which is at the head of queue,
  ;; that is, the element that has been waiting the longest,
  ;; provided queue is nonempty.

(dequeue! queue) 
  ;; removes the head of queue, provided queue is
  ;; nonempty. The return value is the modified queue.

(enqueue! queue item) 
  ;; inserts item at the tail of queue, that is, as the most
  ;; recent arrival. The return value is the modified queue.

(define queue-length ; use only within the ADT implementation
  (lambda (queue)
    (vector-ref queue 0)))

(define set-queue-length! ; use only within the ADT implementation
  (lambda (queue new-length)
    (vector-set! queue 0 new-length)))

(define queue-start ;use only within the ADT implementation
  (lambda (queue)
    (vector-ref queue 1)))

(define set-queue-start! ; use only within the ADT implementation
  (lambda (queue new-start)
    (vector-set! queue 1 new-start)))

(define queue-cells ; use only within the ADT implementation
  (lambda (queue)
    (vector-ref queue 2)))

(define set-queue-cells! ; use only within the ADT implementation
  (lambda (queue new-cells)
    (vector-set! queue 2 new-cells)))

(define make-queue
  (lambda ()
    (let ((cells (make-vector 8)) ; 8 is arbitrary
          (header (make-vector 3)))
      (set-queue-length! header 0)
      (set-queue-start! header 0) ; arbitrary start
      (set-queue-cells! header cells)
      header)))

(define empty-queue?
  (lambda (queue)
    (= (queue-length queue) 0)))

(define head
  (lambda (queue)
    (if (empty-queue? queue)
        (error "attempt to take head of an empty queue")
        (vector-ref (queue-cells queue)
                    (queue-start queue)))))

(define enqueue!
  (lambda (queue new-item)
    (let ((length (queue-length queue))
          (start (queue-start queue))
          (cells (queue-cells queue)))
      (if (= length (vector-length cells))
          (begin
            (enlarge-queue! queue)
            (enqueue! queue new-item))
          (begin
            (vector-set! cells
                         (remainder (+ start length)
                                    (vector-length cells))
                         new-item)
            (set-queue-length! queue (+ length 1))
            queue)))))

(define enlarge-queue! ;use only within the ADT implementation
  (lambda (queue)
    (let ((length (queue-length queue))
          (start (queue-start queue))
          (cells (queue-cells queue)))
      (let ((cells-length (vector-length cells)))
        (let ((new-cells (make-vector (* 2 cells-length))))
          (from-to-do
           0 (- length 1)
           (lambda (i)
             (vector-set! new-cells i
                          (vector-ref cells
                                      (remainder (+ start i)
                                                 cells-length)))))
          (set-queue-start! queue 0)
          (set-queue-cells! queue new-cells)
          queue)))))

;; 13.5  Binary Search Trees Revisited

(make-red-black-tree) 
  ;; returns a newly created empty red-black tree.

(red-black-in? item rb-tree) 
  ;; returns #t if item is in rb-tree, otherwise #f.

(red-black-insert! item rb-tree) 
  ;; inserts item into rb-tree, maintaining red-black invariants.
  ;; If item is already in rb-tree, another copy of item
  ;; is inserted.

(define make-empty-ranked-btree
  (lambda ()
    (let ((tree (make-vector 6)))
      (vector-set! tree 0 #t) ; empty-tree? = true
      (vector-set! tree 2 #f) ; has no parent
      (vector-set! tree 5 0)  ; rank = 0
      tree)))

(define empty-tree?
  (lambda (tree)
    (vector-ref tree 0)))

(define set-empty! ;makes tree empty
  (lambda (tree)
    (vector-set! tree 0 #t)))

(define value
  (lambda (tree)
    (vector-ref tree 1)))

(define set-value!
  (lambda (tree item)
    (vector-set! tree 0 #f) ;not empty
    (vector-set! tree 1 item)))

(define parent
  (lambda (tree)
    (vector-ref tree 2)))

(define root?
  (lambda (tree)
    (not (vector-ref tree 2))))

(define left-subtree
  (lambda (tree)
    (vector-ref tree 3)))

(define set-left-subtree!
  (lambda (tree new-subtree)
    (vector-set! new-subtree 2 tree) ;parent
    (vector-set! tree 3 new-subtree)))

(define right-subtree
  (lambda (tree)
    (vector-ref tree 4)))

(define set-right-subtree!
  (lambda (tree new-subtree)
    (vector-set! new-subtree 2 tree) ;parent
    (vector-set! tree 4 new-subtree)))

(define rank
  (lambda (tree)
    (vector-ref tree 5)))

(define set-rank!
  (lambda (tree rank)
    (vector-set! tree 5 rank)))

(define which-subtree
  (lambda (tree)
    ;; Returns the symbol left if tree is left-subtree of its
    ;; parent and the symbol right if it is the right-subtree
    (cond ((root? tree)
           (error "WHICH-SUBTREE called at root of tree."))
          ((eq? tree (left-subtree (parent tree)))
           'left)
          (else 'right))))

(define sibling
  (lambda (tree)
    (cond ((root? tree)
           (error "SIBLING called at root of tree."))
          ((equal? (which-subtree tree) 'left)
           (right-subtree (parent tree)))
          (else
           (left-subtree (parent tree))))))

(make-binary-search-tree) 
  ;; returns a newly created empty binary search tree.

(binary-search-in? item bs-tree) 
  ;; returns #t if item is in bs-tree, otherwise #f.

(binary-search-insert! item bs-tree) 
  ;; inserts item into bs-tree, maintaining the binary search
  ;; invariant. If item is already in bs-tree, another
  ;; copy of item is inserted.

(define make-binary-search-tree make-empty-ranked-btree)

(define binary-search-in?
  (lambda (item bs-tree)
    (cond ((empty-tree? bs-tree)
           #f)
          ((= item (value bs-tree))
           #t)
          ((< item (value bs-tree))
           (binary-search-in? item (left-subtree bs-tree)))
          (else
           (binary-search-in? item (right-subtree bs-tree))))))

(define insertion-point
  (lambda (item bs-tree)
    ;; This procedure finds the point at which item should be
    ;; inserted in bs-tree. In other words, it finds the empty
    ;; leaf node where it should be inserted so that the
    ;; binary search condition still holds after it is inserted.
    ;; If item is already in bs-tree, then the insertion
    ;; point will be found by searching to the right so that
    ;; the new copy will occur "later" in bs-tree.
    (cond ((empty-tree? bs-tree) bs-tree)
          ((< item (value bs-tree))
           (insertion-point item (left-subtree bs-tree)))
          (else
           (insertion-point item (right-subtree bs-tree))))))

(define binary-search-insert!
  (lambda (item bs-tree)
    ;; This procedure will insert item into bs-tree at a leaf
    ;; (using the procedure insertion-point), maintaining
    ;; the binary search condition on bs-tree. The return value
    ;; is the subtree that has item at its root.
    ;; If item occurs in bs-tree, another copy of item
    ;; is inserted into bs-tree
    (let ((insertion-tree (insertion-point item bs-tree)))
      (set-value! insertion-tree item)
      (set-left-subtree! insertion-tree
                         (make-binary-search-tree))
      (set-right-subtree! insertion-tree
                          (make-binary-search-tree))
      insertion-tree)))

(define make-red-black-tree make-binary-search-tree)

(define red-black-in? binary-search-in?)

(define promote!
  (lambda (node)
    (set-rank! node (+ (rank node) 1))))

(define exchange-values!
  (lambda (node-1 node-2)
    (let ((value-1 (value node-1)))
      (set-value! node-1 (value node-2))
      (set-value! node-2 value-1))))

(define exchange-left-with-right!
  (lambda (tree-1 tree-2)
    (let ((left (left-subtree tree-1))
          (right (right-subtree tree-2)))
      (set-left-subtree! tree-1 right)
      (set-right-subtree! tree-2 left))))

(define rotate-left!
  (lambda (bs-tree)
    (exchange-left-with-right! bs-tree
                               (right-subtree bs-tree))
    (exchange-left-with-right! (right-subtree bs-tree)
                               (right-subtree bs-tree))
    (exchange-left-with-right! bs-tree
                               bs-tree)
    (exchange-values! bs-tree (left-subtree bs-tree))
    'done))

(define rotate-right!
  (lambda (bs-tree)
    (exchange-left-with-right! (left-subtree bs-tree)
                               bs-tree)
    (exchange-left-with-right! (left-subtree bs-tree)
                               (left-subtree bs-tree))
    (exchange-left-with-right! bs-tree
                               bs-tree)
    (exchange-values! bs-tree (right-subtree bs-tree))
    'done))

(define red-black-insert!
  (lambda (item red-black-tree)
    (define rebalance!
      (lambda (node)
        (cond ((root? node)
               'done)
              ((root? (parent node))
               'done)
              ((< (rank node) (rank (parent (parent node))))
               'done)
              ((= (rank node) (rank (sibling (parent node))))
               (promote! (parent (parent node)))
               (rebalance! (parent (parent node))))
              (else
               (let ((path-from-grandparent
                      (list (which-subtree (parent node))
                            (which-subtree node))))
                 (cond ((equal? path-from-grandparent '(left left))
                        (rotate-right! (parent (parent node))))
                       ((equal? path-from-grandparent '(left right))
                        (rotate-left! (parent node))
                        (rotate-right! (parent (parent node))))
                       ((equal? path-from-grandparent '(right left))
                        (rotate-right! (parent node))
                        (rotate-left! (parent (parent node))))
                       (else ; '(right right)
                        (rotate-left! (parent (parent node))))))))))
    (let ((insertion-node (binary-search-insert! item
                                                 red-black-tree)))
      (set-rank! insertion-node 1)
      (rebalance! insertion-node))
    'done))

;; 13.6  An Application: Dictionaries

(define string-comparator
  (lambda (string-1 string-2)
    (cond ((string<? string-1 string-2) '<)
          ((string=? string-1 string-2) '=)
          (else '>))))

(symbol-comparator 'erick 'karl)
;Value: <

(symbol-comparator 'barbara 'Barbara)
;Value: =

(symbol-list-comparator '(karl wesley)
                        '(karl knight))
;Value: >

(symbol-list-comparator '(abba dabba)
                        '(abba dabba doo))
;Value: <

(make-dictionary key-comparator key-extractor) 
  ;; returns a newly created empty dictionary with given
  ;; key-comparator and key-extractor

(dictionary-retrieve key dictionary) 
  ;; returns the list of all items in dictionary matching key

(dictionary-insert! item dictionary) 
  ;; inserts item into dictionary, allowing multiple copies

(insertion-point item bs-tree
                 key-comparator key-extractor)

(binary-search-insert! item bs-tree
                       key-comparator key-extractor)

(define bs-tree (make-binary-search-tree))

(begin (binary-search-insert! (make-movie '(amarcord)
                                          '(federico fellini)
                                          1974
                                          '((magali noel)
                                            (bruno zanin)
                                            (pupella maggio)
                                            (armando drancia)))
                              bs-tree
                              symbol-list-comparator
                              movie-title)
       'done)

(begin (binary-search-insert! (make-movie '(the big easy)
                                          '(jim mcbride)
                                          1987
                                          '((dennis quaid) 
                                            (ellen barkin)
                                            (ned beatty)
                                            (lisa jane persky)
                                            (john goodman)
                                            (charles ludlam)))
                              bs-tree
                              symbol-list-comparator
                              movie-title)
       'done)

(display-ranked-btree-by bs-tree movie-title)
(amarcord) (rank 0)
  empty (rank 0)
  (the big easy) (rank 0)
    empty (rank 0)
    empty (rank 0)

(binary-search-retrieve '(the big easy)
                        bs-tree
                        symbol-list-comparator
                        movie-title)
;Value: (((the big easy) (jim mcbride) 1987 ((dennis quaid)
(ellen barkin) (ned beatty) (lisa jane persky) (john goodman)
(charles ludlam))))

(define make-red-black-tree make-binary-search-tree)

(define red-black-retrieve binary-search-retrieve)

(define rb-tree (make-red-black-tree))

(red-black-insert! (make-movie '(amarcord)
                               '(federico fellini)
                               1974
                               '((magali noel)
                                 (bruno zamin)
                                 (pupella maggio)
                                 (armando drancia)))
                   rb-tree
                   symbol-list-comparator
                   movie-title)

(define make-dictionary
  (lambda (key-comparator key-extractor)
    (vector key-comparator
            key-extractor
            (make-red-black-tree))))

(define key-comparator
  (lambda (dictionary)
    (vector-ref dictionary 0)))

(define key-extractor
  (lambda (dictionary)
    (vector-ref dictionary 1)))

(define red-black-tree
  (lambda (dictionary)
    (vector-ref dictionary 2)))

(define our-movies-by-title
  (make-dictionary symbol-list-comparator movie-title))

(define our-movies-by-director
  (make-dictionary symbol-list-comparator movie-director))

(for-each (lambda (n)
            (newline)
            (display (* n n)))
          '(1 2 3 4))
1
4
9
16

;; Review Problems

(make-game-state n m) 
  ;; returns a game state with n coins in the first
  ;; pile and m coins in the second pile

(size-of-pile game-state p) 
  ;; returns an integer equal to the number of coins
  ;; in the p-th pile of the game-state (p = 1 or 2)

(remove-coins-from-pile! game-state n p) 
  ;; changes game-state so that there are n fewer
  ;; coins in pile p (p = 1 or 2). The return value of
  ;; remove-coins-from-pile! is unspecified.

(define make-widget
  (lambda ()
    (let ((widget (make-vector 3)))
      (vector-set! widget 0 'empty)
      (vector-set! widget 1 'empty)
      (vector-set! widget 2 0)
      widget)))

(define insert-into-widget!
  (lambda (widget value)
    (let ((place (vector-ref widget 2)))
      (vector-set! widget place value)
      (vector-set! widget 2 (remainder (+ place 1) 2))
      'done)))

(define retrieve-from-widget
  (lambda (widget)
    (vector-ref widget (vector-ref widget 2))))

(define make-read-eval-print-loop-state
  (lambda ()
    (make-vector 1)))

(define set-global-environment!
  (lambda (repl-state new-global-env)
    (vector-set! repl-state 0 new-global-env)))

(define get-global-environment
  (lambda (repl-state)
    (vector-ref repl-state 0)))

(define repl-state (make-read-eval-print-loop-state))
