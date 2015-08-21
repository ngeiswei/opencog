; This is the implementation of the revision rule using Jeffery's rule (see Section 2.3 of the document)

; Given a proposition A and Information Inf, agent revises his belief in A according to Jeffery's rule

; believe i A <s> <c 1 >
; |- 
; Inf <t> <c 2 >
;|- believe i A <u> <min(c 1 , c 2 )>

;where, u = t ∗ s.
;-------------------------------------------------------

(define pln-rule-epistemic-update
  (BindLink
   (VariableList
    (VariableNode "$A")
    (VariableNode "$Info"))
   (EAndLink
    (VariableNode "$A")
    (VariableNode "$Info"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemic-update")
    (ListLink
     (VariableNode "$A")
     (VariableNode "$Info")))))

(define (pln-formula-epistemic-and A Info)
  (cog-set-tv!
   (EAndLink A B)
   (pln-formula-epistemic-update-side-effect-free A Info))
)

(define (pln-formula-epistemic-and-side-effect-free A B)
  (let 
      ((sA (cog-stv-strength A))
       (sI (cog-stv-strength Info))
       (cA (cog-stv-confidence A))
       (cI (cog-stv-confidence Info)))
    (stv ( sI*sA) (min (cA cI)))))
