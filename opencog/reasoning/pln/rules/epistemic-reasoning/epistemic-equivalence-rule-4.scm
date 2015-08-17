
; Equivalence rule for simple truth values
;
; Given Implication A B , calculate strength of Equivalence belief A belief B
; -----------------------------------------------------------------------------

(define pln-rule-epistemic-equivalence
    (BindLink
        (VariableList
            (VariableNode "$A")
            (VariableNode "$B"))
        (EquivalenceLink
            (AndLink
                (VariableNode "$A")
                (VariableNode "$B"))
            (VariableNode "$A"))
        (ExecutionOutputLink
            (GroundedSchemaNode "scm: pln-formula-simple-epistemic-implication")
            (ListLink
                (VariableNode "$B")
                (EquivalenceLink
                    (VariableNode "$A")
                    (VariableNode "$B"))))))

; -----------------------------------------------------------------------------
; Epistemic Equivalence Formula
; This version has no side effects and simply returns a TruthValue
; -----------------------------------------------------------------------------


(define (pln-formula-simple-epistemic-equivalence-side-effect-free EquivalenceLink(A B))
    (let
        ((sAB (cog-stv-strength (EquivalenceLink (A B)))
        )
         (cAB (cog-stv-confidence (EquivalenceLink (A B) ))))
            (stv ( max (sAB*0.95)) (cAB))))  
