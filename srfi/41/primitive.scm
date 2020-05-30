(define-record-type <stream>
  (make-stream promise)
  stream?
  (promise stream-promise))

(define-record-type <stream-null>
  (make-stream-null)
  %stream-null?)

(define-record-type <stream-pair>
  (make-stream-pair head tail)
  %stream-pair?
  (head %stream-car)
  (tail %stream-cdr))

(define stream-null (make-stream (make-promise (make-stream-null))))
(define-syntax stream-cons
  (syntax-rules ()
    ((stream-cons object stream) 
     (make-stream
       (make-promise
         (make-stream-pair
           (delay object)
           (delay-force (stream-promise stream))))))))

(define (stream-null? stream)
  (and (stream? stream)
       (%stream-null? (force (stream-promise stream)))))
(define (stream-pair? stream)
  (and (stream? stream)
       (%stream-pair? (force (stream-promise stream)))))

(define (stream-car stream)
  (force (%stream-car (force (stream-promise stream)))))
(define (stream-cdr stream) 
  (let ((t (force (%stream-cdr (force (stream-promise stream))))))
    (make-stream (make-promise t))))

(define-syntax stream-lambda
  (syntax-rules ()
    ((stream-lambda formals body0 body1 ...)
     (lambda formals
       (make-stream
         (delay-force (stream-promise (let () body0 body1 ...))))))))
