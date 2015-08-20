; This is the implementation of the complex rule 1 (Section 2.2 of the document)

; Given a proposition A with a truth value s, the agent's belief in A is s*(1-epsilon)

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
  (let (epsilon=0.05)
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( sA*(1-epsilon)) (cA))))
