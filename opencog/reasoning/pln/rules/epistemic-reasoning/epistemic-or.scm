;This is the implementation of the epistemic or rule EOR ( see page 7 of the document)

; Given beliefs in propositions A and B, we calculate the belief in A or B

; believe_i (A) <s 1 > <c 1 >
; believe i (B) <s 2 > <c 2 >
; |- 
; believe i (A OR B) <t> <c>

; where t = min(s + t, 1), and c = min(c 1 , c 2 ).

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
