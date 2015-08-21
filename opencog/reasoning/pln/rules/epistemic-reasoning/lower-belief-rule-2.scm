; This is the implementation of the complex rule 2 (Section 2.2 of the document)

; Given a proposition A, if the agent believes it with a truth value s, then he believes it with any truth value lower than s

; As a result of the lower truth value, the agent's confidence level increases by the scaling factor

; believe i A <s 1 > <c 1 >
; |-
; believe i A <s 2 > <c 2 >
 
 ;where, 0 ≤ s 2 ≤ s 1 ≤ 1 and c 2 ≥ c 1 .
;----------------------------------------------------------

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
  (let (scale = 1.5)
      ((sA (cog-stv-strength A))
          (cA (cog-stv-confidence A))
    (stv ( sA/scale) (cA*scale))))
