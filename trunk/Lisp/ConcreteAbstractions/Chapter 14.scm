;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html

;; Chapter 14: Object-Oriented Programming

;; 14.1  Introduction

;; 14.2  An Object-Oriented Program

(define-class
  'item-list     ; the class is named item-list
  object-class   ; it has the object-class as its superclass
  '(item-vector  ; it has instance variables named item-vector
    num-items)   ;  and num-items
  '(add          ; and methods with these names
    display
    total-price
    delete
    choose
    empty?))

(class/set-method!
 item-list-class 'empty?
 (lambda (this)
   (= (item-list/get-num-items this) 0)))

(define example-item-list (make-item-list))

(class/set-method!
 item-list-class 'init
 (lambda (this)
   (item-list/set-item-vector! this (make-vector 10))
   (item-list/set-num-items! this 0)))

(item-list/get-num-items example-item-list)
;Value: 0

(item-list/empty? example-item-list)
;Value: #t

(object/describe example-item-list)

An instance of the class item-list
with the following instance variable values:
   num-items: 0
   item-vector: [a 10 element vector]
   class: [an object of class class]

(class/set-method!
 item-list-class 'add
 (lambda (this item)
   (let ((num-items (item-list/get-num-items this))
         (item-vector (item-list/get-item-vector this)))
      (if (= num-items (vector-length item-vector))
          (begin ; some code (yet to be determined) goes here to
                 ; replace the vector with a bigger one somehow
                 (item-list/add this item))
          (begin (vector-set! item-vector num-items item)
                 (item-list/set-num-items! this (+ num-items 1))
                 'added)))))

(define-class
  'item-list
  object-class
  '(item-vector
  num-items)
 '(
   ;; intended for public consumption:
   add
   display
   total-price
   delete
   choose
   empty?
   ;; intended for private, internal use:
   grow
   ))

(class/set-method!
 item-list-class 'add
 (lambda (this item)
   (let ((num-items (item-list/get-num-items this))
         (item-vector (item-list/get-item-vector this)))
     (if (= num-items (vector-length item-vector))
         (begin (item-list/grow this)
                (item-list/add this item))
         (begin (vector-set! item-vector num-items item)
                (item-list/set-num-items! this (+ num-items 1))
                'added)))))

(class/set-method!
 item-list-class 'display
 (lambda (this)
   (let ((num-items (item-list/get-num-items this))
         (item-vector (item-list/get-item-vector this)))
     (from-to-do
      0 (- num-items 1)
      (lambda (index)
        (display (+ index 1))
        (display ") ")
        (item/display (vector-ref item-vector index))
        (newline))))
   (display "Total: ")
   (display-price (item-list/total-price this))
   (newline)
   'displayed))

(class/set-method!
 item-list-class 'choose
 (lambda (this)
   (if (item-list/empty? this)
       (error "Can't choose an item when there aren't any.")
       (begin
         (display "Which item?")
         (newline)
         (item-list/display this)
         (vector-ref (item-list/get-item-vector this)
                     (- (input-integer-in-range
                         1 (item-list/get-num-items this))
                        1))))))

(define input-integer-in-range
  (lambda (min max)
    (display "(enter ")
    (display min)
    (display "-")
    (display max)
    (display ")")
    (newline)
    (let ((input (read)))
      (cond ((not (integer? input))
             (display "input must be an integer and wasn't")
             (newline)
             (input-integer-in-range min max))
            ((or (< input min)
                 (> input max))
             (display "input out of range")
             (newline)
             (input-integer-in-range min max))
            (else
             input)))))

(define-class
  'item
  object-class
  '(price)
  '(
    ;; intended for public consumption:
    price
    display
    input-specifics
    revise-specifics))

(define example-item (make-item 1950)) ; 1950 cents = $19.50

(class/set-method!
 item-class 'init
 (lambda (this price)
   (item/set-price! this price)))

(define-class
  'special-item
  item-class
  '()
  '())
(class/set-method!
 special-item-class 'input-specifics
 (lambda (this)
   (newline)
   (display " *** doing special input ***")
   (newline)))

(define a-normal-item (make-item 1950))

(define a-special-item (make-special-item 1000000))

(item/input-specifics a-normal-item)

(item/input-specifics a-special-item)

 *** doing special input ***

(item/revise-specifics a-normal-item)

(item/revise-specifics a-special-item)

 *** doing special input ***

(define-class
  'oxford-shirt
  item-class
  '(color
    neck
    sleeve
    specified-yet)
  '(
    ))

(define an-oxford-shirt (make-oxford-shirt))

(item/price an-oxford-shirt)
;Value: 1950

(oxford-shirt/get-specified-yet an-oxford-shirt)
;Value: #f

(class/set-method!
 oxford-shirt-class 'init
 (lambda (this)
   (item/set-price! this 1950)
   (oxford-shirt/set-specified-yet! this #f)))

(class/set-method!
 oxford-shirt-class 'init
 (lambda (this)
   (item/init this 1950)
   (oxford-shirt/set-specified-yet! this #f)))

(class/set-method!
 oxford-shirt-class 'init
 (lambda (this)
   (item^init this 1950)
   (oxford-shirt/set-specified-yet! this #f)))

(class/set-method!
 oxford-shirt-class 'display
 (lambda (this)
   (if (oxford-shirt/get-specified-yet this)
       (begin
         (display (oxford-shirt/get-color this))
         (display " Oxford-cloth shirt, size ")
         (display (oxford-shirt/get-neck this))
         (display "/")
         (display (oxford-shirt/get-sleeve this))
         (display "; "))
       (display "Oxford-cloth shirt; "))
   (item^display this)))

(let ((item-list (make-item-list)))
  (item-list/add item-list (make-item 100))
  (item-list/add item-list (make-oxford-shirt))
  (item-list/add item-list (make-item 200))
  (item-list/add item-list (make-item 300))
  (item-list/add item-list (make-oxford-shirt))
  (item-list/display item-list))

(class/set-method!
 oxford-shirt-class 'input-specifics
 (lambda (this)
   (display "What color?")
   (newline)
   (oxford-shirt/set-color!
    this (input-selection '("Ecru" "Pink" "Blue" "Maize" "White")))
   (display "What neck size? ")
   (oxford-shirt/set-neck! this (input-integer-in-range 15 18))
   (display "What sleeve length? ")
   (oxford-shirt/set-sleeve! this (input-integer-in-range 32 37))
   (oxford-shirt/set-specified-yet! this #t)
   'inputted))

(define input-selection
  (lambda (choices)
    (define display-loop
      (lambda (number choices)
        (if (null? choices)
            'done
            (begin
              (display " ")
              (display number)
              (display ") ")
              (display (car choices))
              (newline)
              (display-loop (+ number 1) (cdr choices))))))
    (display-loop 1 choices)
    (list-ref choices
              (- (input-integer-in-range 1 (length choices))
                 1))))

(define compu-duds
  (lambda ()
    (let ((item-list (make-item-list)))
      (define loop
        (lambda ()
          (newline)
          (display "What would you like to do?")
          (newline)
          (display " 1) Exit this program.")
          (newline)
          (display " 2) Add an item to your selections.")
          (newline)
          (display " 3) List the items you have selected.")
          (newline)
          (display
           " 4) See the total price of the items you selected.")
          (newline)
          (let ((option
                 (if (item-list/empty? item-list)
                     (input-integer-in-range 1 4)
                     (begin
                       (display
                        " 5) Delete one of your selections.")
                       (newline)
                       (display
                        " 6) Revise specifics of a selected item.")
                       (newline)
                       (input-integer-in-range 1 6)))))
            (newline)
            (cond ((= option 2)
                   (let ((item (input-item)))
                     (item-list/add item-list item)
                     (item/input-specifics item)))
                  ((= option 3)
                   (item-list/display item-list))
                  ((= option 4)
                   (display-price (item-list/total-price item-list))
                   (newline))
                  ((= option 5)
                   (item-list/delete item-list
                                     (item-list/choose item-list)))
                  ((= option 6)
                   (item/revise-specifics
                    (item-list/choose item-list))))
            (if (not (= option 1))
                (loop))))) ;end of the loop procedure
      (loop)))) ;this starts the loop

(define input-item
  (lambda ()
    (display "What would you like?")
    (newline)
    (display " 1) Chinos")
    (newline)
    (display " 2) Oxford-cloth shirt")
    (newline)
    (if (= (input-integer-in-range 1 2) 1)
        (make-chinos)
        (make-oxford-shirt))))

(define-class
  'chinos
  item-class
  '(color
    size   ; waist, in inches
    inseam ; also in inches
    cuffed ; #t = cuffed, #f = hemmed
    specified-yet)
  '(
    ))

(class/set-method!
 chinos-class 'init
 (lambda (this)
   (item^init this 3300) ; chinos are priced at $33.00
   (chinos/set-specified-yet! this #f)))

 (class/set-method!
  chinos-class 'display
  (lambda (this)
    (if (chinos/get-specified-yet this)
        (begin
          (display (chinos/get-color this))
          (display " chinos, size ")
          (display (chinos/get-size this))
          (display ", ")
          (display
           (if (chinos/get-cuffed this)
               "cuffed"
               "hemmed"))
          (display " to ")
          (display (chinos/get-inseam this))
          (display " inches; "))
        (display "Chinos; "))
    (item^display this)))

(class/set-method!
 chinos-class 'input-specifics
 (lambda (this)
   (display "What color?")
   (newline)
   (chinos/set-color! this
                      (input-selection
                       '("Charcoal" "Khaki" "Blue")))
   (display "What waist size? ")
   (chinos/set-size! this (input-integer-in-range 30 44))
   (display "Hemmed or cuffed?")
   (newline)
   (display " 1) Hemmed")
   (newline)
   (display " 2) Cuffed")
   (newline)
   (chinos/set-cuffed! this (= (input-integer-in-range 1 2) 2))
   (display "What inseam length? ")
   (chinos/set-inseam! this (input-integer-in-range
                             29
                             (if (chinos/get-cuffed this)
                                 34
                                 36)))
   (chinos/set-specified-yet! this #t)
   'inputted))

;; 14.3  Extensions and Variations

(show-class-hierarchy)

object
   item-list
   item
      chinos
      oxford-shirt
   class

(object/describe chinos-class)

The class chinos has the following ancestry:
   object
   item
   chinos
and the following immediate subclasses:
and the following instance variables (including inherited ones):
   specified-yet (new)
   cuffed (new)
   inseam (new)
   size (new)
   color (new)
   price (from item)
   class (from object)
and the following method names (including inherited ones):
   revise-specifics (name from item, implementation from item)
   input-specifics (name from item, new implementation)
   display (name from item, new implementation)
   price (name from item, implementation from item)
   init (name from object, new implementation)
   describe (name from object, implementation from object)

;; 14.4  Implementing an Object-oriented Programming System

(define-class
  'widget
  object-class
  '(size)
  '(activate))

(define widget-class (make-class 'widget
                                 object-class
                                 '(size)
                                 '(activate)))

(define widget? (class/predicate widget-class))

(define make-widget (class/instantiator widget-class))

(define widget/get-size (class/getter widget-class 'size))

(define widget/set-size! (class/setter widget-class 'size))

(define widget/get-class (class/getter widget-class 'class))

(define widget/set-class! (class/setter widget-class 'class))

(define widget/activate (class/method widget-class 'activate))

(define widget^activate 
  (class/non-overridable-method widget-class 'activate))

(define widget/init (class/method widget-class 'init))

(define widget^init 
  (class/non-overridable-method widget-class 'init))

(define widget/describe (class/method widget-class 'describe))

(define widget^describe
  (class/non-overridable-method widget-class 'describe))

(define widget/get-size
  (lambda (object)
    (vector-ref object 1)))

(define widget/set-size!
  (lambda (object value)
    (vector-set! object 1 value)))

(define widget/get-size (class/getter widget-class 'size))

(class/set-method!
 class-class 'getter
 (lambda (this instvar-name)
    (let ((index (class/ivar-position this instvar-name)))
      (lambda (object)
        (vector-ref object index)))))

(define widget/get-size
  (lambda (object)
    (if (widget? object)
        (vector-ref object 1)
        (error "Getter applied to object not of correct class:"
               'size 'widget))))

(class/set-method!
 class-class 'getter
 (lambda (this instvar-name)
   (let ((index (class/ivar-position this instvar-name))
         (ok? (class/predicate this)))
     (lambda (object)
       (if (ok? object)
           (vector-ref object index)
           (error
            "Getter applied to object not of correct class:"
            instvar-name (class/get-name this)))))))

(class/set-method!
 class-class 'setter
 (lambda (this instvar-name)
   (let ((index (class/ivar-position this instvar-name))
         (ok? (class/predicate this)))
     (lambda (object value)
       (if (ok? object)
           (begin
             (vector-set! object index value)
             'set-done)
           (error
            "Setter applied to object not of correct class:"
            instvar-name (class/get-name this)))))))

(define make-widget
  (lambda ()
    (make-vector 2)))

(define make-widget
  (lambda ()
    (let ((instance (make-vector 2)))
      (object/set-class! instance widget-class)
      (object/init instance)
      instance)))

(define make-widget
  (lambda ()
    (let ((instance (make-vector 2)))
      (unchecked-object/set-class! instance widget-class)
      (object/init instance)
      instance)))

(define make-widget
  (lambda init-args
    (let ((instance (make-vector 2)))
      (unchecked-object/set-class! instance widget-class)
      (apply object/init (cons instance init-args))
      instance)))

(class/set-method!
 class-class 'instantiator
 (lambda (this)
   (let ((num-ivars (class/get-num-ivars this)))
     (lambda init-args
       (let ((instance (make-vector num-ivars)))
         (unchecked-object/set-class! instance this)
         (apply object/init (cons instance init-args))
         instance)))))

(define widget/activate
  (lambda (object)
    (let ((method (vector-ref (class/get-method-vector
                               (object/get-class object))
                              2)))
      (method object))))

(define widget^activate
  (let ((method-vector (class/get-method-vector widget-class)))
    (lambda (object)
      (let ((method (vector-ref method-vector 2)))
        (method object)))))

(define widget/activate
  (lambda (object . args)
    (let ((method (vector-ref (class/get-method-vector
                               (object/get-class object))
                              2)))
      (apply method (cons object args)))))

(define widget/activate
  (let ((index (class/method-position widget-class 'activate)))
    (lambda (object . args)
      (let ((method (vector-ref (class/get-method-vector
                                 (object/get-class object))
                                index)))
        (apply method (cons object args))))))

(class/set-method!
 class-class
 'set-method!
 (lambda (this method-name method)
   (vector-set! (class/get-method-vector this)
                (class/method-position this method-name)
                method)))

(class/set-method!
 class-class
 'set-method!
 (lambda (this method-name method)
   (let ((index (class/method-position this method-name)))
     (vector-set! (class/get-method-vector this)
                  index
                  method)
     (vector-set! (class/get-method-set?-vector this)
                  index
                  #t)
     (apply-below this
                  (lambda (class)
                    (vector-set! (class/get-method-vector class)
                                 index
                                 method))
                  (lambda (class)
                    (not (vector-ref (class/get-method-set?-vector
                                      class)
                                     index)))))
   method-name))

(define apply-below
  (lambda (class proc apply-to?)
    (for-each (lambda (subclass)
                (if (apply-to? subclass)
                    (begin (proc subclass)
                           (apply-below subclass proc apply-to?))))
              (class/get-subclasses class))))

(define widget?
  (lambda (object)
    (let ((ancestry (class/get-ancestry (object/get-class object))))
      (and (> (vector-length ancestry) 1)
           (eq? (vector-ref ancestry 1)
                widget-class)))))

(define widget?
  (let ((level (- (vector-length (class/get-ancestry widget-class))
                  1))
        (min-length (class/get-num-ivars widget-class))
        (min-class-length (class/get-num-ivars class-class)))
    (lambda (object)
      (and (vector? object)
           (>= (vector-length object) min-length)
           (let ((class (object/get-class object)))
             (and (vector? class)
                  (>= (vector-length class) min-class-length)
                  (let ((a (class/get-ancestry class))
                        (size (class/get-num-ivars class)))
                    (and (number? size)
                         (= size (vector-length object))
                         (vector? a)
                         (eq? (vector-ref a
                                          (- (vector-length a) 1))
                              class)
                         (> (vector-length a) level)
                         (eq? (vector-ref a level)
                              widget-class)))))))))

(define class-class
  (make-class 'class         ; name
              object-class   ; superclass
              '(name         ; instance variables
                subclasses
                num-ivars
                ivar-alist
                num-methods
                method-alist
                method-vector
                method-set?-vector
                ancestry)
              '(instantiator ; methods
                predicate
                getter
                setter
                method
                non-overridable-method
                set-method!
                ivar-position
                method-position)))

(class/set-method!
 class-class 'init
 (lambda (this class-name superclass instvar-names method-names)
   (object^init this)
   ;; some code should go here to check that none of the new 
   ;; instvar-names or method-names are already in use in the
   ;; superclass -- and if any are, to signal an error
   (class/set-name! this class-name)
   (class/set-subclasses! this '())
   (class/set-subclasses! superclass
                          (cons this
                                (class/get-subclasses superclass)))
   (class/set-num-ivars! this (+ (class/get-num-ivars superclass)
                                 (length instvar-names)))
   (class/set-ivar-alist! this
                          ;; some code needs to go here to
                          ;; assign the positions for the instance
                          ;; variables
                          )
   (class/set-method-alist! this
                            ;; some code needs to go here to
                            ;; assign the positions for the methods
                            )
   (let ((num-methods (+ (class/get-num-methods superclass)
                         (length method-names))))
     (class/set-num-methods! this num-methods)
     (let ((method-vector (make-vector num-methods)))
       (class/set-method-vector! this method-vector)
       (vector-copy! (class/get-method-vector superclass)
                     method-vector)
       (for-each (lambda (method-name)
                   (vector-set! method-vector
                                (class/method-position this
                                                       method-name)
                                (lambda (object . args)
                                  (error "Unimplemented method"
                                         method-name))))
                 method-names))
     (let ((method-set?-vector (make-vector num-methods)))
       (class/set-method-set?-vector! this method-set?-vector)
       (vector-fill! method-set?-vector #f)))
   (let ((ancestry (make-vector (+ (vector-length
                                    (class/get-ancestry superclass))
                                   1))))
     (class/set-ancestry! this ancestry)
     (vector-copy! (class/get-ancestry superclass) ancestry)
     (vector-set! ancestry
                  (- (vector-length ancestry) 1)
                  this))))

(define alist-from-onto
  (lambda (names num alist)
    (if (null? names)
        alist
        (alist-from-onto (cdr names)
                         (+ num 1)
                         (cons (list (car names)
                                     num)
                               alist)))))

(alist-from-onto instvar-names
                 (class/get-num-ivars superclass)
                 (class/get-ivar-alist superclass))

(alist-from-onto method-names
                 (class/get-num-methods superclass)
                 (class/get-method-alist superclass))

(assq 'size '((class 0) (size 1)))
;Value: (size 1)

(assq 'color '((class 0) (size 1)))
;Value: #f

(class/set-method!
 class-class 'ivar-position
 (lambda (this ivar-name)
   (let ((lookup (assq ivar-name (class/get-ivar-alist this))))
     (if lookup
         (cadr lookup)
         (error "instance variable name not present in class"
                ivar-name (class/get-name this))))))

(class/set-method!
 class-class 'method-position
 (lambda (this method-name)
   (let ((lookup (assq method-name (class/get-method-alist this))))
     (if lookup
         (cadr lookup)
         (error "method name not present in class"
                method-name (class/get-name this))))))

(class/set-method!
 object-class 'init
 (lambda (this) 'done))

(define class-class
  (vector 'class-class-goes-here
          'class ; name
          '()    ; subclasses
          10     ; num-ivars
          '((class 0)      ; ivar-alist (These position numbers must
            (name 1)       ; be matched by the actual positioning
            (subclasses 2) ; of the items in this class-class vector
            (num-ivars 3)  ; as well as the ones in the object-class
            (ivar-alist 4) ; vector below.)
            (num-methods  5)
            (method-alist 6)
            (method-vector 7)
            (method-set?-vector 8)
            (ancestry 9))
          11     ; num-methods
          '((init 0) ; method-alist
            (describe 1)
            (instantiator 2)
            (predicate 3)
            (getter 4)
            (setter 5)
            (method 6)
            (non-overridable-method 7)
            (set-method! 8)
            (ivar-position 9)
            (method-position 10))
          (make-vector 11)    ; method-vector
          (make-vector 11)    ; method-set?-vector
          (make-vector 2)))   ; ancestry

(unchecked-object/set-class! class-class class-class)

(define object-class
  (vector class-class         ; class
          'object             ; name
          (list class-class)  ; subclasses
          1                   ; num-ivars
          '((class 0))        ; ivar-alist
          2                   ; num-methods
          '((init 0)          ; method-alist
            (describe 1))
          (make-vector 2)     ; method-vector
          (make-vector 2)     ; method-set?-vector
          (make-vector 1)))   ; ancestry

(define class/get-ancestry (lambda (obj) (vector-ref obj 9)))

(vector-fill! (class/get-method-set?-vector object-class) #f)

(vector-fill! (class/get-method-set?-vector class-class) #f)

(vector-set! (class/get-ancestry object-class)
             0
             object-class)

(let ((a (class/get-ancestry class-class)))
  (vector-set! a 0 object-class)
  (vector-set! a 1 class-class))

(define class/method-position ; temporary real, later replaced
  (lambda (this method-name)  ; with virtual
    (let ((lookup (assq method-name
                        (class/get-method-alist this))))
      (if lookup
          (cadr lookup)
          (error "method name not present in class"
                 method-name (class/get-name this))))))

(define class/set-method! ; temporary real, later replaced
  (lambda (this method-name method)         ; with virtual
    (let ((index (class/method-position this method-name)))
      (vector-set! (class/get-method-vector this)
                   index
                   method)
      (vector-set! (class/get-method-set?-vector this)
                   index
                   #t)
      (apply-below this
                   (lambda (class)
                     (vector-set! (class/get-method-vector class)
                                  index
                                  method))
                   (lambda (class)
                     (not (vector-ref
                           (class/get-method-set?-vector class)
                           index)))))
    method-name))

(class/set-method! class-class 'method-position
                   class/method-position)

(class/set-method! class-class 'set-method!
                   class/set-method!)

; similarly for other methods, including class/method

(define class/method-position
  (class/method class-class 'method-position))

(define class/set-method!
  (class/method class-class 'set-method!))

; and so forth

(define define-class
  (lambda (class-name superclass instvar-names method-names)
    (eval-globally
     (class-definitions
      class-name superclass instvar-names method-names))))

(symbol-append 'make- 'widget)
;Value: make-widget


(symbol-append 'widget '/ 'activate)
;Value: widget/activate

(define symbol-append
  (lambda symbols
    (string->symbol
      (apply string-append
             (map symbol->string symbols)))))

(define class-predicate-definition
  (lambda (class-name)
    (list 'define (symbol-append class-name '?)
          (list 'class/predicate 
                (symbol-append class-name '-class)))))

(class-predicate-definition 'widget)
;Value: (define widget? (class/predicate widget-class))

;Value: (begin
  (define widget-class ...)
  (define make-widget ...)
  (define widget? ...)
  ...)

;; 14.5  An Application: Adventures in the Imaginary Land of Gack

object
   registry
   named-object
      thing
         scroll
      place
      person
         auto-person
            wizard
            witch
   class

(define-class
  'registry
  object-class
  '(list)
  '(add
    remove
    trigger
    trigger-times))

(class/set-method!
 registry-class 'init
 (lambda (this)
   (object^init this)
   (registry/set-list! this '())))

(class/set-method!
 registry-class 'add
 (lambda (this person)
   (registry/set-list! this
                       (cons person
                             (registry/get-list this)))))

(class/set-method!
 registry-class 'remove
 (lambda (this person)
   (registry/set-list! this
                       (delq person
                             (registry/get-list this)))))

(class/set-method!
 registry-class 'trigger
 (lambda (this)
   (for-each auto-person/maybe-act
             (registry/get-list this))))

(class/set-method!
 registry-class 'trigger-times
 (lambda (this n)
   (if (> n 0)
       (begin (registry/trigger this)
              (registry/trigger-times this (- n 1)))
       'done)))

(define delq
  (lambda (item list)
    (filter (lambda (x)
              (not (eq? x item)))
            list)))

(define-class
  'named-object
  object-class
  '(name)
  '(name
    change-name))

(class/set-method!
 named-object-class 'init
 (lambda (this name)
   (object^init this)
   (named-object/set-name! this name)))

(class/set-method!
 named-object-class 'name
 (lambda (this)
   (named-object/get-name this)))

(class/set-method!
 named-object-class 'change-name
 (lambda (this new-name)
   (named-object/set-name! this new-name)))

(define-class
  'thing
  named-object-class
  '(owner)
  '(owned?
    owner
    become-unowned
    become-owned-by))

(class/set-method!
 thing-class 'init
 (lambda (this name)
   (named-object^init this name)
   (thing/set-owner! this 'no-one)))

(class/set-method!
 thing-class 'owned?
 (lambda (this)
   (not (equal? (thing/owner this)
                'no-one))))

(class/set-method!
 thing-class 'owner
 (lambda (this)
   (thing/get-owner this)))

(class/set-method!
 thing-class 'become-unowned
 (lambda (this)
   (thing/set-owner! this 'no-one)))

(class/set-method!
 thing-class 'become-owned-by
 (lambda (this person)
   (thing/set-owner! this person)))

(define-class
  'scroll
  thing-class
  '()
  '(be-read))

(class/set-method!
 scroll-class 'init
 (lambda (this title)
   (thing^init this title)))

(class/set-method!
 scroll-class 'be-read
 (lambda (this)
   (let ((owner (scroll/owner this))
         (title (scroll/name this)))
     (if (scroll/owned? this)
         (person/say owner
                     (list "I have read" title))
         (display-message (list "No one has" title))))))

(define display-message
  (lambda (list-of-stuff)
    (newline)
    (for-each (lambda (s) (display s) (display " "))
              list-of-stuff)))

(define-class
  'place
  named-object-class
  '(neighbor-map ; pairs: car = direction, cdr = neighbor
    contents)    ; people and things
  '(exits
    neighbors
    neighbor-towards
    add-new-neighbor
    gain
    lose
    contents))

(class/set-method!
 place-class 'init
 (lambda (this name)
   (named-object^init this name)
   (place/set-neighbor-map! this '())
   (place/set-contents! this '())))

(class/set-method!
 place-class 'exits
 (lambda (this)
   (map car (place/get-neighbor-map this))))

(class/set-method!
 place-class 'neighbors
 (lambda (this)
   (map cdr (place/get-neighbor-map this))))

(class/set-method!
 place-class 'neighbor-towards
 (lambda (this direction)
   (let ((p (assq direction
                  (place/get-neighbor-map this))))
      (if (not p)
          #f
          (cdr p)))))

(class/set-method!
 place-class 'add-new-neighbor
 (lambda (this direction new-neighbor)
   (let ((neighbor-map (place/get-neighbor-map this)))
     (if (assq direction neighbor-map)
         (display-message
          (list "there is already a neighbor"
                direction
                "from"
                (place/name this)))
         (place/set-neighbor-map! this
                                  (cons (cons direction 
                                              new-neighbor)
                                        neighbor-map))))))

(class/set-method!
 place-class 'gain
 (lambda (this new-item)
   (let ((contents (place/contents this)))
     (if (memq new-item contents)
         (display-message 
          (list (named-object/name new-item)
                "is already at"
                (place/name this)))
         (place/set-contents! this
                              (cons new-item contents))))))

(class/set-method!
 place-class 'lose
 (lambda (this item)
   (let ((contents (place/contents this)))
     (if (not (memq item contents))
         (display-message 
          (list (named-object/name item)
                "is not at"
                (place/name this)))
         (place/set-contents! this
                              (delq item contents))))))

(class/set-method!
 place-class 'contents
 (lambda (this)
   (place/get-contents this)))

(define-class
  'person 
  named-object-class
  '(place
    possessions)
  '(say
    look-around
    list-possessions
    read
    have-fit
    move-to
    go
    take
    lose
    place
    possessions
    greet
    other-people-at-same-place))

(class/set-method!
 person-class 'init
 (lambda (this name place)
   (named-object^init this name)
   (person/set-place! this place)
   (person/set-possessions! this '())
   (place/gain place this)))

(class/set-method!
 person-class 'say
 (lambda (this list-of-stuff)
   (let ((name (person/name this))
         (place (person/place this)))
     (let ((place-name (place/name place)))
       (display-message
        (append (list "At" place-name ":" name "says --")
                list-of-stuff))))))

(class/set-method!
 person-class 'look-around
 (lambda (this)
   (let ((place (person/place this)))
     (let ((other-items
            (map named-object/name
                 (delq this
                       (place/contents place))))
           (exits (place/exits place)))
       (person/say this
                   (append '("I see")
                           (verbalize-list other-items "nothing")
                           '("and can go")
                           (verbalize-list exits "nowhere")))))))
               
(class/set-method!
 person-class 'list-possessions
 (lambda (this)
   (let ((stuff (map thing/name
                     (person/possessions this))))
     (person/say
      this
      (append '("I have")
              (verbalize-list stuff "nothing"))))))

(class/set-method!
 person-class 'read
 (lambda (this scroll)
   (if (eq? this (scroll/owner scroll))
       (scroll/be-read scroll)
       (display-message
        (list (person/name this)
              "does not have"
              (scroll/name scroll))))))

(class/set-method!
 person-class 'have-fit
 (lambda (this)
   (person/say this '("Yaaaah! I am upset!"))))

(class/set-method!
 person-class 'move-to
 (lambda (this new-place)
   (let ((name (person/name this))
         (old-place (person/place this))
         (possessions (person/possessions this)))
     (display-message
      (list name "moves from" (place/name old-place)
            "to" (place/name new-place)))
     (place/lose old-place this)
     (place/gain new-place this)
     (for-each (lambda (p)
                 (place/lose old-place p)
                 (place/gain new-place p))
               possessions)
     (person/set-place! this new-place)
     (person/greet this
                   (person/other-people-at-same-place this)))))

(class/set-method!
 person-class 'go
 (lambda (this direction)
   (let ((old-place (person/place this)))
     (let ((new-place (place/neighbor-towards
                       old-place
                       direction)))
       (if new-place
           (person/move-to this new-place)
           (display-message
            (list "you cannot go" direction "from"
                  (place/name old-place))))))))

(class/set-method!
 person-class 'take
 (lambda (this thing)
   (if (eq? this (thing/owner thing))
       (display-message
        (list (person/name this) "already has" (thing/name thing)))
       (begin
         (if (thing/owned? thing)
             (let ((owner (thing/owner thing)))
               (person/lose owner thing)
               (person/have-fit owner))
             'unowned)
         (thing/become-owned-by thing this)
         (person/set-possessions!
          this
          (cons thing (person/possessions this)))
         (person/say
          this
          (list "I take" (thing/name thing)))))))

(class/set-method!
 person-class 'lose
 (lambda (this thing)
   (if (not (eq? this (thing/owner thing)))
       (display-message (list (person/name this) "doesn't have"
                              (thing/name thing)))
       (begin
         (thing/become-unowned thing)
         (person/set-possessions!
          this
          (delq thing (person/possessions this)))
         (person/say
          this
          (list "I lose" (thing/name thing)))))))

(class/set-method!
 person-class 'place
 (lambda (this)
   (person/get-place this)))

(class/set-method!
 person-class 'possessions
 (lambda (this)
   (person/get-possessions this)))

(class/set-method!
 person-class 'greet
 (lambda (this people)
   (if (not (null? people))
       (person/say this
                   (cons "Hi"
                         (verbalize-list
                          (map person/name people)
                          "no one")))
       'no-one-to-greet)))

(class/set-method!
 person-class 'other-people-at-same-place
 (lambda (this)
   (delq this
         (filter person?
                 (place/contents (person/place this))))))

(define verbalize-list
  (lambda (items none-word)
    (define loop
      (lambda (items)
        (if (null? (cdr items))
            items
            (cons (car items)
                  (cons "and"
                        (loop (cdr items)))))))
    (if (null? items)
        (list none-word)
        (loop items))))

(define-class
  'auto-person
  person-class
  '(threshold
    restlessness)
  '(maybe-act
    act))

(class/set-method!
 auto-person-class 'init
 (lambda (this name place threshold)
   (person^init this name place)
   (auto-person/set-threshold! this threshold)
   (auto-person/set-restlessness! this 0)
   (registry/add registry this)))

(class/set-method!
 auto-person-class 'maybe-act
 (lambda (this)
   (let ((threshold (auto-person/get-threshold this))
         (restlessness (auto-person/get-restlessness this)))
      (if (< restlessness threshold)
          (auto-person/set-restlessness! this
                                         (+ 1 restlessness))
          (begin (auto-person/act this)
                 (auto-person/set-restlessness! this 0))))))

(class/set-method!
 auto-person-class 'act
 (lambda (this)
   (let ((new-place (random-element
                     (place/neighbors
                      (auto-person/place this)))))
     (if new-place
         (auto-person/move-to this new-place)))))

(define random-element
  (lambda (list)
    (if (null? list)
        #f
        (list-ref list (random (length list))))))

(define-class
  'witch
  auto-person-class
  '()
  '(curse))
(class/set-method!
 witch-class 'act
 (lambda (this)
   (let ((victim (random-element
                  (witch/other-people-at-same-place this))))
     (if victim
         (witch/curse this victim)
         (auto-person^act this)))))

(class/set-method!
 witch-class 'curse
 (lambda (this person)
   (let ((person-name (person/name person)))
     (person/say this
                 (list
                  "Hah hah hah, I'm going to turn you into a frog"
                  person-name))
     (turn-into-frog person)
     (person/say this
                 (list "Hee hee" person-name
                       "looks better in green!")))))

(define turn-into-frog
  (lambda (person)
    (for-each (lambda (item) (person/lose person item))
              (person/possessions person))
    (person/say person '("Ribbitt!"))
    (person/move-to person pond)
    (registry/remove registry person)))

(define-class
  'wizard
  auto-person-class
  '()
  '())

(class/set-method!
 wizard-class 'act
 (lambda (this)
   (let ((place (wizard/place this)))
     (let ((scrolls (filter scroll?
                            (place/contents place))))
       (if (and (not (null? scrolls))
                (not (eq? place chamber-of-wizards)))
           (begin
             (wizard/take this (car scrolls))
             (wizard/move-to this chamber-of-wizards)
             (wizard/lose this (car scrolls)))
           (auto-person^act this))))))

;; The "registry" is an object that keeps track of all
;; the auto-person objects that need to be given an
;; opportunity to act.

(define registry (make-registry))

;; Here we define the places in the imaginary world of Gack

(define food-service (make-place 'food-service))
(define PO (make-place 'PO))
(define alumni-hall (make-place 'alumni-hall))
(define chamber-of-wizards (make-place 'chamber-of-wizards))
(define library (make-place 'library))
(define good-ship-olin (make-place 'good-ship-olin))
(define lounge (make-place 'lounge))
(define computer-lab (make-place 'computer-lab))
(define offices (make-place 'offices))
(define dormitory (make-place 'dormitory))
(define pond (make-place 'pond))

;; One-way paths connect individual places in the world.

(place/add-new-neighbor food-service 'down PO)
(place/add-new-neighbor PO 'south alumni-hall)
(place/add-new-neighbor alumni-hall 'north food-service)
(place/add-new-neighbor alumni-hall 'east chamber-of-wizards)
(place/add-new-neighbor alumni-hall 'west library)
(place/add-new-neighbor chamber-of-wizards 'west alumni-hall)
(place/add-new-neighbor chamber-of-wizards 'south dormitory)
(place/add-new-neighbor dormitory 'north chamber-of-wizards)
(place/add-new-neighbor dormitory 'west good-ship-olin)
(place/add-new-neighbor library 'east alumni-hall)
(place/add-new-neighbor library 'south good-ship-olin)
(place/add-new-neighbor good-ship-olin 'north library)
(place/add-new-neighbor good-ship-olin 'east dormitory)
(place/add-new-neighbor good-ship-olin 'up lounge)
(place/add-new-neighbor lounge 'west computer-lab)
(place/add-new-neighbor lounge 'south offices)
(place/add-new-neighbor computer-lab 'east lounge)
(place/add-new-neighbor offices 'north lounge)

;; We define persons as follows:

;; We've chosen to define max-the-person rather than
;; redefining max, which is predefined in Scheme to
;; be a procedure for finding the largest of its numeric
;; arguments.
(define max-the-person
  (make-auto-person 'max offices 2))

(define karl
  (make-auto-person 'karl computer-lab 4))

(define barbara
  (make-witch 'barbara offices 3))

(define elvee
  (make-wizard 'elvee chamber-of-wizards 1))

(define player
  (make-person 'player dormitory))

;; and now we'll strew some scrolls around:

(define scroll-of-enlightenment
  (make-scroll 'scroll-of-enlightenment))
(place/gain library scroll-of-enlightenment)

(for-each (lambda (title)
            (place/gain library
                        (make-scroll title)))
          '(crime-and-punishment war-and-peace
                                 iliad
                                 collected-works-of-rilke))

(define unix-programmers-manual
  (make-scroll 'unix-programmers-manual))
(place/gain computer-lab unix-programmers-manual)

(define next-users-reference
  (make-scroll 'next-users-reference))
(place/gain computer-lab next-users-reference)

(define difficulty 1)

(define play
  (lambda ()
    (define loop
      (lambda ()
        (newline)
        (let ((user-input (read)))
          (if (equal? user-input '(quit))
              'done
              (begin
                (respond-to-using user-input gack-p/a-list)
                (loop))))))
    (newline)
    (display "Enter your name, using one word only, please.")
    (newline)
    (person/change-name player (read))
    (display-message
     (list "OK," (person/name player)
           "enter your commands one by one"
           "as scheme lists; to get help enter (help)."))
    (loop)))

(define gack-p/a-list
  (list (make-pattern/action '(help)
                             (lambda ()
                               (newline)
                               (display "Possibilities:")
                               (newline)
                               (for-each (lambda (command)
                                           (display " ")
                                           (display command)
                                           (newline))
                                         '((help)
                                           (quit)
                                           (drop thing)
                                           (lose thing)
                                           (take thing)
                                           (go direction)
                                           (read scroll)
                                           (inventory)
                                           (list possessions)
                                           (look)
                                           (look around)
                                           (say ...)))
                               (newline)))
        (make-pattern/action (list '(drop lose) thing?)
                             (lambda (verb thing)
                               (person/lose player thing)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action (list 'take thing?)
                             (lambda (thing)
                               (person/take player thing)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action '(go _)
                             (lambda (direction)
                               (person/go player direction)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action (list 'read scroll?)
                             (lambda (scroll)
                               (person/read player scroll)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action '(inventory)
                             (lambda ()
                               (person/list-possessions player)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action '(list possessions)
                             (lambda ()
                               (person/list-possessions player)
                               (registry/trigger-times
                                registry difficulty)))
        (make-pattern/action '(look)
                             (lambda ()
                               (person/look-around player)))
        (make-pattern/action '(look around)
                             (lambda ()
                               (person/look-around player)))
        (make-pattern/action '(say ...)
                             (lambda (stuff)
                               (person/say player stuff)
                               (registry/trigger-times
                                registry difficulty)))))

(define respond-to-using
  (lambda (command p/a-list)
    (cond ((null? p/a-list)
           (display-message '("I don't understand.")))
          ((matches? (pattern (car p/a-list)) command)
           (apply (action (car p/a-list))
                  (substitutions-in-to-match
                   (pattern (car p/a-list))
                   command)))
          (else (respond-to-using command (cdr p/a-list))))))

;; The versions of matches? and substitutions-in-to-match
;; given below not only are after doing various chapter 7
;; exercises, but moreover have an additional feature that a
;; predicate can be used as one of the components of a pattern,
;; in which case it means that at that position in the command,
;; a symbol is needed that is the name of an item in the player's
;; place that satisfies the predicate.

(define matches? 
  (lambda (pattern question)
    (cond ((null? pattern)  (null? question))
          ((not (pair? question)) #f)
          ((equal? (car pattern) '_)
           (matches? (cdr pattern) (cdr question)))
          ((list? (car pattern))
           (if (member (car question) (car pattern))
               (matches? (cdr pattern)
                         (cdr question))
               #f))
          ((equal? (car pattern) '...) #t)
          ((equal? (car pattern) (car question))
           (matches? (cdr pattern)
                     (cdr question)))
          ((procedure? (car pattern))
           (let ((object (object-with-name (car question))))
             (if (and object
                      ((car pattern) object))
                 (matches? (cdr pattern)
                           (cdr question))
                 #f)))
          (else #f))))

(define substitutions-in-to-match
  (lambda (pattern question)
    (cond ((null? pattern)
           (if (null? question)
               '()
               (error 
                "substitutions-in-to-match without a match")))
          ((not (pair? question))
           (error "substitutions-in-to-match without a match"))
          ((equal? (car pattern) '_)
           (cons (car question)
                 (substitutions-in-to-match (cdr pattern)
                                            (cdr question))))
          ((list? (car pattern))
           (if (member (car question) (car pattern))
               (cons (car question)
                     (substitutions-in-to-match (cdr pattern)
                                                (cdr question)))
               (error
                "substitutions-in-to-match without a match")))
          ((equal? (car pattern) '...) (list question))
          ((equal? (car pattern) (car question))
           (substitutions-in-to-match (cdr pattern)
                                      (cdr question)))
          ((procedure? (car pattern))
           (let ((object (object-with-name (car question))))
             (if (and object
                      ((car pattern) object))
                 (cons object
                       (substitutions-in-to-match 
                        (cdr pattern) (cdr question)))
                 (error
                  "substitutions-in-to-match without a match"))))
          (else (error 
                 "substitutions-in-to-match without a match")))))

(define object-with-name
  (lambda (name)
    (let ((objects (filter (lambda (obj)
                             (equal? (named-object/name obj)
                                     name))
                           (place/contents 
                            (person/place player)))))
      (if (or (null? objects)
              (not (null? (cdr objects))))
          #f
          (car objects)))))

;; Review Problems

(person/introduce-self barbara)

(person/introduce-self max-the-person)

(person/introduce-self elvee)

Hello, I'm barbara.
I'm known to be fond of chocolate and turning people into frogs.
Pleased to meet you.

Hello, I'm max.
Pleased to meet you.

Hello, I'm elvee.
I've got this problem with scrolls.
Pleased to meet you.

(set-method!
 person-class 'introduce-self
 (lambda (self)
  (let ((name (person/get-name self)))
   (person/say self (list "Hello, I'm" name "."))
   (person/describe-self self)
   (person/say self (list "Pleased to meet you.")))))

(set-method!
 person-class 'describe-self
 (lambda (self)
  'described-self))

(set-method!
 witch-class 'describe-self
 (lambda (self)
  (person/say
  self
  (list "I'm known to be fond of chocolates and turning people to frogs."))))

(instance-of? barbara witch-class)
;Value: #t

(instance-of? barbara person-class)
;Value: #t

(instance-of? barbara place-class)
;Value: #f

(instance-of? lounge place-class)
;Value: #t
