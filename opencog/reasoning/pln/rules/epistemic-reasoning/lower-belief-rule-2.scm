(define pln-rule-epistemic-lower-belief
  (BindLink
   (VariableList
    (VariableNode "$A"))
   (BeliefLink
    (VariableNode "$A"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemic belief")
    (ListLink
     (VariableNode "$A")
     ))))

(define (pln-formula-epistemic-lower-belief A)
  (cog-set-tv!
   (BeliefLink A)
   (pln-formula-epistemic-lower-belief-side-effect-free A))
)

(define (pln-formula-epistemic-lower-belief-side-effect-free A)
  (let 
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( sA*0.95) (cA))))
