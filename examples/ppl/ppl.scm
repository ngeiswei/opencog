(use-modules (srfi srfi-1))
(use-modules (opencog exec))

(define (flip) (Number (random 2)))

(define gsn-flip (GroundedSchema "scm: flip"))

(define exec-flip (ExecutionOutput gsn-flip (List)))

(define X (Variable "$X"))
(define Y (Variable "$Y"))
(define Z (Variable "$Z"))

(define pl-1 (Put (Plus X Y Z) (List exec-flip exec-flip exec-flip)))

(define pl-2 (Put (Plus X X X) exec-flip))

(define pl-3 (Plus exec-flip exec-flip exec-flip))

(define pl-4 (Put (Equal (Number 2) (Plus X Y Z))
                  (List exec-flip exec-flip exec-flip)))

;; TODO: we need a IfThenElseLink to push this further in order to
;; detect if the condition is met, output X if it is or recall the
;; program is it isn't.
