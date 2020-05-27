;;;; Implementation of the (streams primitive) library specified in SRFI 41.
;;;; This differs from the sample implementation by using the standard procedures for delayed evaluation from r7rs.

(define-library (srfi 41 primitive)
  (import (scheme base)
          (scheme lazy))
  (export stream-null stream-cons
          stream? stream-null? stream-pair?
          stream-car stream-cdr
          stream-lambda)
  (include "primitive.scm"))
