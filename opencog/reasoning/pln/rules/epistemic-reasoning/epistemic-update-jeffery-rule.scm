; This is the implementation of the revision rule using Jeffery's rule (see Section 2.3 of the document)

; Given a proposition A and Information Inf, agent revises his belief in A according to Jeffery's rule

(define pln-rule-epistemic-update
  (BindLink
   (VariableList
    (VariableNode "$A")
    (VariableNode "$Inf"))
   (EAndLink
    (VariableNode "$A")
    (VariableNode "$Inf"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemic-update")
    (ListLink
     (VariableNode "$A")
     (VariableNode "$Inf")))))

(define (pln-formula-epistemic-and A Inf)
  (cog-set-tv!
   (EAndLink A B)
   (pln-formula-epistemic-update-side-effect-free A Inf))
)

(define (pln-formula-epistemic-and-side-effect-free A B)
  (let 
      ((sA (cog-stv-strength A))
       (sI (cog-stv-strength Inf))
       (cA (cog-stv-confidence A))
       (cI (cog-stv-confidence Inf)))
    (stv ( sI*sA) (min (cA cI)))))
