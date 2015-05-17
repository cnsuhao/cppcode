;; This file contains excerpts from the textbook Concrete
;; Abstractions: An Introduction to Computer Science Using Scheme, by
;; Max Hailperin, Barbara Kaiser, and Karl Knight, Copyright (c) 1998
;; by the authors. Full text is available for free at
;; http://www.gustavus.edu/+max/concrete-abstractions.html
;;
;; Revision 1.3 as of 2005/12/20 14:09:36

;; Chapter 7: Lists

;; 7.1  The Definition of a List

;; 7.2  Constructing Lists

(list 1 2 3)
;Value: (1 2 3)

(cdr '(1 2 3))
;Value: (2 3)

(cons 1 '())
;Value: (1)

(cons 1 (cons 2 '()))
;Value: (1 2)

(cons 1 (cons 2 (cons 3 '())))
;Value: (1 2 3)

(define integers-from-to
  (lambda (low high)
    (if (> low high)
        '()
        (cons low  
              (integers-from-to (+ 1 low) high)))))

(integers-from-to 1 7)
;Value: (1 2 3 4 5 6 7)

(define integers-from-to  ; faulty version
  (lambda (low high)
    (define iter
      (lambda (low lst)
        (if (> low high)
            lst
            (iter (+ 1 low)
                  (cons low lst)))))
    (iter low '())))

;; 7.3  Basic List Processing Techniques

(define length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (length (cdr lst))))))

(define sum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (sum (cdr lst))))))

(position 50 '(10 20 30 40 50 3 2 1))
;Value: 4

(list-< '(1 2 3 4) '(2 3 4 5))
;Value: #t

(define list-<
  (lambda (l1 l2)
    (lists-compare? < l1 l2)))

(define filter
  (lambda (ok? lst)
    (cond ((null? lst)
           '())
          ((ok? (car lst))
           (cons (car lst) (filter ok? (cdr lst))))
          (else
           (filter ok? (cdr lst))))))

(filter odd? (integers-from-to 1 15))
;Value: (1 3 5 7 9 11 13 15)

(define first-elements-of
  (lambda (n list)
    (if (= n 0)
        '()
        (cons (car list) 
              (first-elements-of (- n 1)
                                 (cdr list))))))

(define interleave    ; interleaves lst1 and lst2, starting with
  (lambda (lst1 lst2) ; the first element of lst1 (if any)
    (if (null? lst1)
        lst2
        (cons (car lst1)
              (interleave lst2 (cdr lst1))))))

(define shuffle
  (lambda (deck size)
    (let ((half (quotient (+ size 1) 2)))
      (interleave (first-elements-of half deck)
                  (list-tail deck half)))))

(define multiple-shuffle
  (lambda (deck size times)
    (if (= times 0)
        deck
        (multiple-shuffle (shuffle deck size)
                          size (- times 1)))))

(multiple-shuffle (integers-from-to 1 52) 52 1)
;Value: (1 27 2 28 3 29 4 30 5 31 6 32 7 33 8 34 9 35 10 36 11 37 12 38 13 39 14 40 15 41 16 42 17 43 18 44 19 45 20 46 21 47 22 48 23 49 24 50 25 51 26 52)

(multiple-shuffle (integers-from-to 1 52) 52 2)
;Value: (1 14 27 40 2 15 28 41 3 16 29 42 4 17 30 43 5 18 31 44 6 19 32 45 7 20 33 46 8 21 34 47 9 22 35 48 10 23 36 49 11 24 37 50 12 25 38 51 13 26 39 52)

(multiple-shuffle (integers-from-to 1 52) 52 8)
;Value: (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52)

(map shuffle-number (integers-from-to 1 100))

(map (lambda (x) (* x x)) '(5 12 13))
;Value: (25 144 169)

(sevens 5)
;Value: (7 7 7 7 7)

(list-of-lists '(1 5 3))
;Value: ((1) (1 2 3 4 5) (1 2 3))

;; 7.4  List Processing and Iteration

(define add-to-end
  (lambda (lst elt)
    (if (null? lst)    ; adding to an empty list
        (cons elt '()) ;  makes a one-element list
        (cons (car lst)
              (add-to-end (cdr lst)
                          elt)))))

(define reverse 
  (lambda (lst)  
    (if (null? lst) 
        '() 
        (add-to-end (reverse (cdr lst)) 
                    (car lst)))))

(define reverse
  (lambda (lst)
    (define reverse-onto   ; return a list of the elements of lst1
      (lambda (lst1 lst2)  ;  in reverse order followed by the
                           ;  elements of lst2
        (if (null? lst1)   
            lst2
            (reverse-onto (cdr lst1)
                          (cons (car lst1)
                                lst2)))))
    (reverse-onto lst '())))

(define palindrome?
  (lambda (lst)
    (equal? lst (reverse lst))))

(palindrome? '(m a d a m i m a d a m))
;Value: #t

;; 7.5  Tree Recursion and Lists

(define merge-sort
  (lambda (lst)
    (cond ((null? lst)
           '())
          ((null? (cdr lst))
           lst)
          (else
           (merge (merge-sort (one-part lst))
                  (merge-sort (the-other-part lst)))))))

(define merge
  (lambda (lst1 lst2)
    (cond ((null? lst1) lst2)
          ((null? lst2) lst1)
          ((< (car lst1) (car lst2))
           (cons (car lst1) (merge (cdr lst1) lst2)))
          ((= (car lst1) (car lst2))
           (cons (car lst1) (merge (cdr lst1) (cdr lst2))))
          (else
           (cons (car lst2) (merge  lst1 (cdr lst2)))))))

(define odd-part
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (car lst) (even-part (cdr lst))))))

(define even-part
  (lambda (lst)
    (if (null? lst)
        '()
        (odd-part (cdr lst)))))

(define one-part odd-part)
(define the-other-part even-part)

(define count-combos 
  (lambda (prize-list amount)
    .
    .
    .
    (+ (count-combos prize-list (- amount (car prize-list)))
       (count-combos (cdr prize-list) amount))))

;; 7.6  An Application: A Movie Query System

(define make-movie
  (lambda (title director year-made actors)
    (list title director year-made actors)))

(define movie-title car)
(define movie-director cadr)
(define movie-year-made caddr)
(define movie-actors cadddr)

(define our-movie-database   ;; longer version than in the text
  (list (make-movie '(amarcord)
                    '(federico fellini)
                    1974
                    '((magali noel) (bruno zanin)
                                    (pupella maggio)
                                    (armando drancia)))
        (make-movie '(the big easy)
                    '(jim mcbride)
                    1987
                    '((dennis quaid) (ellen barkin)
                                     (ned beatty)
                                     (lisa jane persky)
                                     (john goodman)
                                     (charles ludlam)))
        (make-movie '(boyz n the hood)
                    '(john singleton)
                    1991
                    '((cuba gooding jr.) (ice cube)
                                         (larry fishburne)
                                         (tyra ferrell)
                                         (morris chestnut)))
        (make-movie '(dead again)
                    '(kenneth branagh)
                    1991
                    '((kenneth branagh) (emma thompson)
                                        (andy garcia)
                                        (derek jacobi)
                                        (hanna schygulla)))
        (make-movie '(the godfather)
                    '(francis ford coppola)
                    1972
                    '((marlon brando) (al pacino)
                                      (james caan)
                                      (robert duvall)
                                      (diane keaton)))
        (make-movie '(an american in paris)
                    '(vincente minnelli)
                    1952
                    '((gene kelley) (leslie caron)
                                    (oscar levant)
                                    (nina foch)
                                    (george guetary)))
        (make-movie '(casablanca)
                    '(michael curtiz)
                    1942
                    '((humphrey bogart) (ingrid bergman)
                                        (paul henreid)
                                        (claude rains)
                                        (sydney greenstreet)
                                        (peter lorre)
                                        (s z sakall)
                                        (conrad veidt)
                                        (dooley wilson)))
        (make-movie '(citizen kane)
                    '(orson welles)
                    1941
                    '((orson welles) (joseph cotten)
                                     (dorothy comingore)
                                     (ray collins)
                                     (george coulouris)
                                     (agnes moorehead)
                                     (ruth warrick)))
        (make-movie '(gone with the wind)
                    '(victor fleming)
                    1939
                    '((clark gable) (vivien leigh)
                                    (leslie howard)
                                    (olivia de havilland)
                                    (hattie mcdaniel)
                                    (butterfly mcqueen)))
        (make-movie '(lawrence of arabia)
                    '(david lean)
                    1962
                    '((peter otoole) (alec guinness)
                                     (anthony quinn)
                                     (jack hawkins)
                                     (jose ferrer)
                                     (omar sharif)
                                     (anthony quayle)
                                     (claude rains)
                                     (arthur kennedy)
                                     (donald wolfit)))
        (make-movie '(the manchurian candidate)
                    '(john frankenheimer)
                    1962
                    '((frank sinatra) (laurence harvey)
                                      (janet leigh)
                                      (angela lansbury)
                                      (henry silva)
                                      (james gregory)
                                      (leslie parrish)
                                      (john mcgiver)
                                      (khigh dhiegh)
                                      (james edwards)))
        (make-movie '(metropolis)
                    '(fritz lang)
                    1926
                    '((alfred abel) (gustay frohlich)
                                    (brigitte helm)
                                    (rudolf kleinrogge)
                                    (heinrich george)))
        (make-movie '(othello)
                    '(orson welles)
                    1952
                    '((orson welles) (michael mac liammoir)
                                     (robert coote)
                                     (suzanne cloutier)
                                     (faye compton)
                                     (doris dowling)
                                     (michael laurence)))
        (make-movie '(spartacus)
                    '(stanley kubrick)
                    1960
                    '((kirk douglas) (laurence olivier)
                                     (jean simmons)
                                     (charles laughton)
                                     (peter ustinov)
                                     (john gavin)
                                     (tony curtis)
                                     (woody strode)))
        (make-movie '(a star is born)
                    '(george cuckor)
                    1954
                    '((judy garland) (james mason)
                                     (jack carson)
                                     (tommy noonan)
                                     (charles bickford)))
        (make-movie '(after the rehearsal)
                    '(ingmar bergman)
                    1984
                    '((erland josephson) (ingrid thulin)
                                         (lena olin)
                                         (nadja palmstjerna-weiss)))
        (make-movie '(amadeus)
                    '(milos forman)
                    1984
                    '((f murray abraham) (tom hulce)
                                         (elizabeth berridge)
                                         (simon callow)
                                         (roy dotrice)
                                         (christine ebersole)
                                         (jeffrey jones)))
        (make-movie '(blood simple)
                    '(joel coen)
                    1985
                    '((john getz) (frances mcdormand)
                                  (dan hedaya)
                                  (m emmet walsh)
                                  (samm-art williams)))
        (make-movie '(chinatown)
                    '(roman polanski)
                    1974
                    '((jack nicholson) (faye dunaway)
                                       (john huston)
                                       (perry lopez)
                                       (john hillerman)
                                       (darrell zwerling)
                                       (diane ladd)
                                       (roman polanski)))
        (make-movie '(the cotton club)
                    '(francis ford coppola)
                    1984
                    '((richard gere) (gregory hines)
                                     (diane lane)
                                     (lonette mckee)
                                     (bob hoskins)
                                     (james remar)
                                     (fred gwynne)))
        (make-movie '(the crying game)
                    '(neil jordan)
                    1992
                    '((stephen rea) (jaye davidson)
                                    (forest whitaker)
                                    (miranda richardson)
                                    (adrian dunbar)
                                    (breffini mckenna)
                                    (joe savino)))
        (make-movie '(the day of the jackal)
                    '(fred zinnemann)
                    1973
                    '((edward fox) (terence alexander)
                                   (michel auclair)
                                   (alan badel)
                                   (tony britton)
                                   (denis carey)
                                   (olga georges-picot)
                                   (cyril cusack)))
        (make-movie '(diva)
                    '(jean-jacques beineix)
                    1981
                    '((wilhelmenia wiggins fernandez)
                      (frederic andrei)
                      (richard bohringer)
                      (thay an luu)
                      (jacques fabbri)
                      (chantal deruaz)))
        (make-movie '(the dresser)
                    '(peter yates)
                    1984
                    '((albert finney) (tom courtenay)
                                      (edward fox)
                                      (zena walker)))
        (make-movie '(el norte)
                    '(gregory nava)
                    1983
                    '((zaide silvia gutierrez) (david villalpando)
                                               (ernesto gomez cruz)
                                               (alicia del lago)
                                               (trinidad silva)))
        (make-movie '(the exorcist)
                    '(william friedkin)
                    1973
                    '((ellen burstyn) (linda blair)
                                      (jason miller)
                                      (max von sydow)
                                      (kitty winn)
                                      (lee j cobb)))
        (make-movie '(a fish called wanda)
                    '(michael chrichton)
                    1988
                    '((john cleese) (jamie lee curtis)
                                    (kevin kline)
                                    (michael palin)
                                    (maria aitken)
                                    (tom georgeson)
                                    (patricia hayes)))
        (make-movie '(flirting)
                    '(john duigan)
                    1992
                    '((noah taylor) (thandie newton)
                                    (nicole kidman)
                                    (bartholomew rose)
                                    (felix nobis)
                                    (josh picker)
                                    (kiri paramore)))
        (make-movie '(gates of heaven)
                    '(errol morris)
                    1978
                    '())
        (make-movie '(house of games)
                    '(david mamet)
                    1987
                    '((lindsay crouse) (joe mantegna)
                                       (mike nussman)
                                       (lilia skala)
                                       (j t walsh)
                                       (jack wallace)))
        (make-movie '(iceman)
                    '(fred schepisi)
                    1984
                    '((timothy hutton) (john lone)
                                       (lindsay crouse)))
        (make-movie '(jaws)
                    '(steven spielberg)
                    1975
                    '((roy scheider) (robert shaw)
                                     (richard dreyfuss)
                                     (lorraine gary)
                                     (murray hamilton)))
        (make-movie '(johnny got his gun)
                    '(dalton trumbo)
                    1971
                    '((timothy bottoms) (kathy fields)
                                        (jason robards)
                                        (diane varsi)
                                        (donald sutherland)
                                        (eduard franz)))
        (make-movie '(local hero)
                    '(bill forsyth)
                    1983
                    '((burt lancaster) (peter reigert)
                                       (peter capaldi)
                                       (fulton mckay)
                                       (denis lawson)))
        (make-movie '(malcolm x)
                    '(spike lee)
                    1992
                    '((denzel washington) (angela basset)
                                          (albert hall)
                                          (al freeman jr)
                                          (delroy lindo)
                                          (spike lee)))))

(filter (lambda (movie) (= (movie-year-made movie) 1974))
        our-movie-database)

(titles-of-movies-satisfying our-movie-database 
                             (lambda (movie)
                               (= (movie-year-made movie)
                                  1974)))

(movies-satisfying our-movie-database 
                   (lambda (movie)
                     (= (movie-year-made movie) 1974))
                   movie-title)

(query-loop)

(who was the director of amarcord)
(federico fellini)

(who were the actors in the big easy)
((dennis quaid)
 (ellen barkin)
 (ned beatty)
 (lisa jane persky)
 (john goodman)
 (charles ludlam))

(what movies were made in 1991)
((boyz n the hood) (dead again))

(what movies were made between 1985 and 1990)
((the big easy))

(what movies were made in 1921)
(i do not know)

(why is the sky blue)
(i do not understand)

(so long)
(see you later)

(define query-loop
  (lambda ()
    (newline)
    (newline)
    (let ((query (read)))
      (cond ((exit? query) (display '(see you later)))
            ;; movie-p/a-list is the list of the
            ;;  pattern/action pairs
            (else (answer-by-pattern query movie-p/a-list)
                  (query-loop))))))

(define exit?
  (lambda (query)
    (member query '((bye)
                    (quit)
                    (exit)
                    (so long)
                    (farewell)))))

(define answer-by-pattern
  (lambda (query p/a-list)
    (cond ((null? p/a-list)
           (display '(i do not understand)))
          ((matches? (pattern (car p/a-list)) query)
           (let ((subs (substitutions-in-to-match
                        (pattern (car p/a-list))
                        query)))
             (let ((result (apply (action (car p/a-list))
                                  subs)))
               (if (null? result)
                   (display '(i do not know))
                   (display result)))))
          (else
           (answer-by-pattern query
                              (cdr p/a-list))))))

(apply + '(1 4))
;Value: 5

(apply * '(2 3))
;Value: 6

(apply (lambda (x) (* x x)) '(3))
;Value: 9

(apply movies-satisfying 
       (list our-movie-database 
             (lambda (movie) (= (movie-year-made movie) 1974))
             movie-title))
;Value: ((amarcord))

(apply (action (car p/a-list))
       subs)

(who is the director of amarcord)
(who is the director of the big easy)
(who is the director of boyz n the hood)

(who is the director of ...)

(lambda (title)
  (movies-satisfying our-movie-database
                     (lambda (movie)
                       (equal? (movie-title movie) title))
                     movie-director))

(define make-pattern/action
  (lambda (pattern action)
    (cons pattern action)))

(define pattern car)
(define action cdr)

(define movie-p/a-list
  (list (make-pattern/action
         '(who is the director of ...)
         (lambda (title)
           (movies-satisfying 
            our-movie-database
            (lambda (movie) (equal? (movie-title movie) title))
            movie-director)))))

(define matches?
  (lambda (pattern question)
    (cond ((null? pattern)  (null? question))
          ((null? question) #f)
          ((equal? (car pattern) '...) #t)
          ((equal? (car pattern) (car question))
           (matches? (cdr pattern)
                     (cdr question)))
          (else #f))))

(substitutions-in-to-match '(foo ...)
                           '(foo bar baz))
;Value: ((bar baz))

(who is the director of amarcord)
((federico fellini))

(lambda (title)
  (the-only-element-in
   (movies-satisfying 
    our-movie-database
    (lambda (movie) (equal? (movie-title movie) title))
    movie-director)))

(what movies were made in 1955)
(what movie was made in 1964)

(what (movie movies) (was were) made in _)

(define matches?
  (lambda (pattern question)
    (cond ((null? pattern)  (null? question))
          ((null? question) #f)
          ((list? (car pattern))
           (if (member (car question) (car pattern))
               (matches? (cdr pattern)
                         (cdr question))
               #f))
          ((equal? (car pattern) '...) #t)
          ((equal? (car pattern) (car question))
           (matches? (cdr pattern)
                     (cdr question)))
          (else #f))))

(define movie-p/a-list
  (list (make-pattern/action
         '(who is the director of ...)
         (lambda (title)
           (the-only-element-in
            (movies-satisfying 
             our-movie-database
             (lambda (movie) (equal? (movie-title movie) title))
             movie-director))))
        (make-pattern/action
         '(what (movie movies) (was were) made in _)
         (lambda (noun verb year)
           (movies-satisfying 
            our-movie-database
            (lambda (movie) (= (movie-year-made movie) year))
            movie-title)))))

(what (movie movies) (was were) made between _ and _)

(when was the godfather made)
(when was amarcord made)

(when was ... made)

(what movie was made in 1951)

(what movie was made in Barcelona)

(what ((movie was) (movies were)) made in _)

;; Review Problems

(define sevens
  (lambda (n)
    (if (= n 0)
        '()
        (cons 7
              (sevens (- n 1))))))

(define square
  (lambda (x) (* x x)))

(define cube
  (lambda (x) (* x (* x x))))

((function-sum (list square cube)) 2) 
;Value: 12

(define square-sum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (square (car lst))
           (square-sum (cdr lst))))))

(apply-all (list sqrt square cube) 4)
;Value: (2 16 64)

(define seventeens
  (lambda (n)
    (if (= n 0)
        '()
        (cons 17 (cons 17 (seventeens (- n 1)))))))

(define last
  (lambda (lst)
    (if (= (length lst) 1)
        (car lst)
        (last (cdr lst)))))

(define length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (length (cdr lst))))))

(define x (make-couple 2 7))
(define y (make-couple 5 3))
(define z (make-couple 4 4))

(smaller x)
;Value: 2

(larger x)
;Value: 7 

(smaller y)
;Value: 3

(larger y)
;Value: 5 

(smaller z)
;Value: 4

(larger z)
;Value: 4 

(define scale-by-5 (make-list-scaler 5))

(scale-by-5 '(1 2 3 4))
;Value: (5 10 15 20)

(map-2 + '(1 2 3) '(2 0 -5))
;Value: (3 2 -2)

(map-2 * '(1 2 3) '(2 0 -5))
;Value: (2 0 -15)

(define sub1-each
  (lambda (nums)
    (define help
      (lambda (nums results)
        (if (null? nums)
            (reverse results)
            (help (cdr nums)
                  (cons (- (car nums) 1) results)))))
    (help nums '())))

((all-are positive?) '(1 2 3 4))
;Value: #t

((all-are even?) '(2 4 5 6 8))
;Value: #f

(define repeat
  (lambda (num times)
    (if (= times 0)
        '()
        (cons num (repeat num (- times 1))))))

(repeat 3 2)
;Value: (3 3)

(repeat 17 5)
;Value: (17 17 17 17 17)

(expand '(get a job sha 8 na get a job sha 8 na wah 8 yip sha
              boom))
;Value: (get a job sha na na na na na na na na get a job sha na na na na
na na na na wah yip yip yip yip yip yip yip yip sha boom)

(define expand
  (lambda (lst)
    (cond ((null? lst) lst)
          ((number? (car lst))
           (cons (cadr lst)
                 (expand (if (= (car lst) 1)
                             (cddr lst)
                             (cons (- (car lst) 1)
                                   (cdr lst))))))
          (else
           (cons (car lst)
                 (expand (cdr lst)))))))

(list+ '(1 2 3) '(2 4 6))
;Value: (3 6 9)

(list* '(1 2 3) '(2 4 6))
;Value: (2 8 18)

(define list+
  (make-list-combiner +))

(define list*
  (make-list-combiner *))
