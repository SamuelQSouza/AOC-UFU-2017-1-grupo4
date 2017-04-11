#lang racket
(require rackunit)

(define (p-nor a b)
  (cond [(and (= a 0)(= b 0)) 1]
        [(and (= a 1)(= b 0)) 0]
        [(and (= a 0)(= b 1)) 0]
        [(and (= a 1)(= b 1)) 0]
        [else 'fail]))

#|
(check-equal? (p-nor 0 0) 1)
(check-equal? (p-nor 0 1) 0)
(check-equal? (p-nor 1 0) 0)
(check-equal? (p-nor 1 1) 0)
|#

(define (p-not a)
  (p-nor a a))

(define (p-and a b)
  (p-nor (p-nor a a)
         (p-nor b b)))

(define (p-and2 a b)
  (p-nor (p-not a)
         (p-not b)))

(define (p-or a b)
  (p-nor (p-nor a b)
         (p-nor a b)))

(define (p-or2 a b)
  (p-not (p-nor a b)))

(define (p-xor a b)
  (p-nor (p-nor a b)
         (p-nor (p-nor a a)
                (p-nor b b))))

(define (p-xor2 a b)
  (p-nor (p-nor a b)
         (p-nor (p-not a)
                (p-not b))))

(define (p-nand a b)
  (p-nor (p-nor (p-nor a a) (p-nor b b))
         (p-nor (p-nor a a) (p-nor b b))))

(define (p-nand2 a b)
  (p-not (p-and a b)))
