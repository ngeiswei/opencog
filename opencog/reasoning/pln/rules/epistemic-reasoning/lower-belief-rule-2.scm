; This is the implementation of the complex rule 2 (Section 2.2 of the document)

; Given a proposition A, if the agent believes it with a truth value s, then he believes it with any truth value lower than s

; As a result of the lower truth value, the agent's confidence level increases by the scaling factor

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
  (let (scale
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( sA*0.95) (cA))))
