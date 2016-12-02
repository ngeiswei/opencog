# Probabilistic Programming Language

## Examples

### Simple example taken from https://probmods.org/conditioning.html

;; Church code
(define (take-sample)
  (rejection-query

   (define A (if (flip) 1 0))
   (define B (if (flip) 1 0))
   (define C (if (flip) 1 0))
   (define D (+ A B C))

   A

   (condition (>= D 2))))

(hist (repeat 100 take-sample) "Value of A, given that D is greater than or equal to 2")

;; Possible translation in OpenCog usaging the hypothetical RejectionQueryLink
RejectionQueryLink
  ;; Program with save states
  ListLink
    DefineLink
      Node "A"
      ExecutionOutputLink
        GroundedSchemaNode "flip" 
    DefineLink
      Node "B"
      ExecutionOutputLink
        GroundedSchemaNode "flip" 
    DefineLink
      Node "C"
      ExecutionOutputLink
        GroundedSchemaNode "flip" 
    DefineLink
      Node "D"
      PLusLink
        ListLink
          Node "A"
          Node "B"
          Node "C"
  ;; Save state we want to look at
  Node "A"
  ;; Under which condition
  GreaterThanLink
    Node "D"
    NumberNode 2

;; Possible way to store the results using GDTV
ExtensionalImplicationScope {<True:{0:0.25, 1:0.75}, 100>}
  Variable "$T"
  AtTime
    GreaterThanLink
      Node "D"
      NumberNode 2
    $T
  AtTime
    Node "A"
    $T

;; Or simply
SimulatenousExtensionalImplication {<True:{1:0.25, 2:0.5, 3:25}, 100>}
  GreaterThanLink
    Node "D"
    NumberNode 2
  Node "A"

### Variation that highlights the advantage of using a GDTV

;; Chruch code
(define (take-sample)
  (rejection-query

   (define A (if (flip) 1 0))
   (define B (if (flip) 1 0))
   (define C (if (flip) 1 0))
   (define D (+ A B C))

   D

   (condition (equal? A 1))))

(hist (repeat 10000 take-sample) "Value of D, given that A is equal to 1")

;; Possible solution
ExtensionalImplicationScope {<True:{1:0.25, 2:0.5, 3:25}, 10000>}
  Variable "$T"
  AtTime
    Equalink
      Node "A"
      NumberNode 1
    $T
  AtTime
    Node "D"
    $T

;; Or simply
SimulatenousExtensionalImplication {<True:{1:0.25, 2:0.5, 3:25}, 10000>}
  EqualLink
    Node "A"
    NumberNode 1
  Node "D"
