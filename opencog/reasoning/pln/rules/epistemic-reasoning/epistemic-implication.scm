
; Implication rule for simple truth values
;
; Given belief A and Implication A B , calculate strength of belief B
; -----------------------------------------------------------------------------

(define pln-rule-epistemic-implication
    (BindLink
        (VariableList
            (VariableNode "$A")
            (VariableNode "$B"))
        (AndLink
            (ImplicationLink
                (VariableNode "$A")
                (VariableNode "$B"))
            (VariableNode "$A"))
        (ExecutionOutputLink
            (GroundedSchemaNode "scm: pln-formula-simple-modus-ponens")
            (ListLink
                (VariableNode "$B")
                (ImplicationLink
                    (VariableNode "$A")
                    (VariableNode "$B"))))))

; -----------------------------------------------------------------------------
; Modus Ponens Formula
; This version has no side effects and simply returns a TruthValue
; -----------------------------------------------------------------------------

(define (pln-formula-simple-modus-ponens-side-effect-free AB)
    (let
        ((sA (cog-stv-strength (gar AB)))
         (cA (cog-stv-confidence (gar AB))))
            (stv                          ; Strength
                (*
                    (cog-stv-strength AB)
                    sA)
                (+                        ; Confidence
                    (cog-stv-confidence AB)
                    cA))))

; =============================================================================
