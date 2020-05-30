(define-syntax delay-force
  (syntax-rules ()
    ((delay-force expression)
     (%make-promise #f (lambda () expression)))))

(define-syntax delay
  (syntax-rules ()
    ((delay expression)
     (delay-force (%make-promise #t expression)))))

(define-record-type <promise>
  (%make-promise done? proc)
  promise?
  (done? promise-done? set-promise-done?!)
  (proc promise-value set-promise-value!))

(define (force promise)
  (if (promise-done? promise)
      (promise-value promise)
      (let ((promise* ((promise-value promise))))
        (unless (promise-done? promise)
          (promise-update! promise* promise))
        (force promise))))

(define promise-update! 
  (lambda (new old)
    (set-promise-done?! old (promise-done? new))
    (set-promise-value! old (promise-value new))
    (set! new old))) ; for garbage collection?

;; The sample implementation of 'make-promise' in the r7rs
;; is incorrect according to its own specification.
(define (make-promise object)
  (if (promise? object) object (delay object)))
