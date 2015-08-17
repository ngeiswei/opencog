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
      ((sA (cog-stv-strength A))
       (cA (cog-stv-confidence A))
       
       (stv ( 1-sA 0) (cA*0.95))))
