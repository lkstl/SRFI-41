(define-library (srfi 41 primitive)
  (import (scheme base)
          (scheme lazy))
  (export stream-null stream-cons
          stream? stream-null? stream-pair?
          stream-car stream-cdr
          stream-lambda)
  (include "primitive.scm"))
