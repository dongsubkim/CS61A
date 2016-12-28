(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.
(define (map proc items)
  (if (null? items) nil
	(cons (proc (car items)) (map proc (cdr items)))))

(define (cons-all first rests)
	(define (adder s) (append (list first) s))
	(if (null? rests) (list (list first)) (map adder rests))
)

(define (zip pairs)
	(if (null? pairs) (cons nil (cons nil nil))
		(list (cons (caar pairs) (car (zip (cdr pairs))))
			  (append (cdar pairs) (cadr (zip (cdr pairs))))))
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
	(define (labeling_func i t)
		(if (null? t) nil
			(cons (cons i (cons (car t) nil)) 
				  (labeling_func (+ i 1) (cdr t)))))
	(labeling_func 0 s)
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
	(cond
		((= total 0) nil)
		((null? denoms) nil)
		((< total (car denoms)) (list-change total (cdr denoms)))
		(else (append 
				(cons-all (car denoms) (list-change (- total (car denoms)) denoms))
				(list-change total (cdr denoms)))))
)
  
;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))x

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         (list 'quote (cadr expr))
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (append (list form params) (map let-to-lambda body))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
			(append
				(list (list 'lambda (car (zip values)) (car (map let-to-lambda body)))) 
				(map let-to-lambda (cadr (zip values))))
           ; END PROBLEM 19
           ))
        (else
        ; BEGIN PROBLEM 19
			(map let-to-lambda expr)
		; END PROBLEM 19
         )))
