(define pln-rule-epistemic-belief-in-belief
  (BindLink
   (VariableList
    (VariableNode "$A"))
   (BeliefLink
    (VariableNode "$A"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemic-belief-in-belief")
    (ListLink
     (VariableNode "$A")
     ))))

(define (pln-formula-epistemic-belief-in-belief A)
  (cog-set-tv!
   (BeliefLink (BeliefLink A))
   (pln-formula-epistemic-belief-in-belief-side-effect-free A))
)

(define (pln-formula-epistemic-belief-in-belief-side-effect-free A)
  (let 
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( 0.95) (cA))))
