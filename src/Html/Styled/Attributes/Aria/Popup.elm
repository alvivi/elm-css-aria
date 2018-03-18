module Html.Styled.Attributes.Aria.Popup exposing (Popup(..))

{-| The type of interactive popup element.

@docs Popup

-}


{-| Invalid reasons used by invalid. More info at
<https://www.w3.org/TR/wai-aria/#aria-haspopup>.
-}
type Popup
    = Dialog
    | Grid
    | Listbox
    | Menu
    | Tree
