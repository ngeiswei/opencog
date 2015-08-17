(define pln-rule-epistemic-true-belief
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

(define (pln-formula-epistemic-true-belief A)
  (cog-set-tv!
   (BeliefLink A)
   (pln-formula-epistemic-true-belief-side-effect-free A))
)

(define (pln-formula-epistemic-true-belief-side-effect-free A)
  (let 
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( sA*0.95) (cA))))
