
; Implication rule for simple truth values (see Section 2.2, rule 3)
;
; Given Implication A B , calculate strength of Implication belief A belief B

; Implication (A) (B) <s> <c>
; |-
; Implication (believe i A <t>) (believe i B <t>) <s ∗ (1 − \epsilon )> <c>
; -----------------------------------------------------------------------------

(define pln-rule-epistemic-implication
    (BindLink
        (VariableList
            (VariableNode "$A")
            (VariableNode "$B"))
        (ImplicationLink
            (ImplicationLink
                (VariableNode "$A")
                (VariableNode "$B"))
            (VariableNode "$A"))
        (ExecutionOutputLink
            (GroundedSchemaNode "scm: pln-formula-simple-epistemic-implication")
            (ListLink
                (VariableNode "$B")
                (ImplicationLink
                    (VariableNode "$A")
                    (VariableNode "$B"))))))

; -----------------------------------------------------------------------------
; Epistemic Implication Formula
; This version has no side effects and simply returns a TruthValue
; -----------------------------------------------------------------------------

(define (pln-formula-simple-epistemic-implication-side-effect-free AB)
    (let (epsilon=0.05)
        ((sAB (cog-stv-strength (EquivalenceLink (A B)))
        )
         (cAB (cog-stv-confidence (EquivalenceLink (A B) ))))
            (stv (sAB*(1-epsilon)) (cAB))) 

; =============================================================================
