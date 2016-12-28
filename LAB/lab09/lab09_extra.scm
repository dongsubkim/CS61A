;; Extra Scheme Questions ;;

; Q5
(define (square x) (* x x))

(define (pow b n)
	(if (equal? 0 n)
	1
	(if (even? n)
		(* (pow b (/ n 2)) (pow b (/ n 2)))
		(* b (pow b (- n 1)))
		)
	)
)

; Q6
(define lst
	(cons (cons 1 nil) 
		  (cons 2 
		        (cons 
					(cons 3 4) 
					(cons 5 nil)
				)
			)
	) 
)

; Q7
(define (composed f g)
  (define (taker x)
	(f (g x))
  )
  taker
)

; Q8
(define (remove item lst)
	(define (f x)
		(not (equal? x item)))
	(filter f lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q9
(define (max a b) (if (> a b) a b))
(define (min a b) (if (> a b) b a))
(define (gcd a b)
	(cond
		((= (min a b) 0) (max a b))
		((= (modulo (max a b) (min a b)) 0) (min a b))
		(else (gcd (min a b) (modulo (max a b) (min a b))))))
	)
)

;;; Tests
(gcd 24 60)
; expect 12
(gcd 1071 462)
; expect 21

; Q10
(define (no-repeats s)
	(define (flt lst v)
		(cond
			((null? lst) nil)
			((eq? (car lst) v) (flt (cdr lst) v))
			(else (cons (car lst) (flt (cdr lst) v)))
		)
	)
	(cond
		((null? s) nil)
		(else (cons (car s) (no-repeats (flt (cdr s) (car s)))))
	)

)

; Q11
(define (substitute s old new)
	(cond
		((null? s) nil)
		((eq? old (car s)) (cons new (substitute (cdr s) old new)))
		((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
		(else (cons (car s) (substitute (cdr s) old new)))
	)
)

; Q12
(define (sub-all s olds news)
	(define (filter v olds news)
		(cond
			((null? olds) v)
			((pair? v) (cons (filter (car v) olds news) (filter (cdr v) olds news)))
			((eq? v (car olds)) (car news))
			(else (filter v (cdr olds) (cdr news)))
		)
	
	)
	(cond
		((null? s) nil)
		((pair? (car s)) (cons (filter (car s) olds news) (filter (cdr s) olds news)))
		(else (cons (filter (car s) olds news) (sub-all (cdr s) olds news)))
	)
)