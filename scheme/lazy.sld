;;;; Implementation of the (scheme lazy) library specified in r7rs
;;;; This differs from the sample implementation given there by using a new record type for promises.
;;;; (Also, it implements make-promise correctly.)

(define-library (scheme lazy)
  (import (scheme base))
  (export delay-force delay force make-promise promise?)
  (include "lazy.scm"))
