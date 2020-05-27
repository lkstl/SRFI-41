# SRFI 41

Implementation of the `(streams primitive)` library specified in SRFI 41 under the name `(srfi 41 primitive)`.
It differs from the sample implementation by using the standard scheme primitives for delayed evaluation (e.g. `delay-force` instead of `stream-lazy`).
These primitives are described in the r7rs as part of the `(scheme lazy)` library.
We provide a custom implementation of this library, which differs from the sample implementation given in the r7rs by using a record type `<promise>` for promises.
