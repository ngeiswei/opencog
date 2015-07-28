(define pln-rule-epistemic-or
  (BindLink
   (VariableList
    (VariableNode "$A")
    (VariableNode "$B"))
   (EOrLink
    (VariableNode "$A")
    (VariableNode "$B"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemicand")
    (ListLink
     (VariableNode "$A")
     (VariableNode "$B")))))

(define (pln-formula-epistemic-or A B)
  (cog-set-tv!
   (EOrLink A B)
   (pln-formula-epistemic-or-side-effect-free A B))
)

(define (pln-formula-epistemic-or-side-effect-free A B)
  (let 
      ((sA (cog-stv-strength A))
       (sB (cog-stv-strength B))
       (cA (cog-stv-confidence A))
       (cB (cog-stv-confidence B)))
    (stv ( min (sA+sB 1)) (min cA cB))))
