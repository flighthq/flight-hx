package flight._cpp._fn;

extern class Textinput {
	@:native("flight_create_selectable_rich_text_manager")
	public static function createSelectableRichTextManager():cpp.Star<cpp.Void>;
	@:native("flight_blur_selectable_rich_text")
	public static function blurSelectableRichText(manager:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispatch_selectable_rich_text_pointer_down")
	public static function dispatchSelectableRichTextPointerDown(manager:cpp.Star<cpp.Void>, target:flight._cpp.FlightNode, x:Float, y:Float, extend:Bool):Void;
	@:native("flight_dispatch_selectable_rich_text_pointer_move")
	public static function dispatchSelectableRichTextPointerMove(manager:cpp.Star<cpp.Void>, x:Float, y:Float):Void;
	@:native("flight_dispatch_selectable_rich_text_wheel")
	public static function dispatchSelectableRichTextWheel(manager:cpp.Star<cpp.Void>, deltaLines:Float):Void;
	@:native("flight_focus_selectable_rich_text")
	public static function focusSelectableRichText(manager:cpp.Star<cpp.Void>, target:flight._cpp.FlightNode):Void;
	@:native("flight_get_selectable_rich_text_selection_text")
	public static function getSelectableRichTextSelectionText(manager:cpp.Star<cpp.Void>):cpp.ConstCharStar;
	@:native("flight_disable_text_input")
	public static function disableTextInput(node:flight._cpp.FlightNode):Void;
	@:native("flight_enable_text_input")
	public static function enableTextInput(node:flight._cpp.FlightNode, options:flight._cpp.TextInputOptions):cpp.Star<cpp.Void>;
	@:native("flight_get_text_input_state")
	public static function getTextInputState(node:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_has_text_input")
	public static function hasTextInput(node:flight._cpp.FlightNode):Bool;
	@:native("flight_append_text_input")
	public static function appendTextInput(source:flight._cpp.FlightNode, text:cpp.ConstCharStar):Void;
	@:native("flight_apply_text_input_restriction")
	public static function applyTextInputRestriction(source:flight._cpp.FlightNode, text:cpp.ConstCharStar, replaceLength:Int):cpp.ConstCharStar;
	@:native("flight_can_redo_text_input")
	public static function canRedoTextInput(source:flight._cpp.FlightNode):Bool;
	@:native("flight_can_undo_text_input")
	public static function canUndoTextInput(source:flight._cpp.FlightNode):Bool;
	@:native("flight_clear_text_input_history")
	public static function clearTextInputHistory(source:flight._cpp.FlightNode):Void;
	@:native("flight_delete_text_input_backward")
	public static function deleteTextInputBackward(source:flight._cpp.FlightNode):Void;
	@:native("flight_delete_text_input_forward")
	public static function deleteTextInputForward(source:flight._cpp.FlightNode):Void;
	@:native("flight_delete_text_input_word_backward")
	public static function deleteTextInputWordBackward(source:flight._cpp.FlightNode):Void;
	@:native("flight_delete_text_input_word_forward")
	public static function deleteTextInputWordForward(source:flight._cpp.FlightNode):Void;
	@:native("flight_get_text_input_caret_index")
	public static function getTextInputCaretIndex(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_text_input_caret_rectangle")
	public static function getTextInputCaretRectangle(out:flight._cpp.TextSelectionRectangle, source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_get_text_input_character_index_at_point")
	public static function getTextInputCharacterIndexAtPoint(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, x:Float, y:Float):Int;
	@:native("flight_get_text_input_display_text")
	public static function getTextInputDisplayText(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_get_text_input_selection_begin_index")
	public static function getTextInputSelectionBeginIndex(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_text_input_selection_end_index")
	public static function getTextInputSelectionEndIndex(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_text_input_selection_rectangles")
	public static function getTextInputSelectionRectangles(out:cpp.Star<cpp.Void>, source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult):Void;
	@:native("flight_get_text_input_selection_text")
	public static function getTextInputSelectionText(source:flight._cpp.FlightNode):cpp.ConstCharStar;
	@:native("flight_handle_text_input_keyboard")
	public static function handleTextInputKeyboard(source:flight._cpp.FlightNode, data:flight._cpp.InputKeyboardData, options:flight._cpp.HandleTextInputKeyboardOptions):Bool;
	@:native("flight_insert_text_input")
	public static function insertTextInput(source:flight._cpp.FlightNode, text:cpp.ConstCharStar):Void;
	@:native("flight_move_text_input_caret")
	public static function moveTextInputCaret(source:flight._cpp.FlightNode, index:Int, extendSelection:Bool):Void;
	@:native("flight_move_text_input_caret_by_word")
	public static function moveTextInputCaretByWord(source:flight._cpp.FlightNode, direction:Int, extendSelection:Bool):Void;
	@:native("flight_move_text_input_caret_down")
	public static function moveTextInputCaretDown(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, extendSelection:Bool):Void;
	@:native("flight_move_text_input_caret_to_line_end")
	public static function moveTextInputCaretToLineEnd(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, extendSelection:Bool):Void;
	@:native("flight_move_text_input_caret_to_line_start")
	public static function moveTextInputCaretToLineStart(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, extendSelection:Bool):Void;
	@:native("flight_move_text_input_caret_up")
	public static function moveTextInputCaretUp(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, extendSelection:Bool):Void;
	@:native("flight_redo_text_input")
	public static function redoTextInput(source:flight._cpp.FlightNode):Void;
	@:native("flight_replace_selected_text_input")
	public static function replaceSelectedTextInput(source:flight._cpp.FlightNode, text:cpp.ConstCharStar, options:flight._cpp.ReplaceTextInputOptions):Void;
	@:native("flight_replace_text_input")
	public static function replaceTextInput(source:flight._cpp.FlightNode, beginIndex:Int, endIndex:Int, text:cpp.ConstCharStar, options:flight._cpp.ReplaceTextInputOptions):Void;
	@:native("flight_scroll_text_input_caret_into_view")
	public static function scrollTextInputCaretIntoView(source:flight._cpp.FlightNode, layout:flight._cpp.TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void;
	@:native("flight_select_all_text_input")
	public static function selectAllTextInput(source:flight._cpp.FlightNode):Void;
	@:native("flight_select_line_at_text_input_index")
	public static function selectLineAtTextInputIndex(source:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_select_word_at_text_input_index")
	public static function selectWordAtTextInputIndex(source:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_set_text_input_selection")
	public static function setTextInputSelection(source:flight._cpp.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_undo_text_input")
	public static function undoTextInput(source:flight._cpp.FlightNode):Void;
	@:native("flight_create_text_input_manager")
	public static function createTextInputManager():cpp.Star<cpp.Void>;
	@:native("flight_blur_text_input")
	public static function blurTextInput(manager:cpp.Star<cpp.Void>):Void;
	@:native("flight_connect_input_to_text_input")
	public static function connectInputToTextInput(input:flight._cpp.TextInputSource, manager:cpp.Star<cpp.Void>):flight._cpp.TextInputDisposer;
	@:native("flight_dispatch_text_input")
	public static function dispatchTextInput(manager:cpp.Star<cpp.Void>, text:cpp.ConstCharStar):Bool;
	@:native("flight_dispatch_text_input_pointer_down")
	public static function dispatchTextInputPointerDown(manager:cpp.Star<cpp.Void>, target:flight._cpp.FlightNode, x:Float, y:Float, extend:Bool, clickCount:Int):Void;
	@:native("flight_dispatch_text_input_pointer_move")
	public static function dispatchTextInputPointerMove(manager:cpp.Star<cpp.Void>, x:Float, y:Float):Void;
	@:native("flight_dispatch_text_input_wheel")
	public static function dispatchTextInputWheel(manager:cpp.Star<cpp.Void>, deltaLines:Float):Void;
	@:native("flight_focus_text_input")
	public static function focusTextInput(manager:cpp.Star<cpp.Void>, target:flight._cpp.FlightNode):Void;
	@:native("flight_free_selectable_rich_text_manager_ref")
	public static function freeSelectableRichTextManagerRef(ptr:flight._cpp.SelectableRichTextManager):Void;
	@:native("flight_free_text_input_manager_ref")
	public static function freeTextInputManagerRef(ptr:flight._cpp.TextInputManager):Void;
	@:native("flight_free_text_input_disposer")
	public static function freeTextInputDisposer(ptr:flight._cpp.TextInputDisposer):Void;
}
