;This is the implementation of the epistemic not rule ENOT ( see page 7 of the document)

; Given beliefs in proposition A, we calculate the belief in not A

; the scaling factor accounts for the increase in confidence 

(define pln-rule-epistemic-not
  (BindLink
   (VariableList
    (VariableNode "$A"))
   (ENotLink
    (VariableNode "$A"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemicnot")
    (ListLink
     (VariableNode "$A")))))

(define (pln-formula-epistemic-not A)
  (cog-set-tv!
   (ENotLink A)
   (pln-formula-epistemic-not-side-effect-free A))
)

(define (pln-formula-epistemic-not-side-effect-free A)
  (let 
      ( (epsilon=0.05)
        (scaling=1.5)
        (sA (cog-stv-strength A))
        (cA (cog-stv-confidence A))
       
       (stv (epsilon) (cA*scaling))))
