
; Implication rule for simple truth values
;
; Given Implication A B , calculate strength of Implication belief A belief B
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
