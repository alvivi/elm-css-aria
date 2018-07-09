module Html.Styled.Attributes.Aria
    exposing
        ( IdReference
        , activeDescendant
        , controls
        , describedBy
        , expanded
        , hasPopup
        , hidden
        , invalid
        , label
        , labeledBy
        , pressed
        , role
        , selected
        )

{-| An ongoing effort to port all Aria attributes to elm-css.

**NOTE** Some Aria attributes have HTML 5 counterparts with the same
semantic, like `aria-required` and `required`. These kind of attributes are
intentionally not include here.


# Primary

@docs label, role


# Relationships

@docs IdReference, activeDescendant, controls, describedBy, labeledBy


# Widget states and properties

@docs expanded, hasPopup, invalid, pressed, selected


# User interface properties

@docs hidden

-}

import Html.Styled as H exposing (Attribute)
import Html.Styled.Attributes as H
import Html.Styled.Attributes.Aria.Invalid as Invalid exposing (Invalid)
import Html.Styled.Attributes.Aria.Popup as Popup exposing (Popup)
import Html.Styled.Attributes.Aria.Role as Role exposing (Role)


{-| Reference to the ID of another element in the same document. More info at
<https://www.w3.org/TR/wai-aria/#valuetype_idref>.
-}
type alias IdReference =
    String


{-| Identifies the currently active element when DOM focus is on a composite
widget, textbox, group, or application.
<https://www.w3.org/TR/wai-aria/#aria-activedescendant>.
-}
activeDescendant : String -> Attribute msg
activeDescendant =
    H.attribute "aria-activedescendant"


{-| Identifies the element (or elements) whose contents or presence are
controlled by the current element.
-}
controls : List IdReference -> Attribute msg
controls =
    String.join " " >> H.attribute "aria-controls"


{-| Identifies the element (or elements) that describes the object. More info at
<https://www.w3.org/TR/wai-aria/#aria-describedby>.
-}
describedBy : List IdReference -> Attribute msg
describedBy =
    String.join " " >> H.attribute "aria-describedby"


{-| Indicates whether the element, or another grouping element it controls, is
currently expanded or collapsed. More info at
<https://www.w3.org/TR/wai-aria/#aria-expanded>.
-}
expanded : Bool -> Attribute msg
expanded =
    boolToString >> H.attribute "aria-expanded"


{-| Indicates the availability and type of interactive popup element, such as
menu or dialog, that can be triggered by an element.
<https://www.w3.org/TR/wai-aria/#aria-haspopup>.
-}
hasPopup : Popup -> Attribute msg
hasPopup =
    popupToString >> H.attribute "aria-haspopup"


{-| Indicates whether the element is exposed to an accessibility API. More info
at <https://www.w3.org/TR/wai-aria/#aria-hidden>.
**NOTE**: Authors are advised to use extreme caution and consider a wide range
of disabilities when hiding visibly rendered content from assistive
technologies.
-}
hidden : Bool -> Attribute msg
hidden =
    boolToString >> H.attribute "aria-hidden"


{-| Indicates the entered value does not conform to the format expected by the
application. More info at <https://www.w3.org/TR/wai-aria/#aria-invalid>
-}
invalid : Invalid -> Attribute msg
invalid =
    invalidToString >> H.attribute "aria-invalid"


{-| Defines a string value that labels the current element. More info at
<https://www.w3.org/TR/wai-aria/#aria-label>.
-}
label : String -> Attribute msg
label =
    H.attribute "aria-label"


{-| Identifies the element (or elements) that labels the current element. More
info at <https://www.w3.org/TR/wai-aria/#aria-labelby>.
-}
labeledBy : List IdReference -> Attribute msg
labeledBy =
    String.join " " >> H.attribute "aria-labelledby"


{-| Indicates the current "pressed" state of toggle buttons.
<https://www.w3.org/TR/wai-aria/#aria-pressed>.
-}
pressed : Bool -> Attribute msg
pressed =
    boolToString >> H.attribute "aria-pressed"


{-| Sets the type of an element. More info at
<https://www.w3.org/TR/html-aria/#allowed-aria-roles-states-and-properties>.
-}
role : Role -> Attribute msg
role =
    roleToString >> H.attribute "role"


{-| Indicates the current "selected" state of various widgets.
<https://www.w3.org/TR/wai-aria/#aria-selected>.
-}
selected : Bool -> Attribute msg
selected =
    boolToString >> H.attribute "aria-selected"



-- Internal --


boolToString : Bool -> String
boolToString bool =
    if bool then
        "true"
    else
        "false"


popupToString : Popup -> String
popupToString popup =
    case popup of
        Popup.Dialog ->
            "dialog"

        Popup.Grid ->
            "grid"

        Popup.ListBox ->
            "listbox"

        Popup.Menu ->
            "menu"

        Popup.Tree ->
            "tree"


invalidToString : Invalid -> String
invalidToString invalid =
    case invalid of
        Invalid.Grammar ->
            "grammar"

        Invalid.Invalid ->
            "invalid"

        Invalid.Spelling ->
            "spelling"

        Invalid.Valid ->
            "valid"


roleToString : Role -> String
roleToString role =
    case role of
        Role.Any ->
            "any"

        Role.Alert ->
            "alert"

        Role.Alertdialog ->
            "alertdialog"

        Role.Application ->
            "application"

        Role.Article ->
            "article"

        Role.Banner ->
            "banner"

        Role.Button ->
            "button"

        Role.Checkbox ->
            "checkbox"

        Role.Cell ->
            "cell"

        Role.Columnheader ->
            "columnheader"

        Role.Combobox ->
            "combobox"

        Role.Complementary ->
            "complementary"

        Role.Contentinfo ->
            "contentinfo"

        Role.Definition ->
            "definition"

        Role.Dialog ->
            "dialog"

        Role.Directory ->
            "directory"

        Role.Document ->
            "document"

        Role.Feed ->
            "feed"

        Role.Figure ->
            "figure"

        Role.Form ->
            "form"

        Role.Group ->
            "group"

        Role.Heading ->
            "heading"

        Role.Img ->
            "img"

        Role.Link ->
            "link"

        Role.List ->
            "list"

        Role.Listbox ->
            "listbox"

        Role.Listitem ->
            "listitem"

        Role.Log ->
            "log"

        Role.Main ->
            "main"

        Role.Marquee ->
            "marquee"

        Role.Math ->
            "math"

        Role.Menu ->
            "menu"

        Role.Menuitem ->
            "menuitem"

        Role.Menuitemcheckbox ->
            "menuitemcheckbox"

        Role.Menuitemradio ->
            "menuitemradio"

        Role.Navigation ->
            "navigation"

        Role.None ->
            "none"

        Role.Note ->
            "note"

        Role.Option ->
            "option"

        Role.Presentation ->
            "presentation"

        Role.Progressbar ->
            "progressbar"

        Role.Radio ->
            "radio"

        Role.Radiogroup ->
            "radiogroup"

        Role.Region ->
            "region"

        Role.Row ->
            "row"

        Role.Rowgroup ->
            "rowgroup"

        Role.Rowheader ->
            "rowheader"

        Role.Scrollbar ->
            "scrollbar"

        Role.Search ->
            "search"

        Role.Searchbox ->
            "searchbox"

        Role.Separator ->
            "separator"

        Role.Slider ->
            "slider"

        Role.Spinbutton ->
            "spinbutton"

        Role.Statu ->
            "statu"

        Role.Switch ->
            "switch"

        Role.Tab ->
            "tab"

        Role.Table ->
            "table"

        Role.Tablist ->
            "tablist"

        Role.Tabpanel ->
            "tabpanel"

        Role.Term ->
            "term"

        Role.Textbox ->
            "textbox"

        Role.Toolbar ->
            "toolbar"

        Role.Tooltip ->
            "tooltip"

        Role.Tree ->
            "tree"

        Role.Treegrid ->
            "treegrid"

        Role.Treeitem ->
            "treeitem"
