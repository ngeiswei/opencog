;This is the implementation of the epistemic and rule EAND ( see page 7 of the document)

; Given beliefs in propositions A and B, we calculate the belief in A and B

; believe_i (A) <s 1 > <c 1 >
; believe i (B) <s 2 > <c 2 >
; |- 
; believe i (A EAND B) <t> <c>
; where, t = max(s 1 + s 2 − 1, 0), and c = min(c 1 , c 2 ).

(define pln-rule-epistemic-and
  (BindLink
   (VariableList
    (VariableNode "$A")
    (VariableNode "$B"))
   (EAndLink
    (VariableNode "$A")
    (VariableNode "$B"))
   (ExecutionOutputLink
    (GroundedSchemaNode "scm: pln-formula-epistemicand")
    (ListLink
     (VariableNode "$A")
     (VariableNode "$B")))))

(define (pln-formula-epistemic-and A B)
  (cog-set-tv!
   (EAndLink A B)
   (pln-formula-epistemic-and-side-effect-free A B))
)

(define (pln-formula-epistemic-and-side-effect-free A B)
  (let 
      ((sA (cog-stv-strength A))
       (sB (cog-stv-strength B))
       (cA (cog-stv-confidence A))
       (cB (cog-stv-confidence B)))
    (stv ( max (sA+sB-1 0)) (min cA cB))))
