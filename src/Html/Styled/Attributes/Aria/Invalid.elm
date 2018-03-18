module Html.Styled.Attributes.Aria.Invalid exposing (Invalid(..))

{-| The type of invalid states.

@docs Invalid

-}


{-| The type of invalid states, uses by invalid. More info at
<https://www.w3.org/TR/wai-aria/#aria-invalid>.
-}
type Invalid
    = Grammar
    | Invalid
    | Spelling
    | Valid
