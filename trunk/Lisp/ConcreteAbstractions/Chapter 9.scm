;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html
;;
;; Revision 1.3 as of 2005/12/20 14:09:36

;; Note that for the application section, system-specific versions of
;; the show procedure are also available from the Concrete
;; Abstractions supporting materials web site -- look in the section
;; of "Information on using various Scheme implementations with the
;; text".

;; Chapter 9: Generic Operations

;; 9.1  Introduction

;; 9.2  Multiple Representations

(head sequence)
  ; returns the first element of sequence, provided sequence is
  ; nonempty

(tail sequence)
  ; returns all but the first element of sequence as a
  ; sequence, provided sequence is nonempty

(empty-sequence? sequence)
  ; returns true if and only if sequence is empty

(sequence-length sequence)
  ; returns the length of sequence

(define sequence-from-to
  (lambda (low high)
    (lambda (op)
      (cond ((equal? op 'empty-sequence?)
             (> low high))
            ((equal? op 'head)
             low)
            ((equal? op 'tail)
             (sequence-from-to (+ low 1)  high))
            ((equal? op 'sequence-length)
             (if (> low high) 0 (+ (- high low) 1)))
            (else (error "illegal sequence operation" op))))))

(define seq-1 (sequence-from-to 3 100))

(seq-1 'head)
;Value: 3

(seq-1 'sequence-length)
;Value: 98

(seq-1 'tail)
;Value: #<procedure>

((seq-1 'tail) 'head)
;Value: 4

(define head
  (lambda (sequence) 
    (sequence 'head)))

(define tail
  (lambda (sequence)
    (sequence 'tail)))

(define empty-sequence?
  (lambda (sequence)
    (sequence 'empty-sequence?)))

(define sequence-length
  (lambda (sequence)
    (sequence 'sequence-length)))

(head seq-1)
;Value: 3

(sequence-length seq-1)
;Value: 98

(head (tail seq-1))
;Value: 4

(define list->sequence
  (lambda (lst)
    (lambda (op)
      (cond ((equal? op 'empty-sequence?)
             (null? lst))
            ((equal? op 'head)
             (car lst))
            ((equal? op 'tail)
             (list->sequence (cdr lst)))
            ((equal? op 'sequence-length)
             (length lst))
            (else (error "illegal sequence operation" op))))))

(define seq-2 (sequence-with-from-by 6 5 -1))

(define seq-3 (list->sequence '(4 3 7 9)))

(head seq-2)
;Value: 5

(head seq-3)
;Value: 4

(define sequence-from-to
  (lambda (low high)
    (lambda (op)
      (cond ((equal? op 'empty-sequence?)
             (> low high))
            ((equal? op 'head)
             low)
            ((equal? op 'tail)
             (sequence-from-to (+ low 1)  high))
            ((equal? op 'sequence-length)
             (if (> low high) 0 (+ (- high low) 1)))
            ((equal? op 'sequence-ref)
             (lambda (n)
               (if (and (<= 0 n) (<= n (- high low)))
                   (+ low n)
                   (error "sequence-from-to: index out of range"
                          n))))
            (else (error "illegal sequence operation" op))))))

(define sequence-ref
  (lambda (sequence n)
    ((sequence 'sequence-ref) n)))

(define sequence-cons
  (lambda (head tail)
    (let ((new-length (+ 1 (sequence-length tail))))
      (lambda (op)
        (cond ((equal? op 'empty-sequence?)
               #f)
              ((equal? op 'head)
               head)
              ((equal? op 'tail)
               tail)
              ((equal? op 'sequence-length)
               new-length)
              ((equal? op 'sequence-ref)
               (lambda (n)
                 (if (= n 0)
                     head
                     (sequence-ref tail (- n 1)))))
              (else (error "illegal sequence operation" op)))))))

(define sequence-append
  (lambda (seq-1 seq-2)
    (cond ((empty-sequence? seq-1) seq-2)
          ((empty-sequence? seq-2) seq-1)
          (else
           (let ((seq-1-length (sequence-length seq-1))
                 (seq-2-length (sequence-length seq-2)))
             (lambda (op)
               (cond ((equal? op 'empty-sequence?)
                      #f)
                     ((equal? op 'head)
                      (head seq-1))
                     ((equal? op 'tail)
                      (sequence-append (tail seq-1) seq-2))
                     ((equal? op 'sequence-length)
                      (+ seq-1-length seq-2-length))
                     ((equal? op 'sequence-ref)
                      (lambda (n)
                        (cond ((< n seq-1-length)
                               (sequence-ref seq-1 n))
                              (else
                               (sequence-ref seq-2
                                             (- n seq-1-length))))))
                     (else (error "illegal sequence operation"
                                  op)))))))))

;; 9.3  Exploiting Commonality

(define tagged-datum 
  (lambda (type value)
    (cons type value)))

(define type car)

(define contents cdr)

(define tagged-movies
  (list->tagged-list movies 'movie))

(define database
  (append (list->tagged-list movies 'movie)
          (list->tagged-list books  'book)
          (list->tagged-list cds    'cd)))

(define movie?
  (lambda (x)
    (equal? (type x) 'movie)))

(define title
  (lambda (x)
    (cond ((movie? x) (movie-title (contents x)))
          ((book? x)  (book-title (contents x)))
          ((cd? x)    (cd-title (contents x)))
          (else (error "unknown object in title"  x)))))

(define actors
  (lambda (x)
    (cond ((movie? x) (movie-actors (contents x)))
          (else (error "Cannot find the actors of the given type"
                       (type x))))))

(what films was randy quaid in)

(define make-type 
  (lambda (name operation-table)
    (cons name operation-table)))

(define type-name car)

(define type-operation-table cdr)

(define movie
  (make-type 'movie
             (make-table
              '(title year-made director actors creator display-item)
              (list movie-title movie-year-made movie-director
                    movie-actors movie-director display-movie))))

(define database
  (append (list->tagged-list movies movie)
          (list->tagged-list books  book)
          (list->tagged-list cds    cd)))

(define title
  (lambda (tagged-datum)
    (operate 'title tagged-datum)))

(define operate
  (lambda (operation-name value)
    (table-find (type-operation-table (type value))
                operation-name
                (lambda (procedure) ; use this if found
                  (procedure (contents value)))
                (lambda ()          ; use this if not found
                  (error "No way of doing operation on type" 
                         operation-name
                         (type-name (type value)))))))

(define make-table
  (lambda (keys values)
    (cons keys values)))

(define table-find
  (lambda (table key what-if-found what-if-not) 
    (define loop
      (lambda (keys values)
        (cond ((null? keys) (what-if-not))
              ((equal? key (car keys))
               (what-if-found (car values)))
              (else
               (loop (cdr keys) (cdr values))))))
    (loop (car table) (cdr table))))

;; 9.4  An Application: Computer Graphics

(define make-point cons)

(define x-coord car)

(define y-coord cdr)

;; Interface to image operations

(define width
  (lambda (image)
    (image 'width)))

(define height
  (lambda (image)
    (image 'height)))

(define draw-on
  (lambda (image medium)
    ((image 'draw-on) medium)))

;; Interface to drawing medium operations

(define draw-line-on
  (lambda (point0 point1 medium)
    ((medium 'draw-line) point0 point1)))

(define draw-filled-triangle-on
  (lambda (point0 point1 point2 medium)
    ((medium 'draw-filled-triangle) point0 point1 point2)))

(define basic-image-size 100)

(define transform-point ; from -1 to 1 into 0 to basic-image-size
  (lambda (point)
    (define transform-coord
      (lambda (coord)
        (* (/ (+ coord 1) 2)  ; fraction of the way to top or right
           basic-image-size)))
    (make-point (transform-coord (x-coord point))
                (transform-coord (y-coord point)))))

(define make-line
  (lambda (point0 point1)
    (lambda (op)
      (cond
       ((equal? op 'width) basic-image-size)
       ((equal? op 'height) basic-image-size)
       ((equal? op 'draw-on)
        (lambda (medium)
          (draw-line-on (transform-point point0)
                        (transform-point point1)
                        medium)))
       (else (error "unknown operation on line" op))))))

(show (make-line (make-point 0 0) (make-point 1 1)))

(define make-overlaid-image
  (lambda (image1 image2)
    (if (not (and (= (width image1) (width image2))
                  (= (height image1) (height image2))))
        (error "can't overlay images of different sizes")
        (lambda (op)
          (cond ((equal? op 'width) (width image1))
                ((equal? op 'height) (height image1))
                ((equal? op 'draw-on)
                 (lambda (medium)
                   (draw-on image1 medium)
                   (draw-on image2 medium)))
                (else
                 (error "unknown operation on overlaid image"
                        op)))))))

(define c-curve
  (lambda (x0 y0 x1 y1 level)
    (if (= level 0)
        (make-line (make-point x0 y0) (make-point x1 y1))
        (let ((xmid (/ (+ x0 x1) 2))
              (ymid (/ (+ y0 y1) 2))
              (dx (- x1 x0))
              (dy (- y1 y0)))
          (let ((xa (- xmid (/ dy 2)))
                (ya (+ ymid (/ dx 2))))
            (make-overlaid-image
             (c-curve x0 y0 xa ya (- level 1))
             (c-curve xa ya x1 y1 (- level 1))))))))

(define make-transformed-medium
  (lambda (transform base-medium)
    (lambda (op)
      (cond
       ((equal? op 'draw-line)
        (lambda (point0 point1)
          (draw-line-on (transform point0) (transform point1)
                        base-medium)))
       ((equal? op 'draw-filled-triangle)
        (lambda (point0 point1 point2)
          (draw-filled-triangle-on (transform point0)
                                   (transform point1)
                                   (transform point2)
                                   base-medium)))
       (else
        (error "unknown operation on transformed medium"
               op))))))

(define make-turned-image  ; quarter turn to the right
  (lambda (base-image)
    (define turn-point
      (lambda (point)
        ;; y becomes x, and the old width minus x becomes y
        (make-point (y-coord point)
                    (- (width base-image) (x-coord point)))))
    (lambda (op)
      (cond
       ((equal? op 'width) (height base-image))
       ((equal? op 'height) (width base-image))
       ((equal? op 'draw-on)
        (lambda (medium)
          (draw-on base-image
                   (make-transformed-medium turn-point medium))))
       (else (error "unknown operation on turned image" op))))))

(define test-bb
  (make-filled-triangle (make-point 0 1)
                        (make-point 0 -1)
                        (make-point 1 -1)))

(define nova-bb
  (make-overlaid-image
   (make-filled-triangle (make-point 0 1)
                         (make-point 0 0)
                         (make-point -1/2 0))
   (make-filled-triangle (make-point 0 0)
                         (make-point 0 1/2)
                         (make-point 1 0))))

(define pinwheel
  (lambda (image)
    (let ((turned (make-turned-image image)))
      (let ((half (make-turned-image (make-stacked-image turned
                                                         image))))
        (make-stacked-image half
                            (make-turned-image
                             (make-turned-image half)))))))

0 0 moveto 100 100 lineto stroke

0 0 moveto 100 0 lineto 50 100 lineto closepath fill

(with-output-to-file "foo"
  (lambda ()
    (display "hello, world")
    (newline)))

(define image->eps
  (lambda (image filename)
    (with-output-to-file filename
      (lambda ()
        (display "%!PS-Adobe-3.0 EPSF-3.0")
        (newline)
        (display "%%BoundingBox: 0 0 ")
        ;; We need to make sure the bounding box is expressed
        ;; using only exact integers, as required by PostScript.
        ;; Therefore we process the width and height of the
        ;; image using round and then inexact->exact. The
        ;; round procedure would convert 10.8 into the inexact
        ;; integer 11., which the inexact->exact then converts
        ;; to the exact integer 11
        (display (inexact->exact (round (width image))))
        (display " ")
        (display (inexact->exact (round (height image))))
        (newline)
        ;; Now do the drawing
        (draw-on image eps-medium)))))

(define eps-medium
  (lambda (op)
    (cond ((equal? op 'draw-line)
           (lambda (point0 point1)
             (display-eps-point point0)
             (display "moveto")
             (display-eps-point point1)
             (display "lineto stroke")
             (newline)))
          ((equal? op 'draw-filled-triangle)
           (lambda (point0 point1 point2)
             (display-eps-point point0)
             (display "moveto")
             (display-eps-point point1)
             (display "lineto")
             (display-eps-point point2)
             (display "lineto closepath fill")
             (newline)))
          (else
           (error "unknown operation on EPS medium"
                  op)))))

(define display-eps-point
  (lambda (point)
    (define display-coord
      (lambda (coord)
        (if (integer? coord)
            (display coord)
            (display (exact->inexact coord)))))
    (display " ")
    (display-coord (x-coord point))
    (display " ")
    (display-coord (y-coord point))
    (display " ")))
