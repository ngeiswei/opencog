; This is the implementation of the complex rule 5 (Page 9 of the document in the theory folder)

; Given a BeliefLink A, the agent's belief in his own belief is a very high value 1-\epsilon (\epsilon is a low value)

;believe i A <s> <c 1 > 
; |- 
;believe i (believe i A) <1-\epsilon> <c 2 >

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
      ( (epsilon = 0.05)
          (sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( (1 - epsilon) (cA))))
