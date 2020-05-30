(define-library (scheme lazy)
  (import (scheme base))
  (export delay-force delay force make-promise promise?)
  (include "lazy.scm"))
