package flight._hl._fn;

extern class Textinput {
	@:hlNative("flight", "flight_create_selectable_rich_text_manager")
	public static function createSelectableRichTextManager():hl.Bytes;
	@:hlNative("flight", "flight_blur_selectable_rich_text")
	public static function blurSelectableRichText(manager:hl.Bytes):Void;
	@:hlNative("flight", "flight_dispatch_selectable_rich_text_pointer_down")
	public static function dispatchSelectableRichTextPointerDown(manager:hl.Bytes, target:flight._hl.FlightNode, x:Float, y:Float, extend:Bool):Void;
	@:hlNative("flight", "flight_dispatch_selectable_rich_text_pointer_move")
	public static function dispatchSelectableRichTextPointerMove(manager:hl.Bytes, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_dispatch_selectable_rich_text_wheel")
	public static function dispatchSelectableRichTextWheel(manager:hl.Bytes, deltaLines:Float):Void;
	@:hlNative("flight", "flight_focus_selectable_rich_text")
	public static function focusSelectableRichText(manager:hl.Bytes, target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_selectable_rich_text_selection_text")
	public static function getSelectableRichTextSelectionText(manager:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_disable_text_input")
	public static function disableTextInput(node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_enable_text_input")
	public static function enableTextInput(node:flight._hl.FlightNode, options:flight._hl.TextInputOptions):hl.Bytes;
	@:hlNative("flight", "flight_get_text_input_state")
	public static function getTextInputState(node:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_has_text_input")
	public static function hasTextInput(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_append_text_input")
	public static function appendTextInput(source:flight._hl.FlightNode, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_text_input_restriction")
	public static function applyTextInputRestriction(source:flight._hl.FlightNode, text:hl.Bytes, replaceLength:Int):hl.Bytes;
	@:hlNative("flight", "flight_can_redo_text_input")
	public static function canRedoTextInput(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_can_undo_text_input")
	public static function canUndoTextInput(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_clear_text_input_history")
	public static function clearTextInputHistory(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_delete_text_input_backward")
	public static function deleteTextInputBackward(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_delete_text_input_forward")
	public static function deleteTextInputForward(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_delete_text_input_word_backward")
	public static function deleteTextInputWordBackward(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_delete_text_input_word_forward")
	public static function deleteTextInputWordForward(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_text_input_caret_index")
	public static function getTextInputCaretIndex(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_text_input_caret_rectangle")
	public static function getTextInputCaretRectangle(out:flight._hl.TextSelectionRectangle, source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_get_text_input_character_index_at_point")
	public static function getTextInputCharacterIndexAtPoint(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, x:Float, y:Float):Int;
	@:hlNative("flight", "flight_get_text_input_display_text")
	public static function getTextInputDisplayText(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_text_input_selection_begin_index")
	public static function getTextInputSelectionBeginIndex(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_text_input_selection_end_index")
	public static function getTextInputSelectionEndIndex(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_text_input_selection_rectangles")
	public static function getTextInputSelectionRectangles(out:hl.Bytes, source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult):Void;
	@:hlNative("flight", "flight_get_text_input_selection_text")
	public static function getTextInputSelectionText(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_handle_text_input_keyboard")
	public static function handleTextInputKeyboard(source:flight._hl.FlightNode, data:flight._hl.InputKeyboardData, options:flight._hl.HandleTextInputKeyboardOptions):Bool;
	@:hlNative("flight", "flight_insert_text_input")
	public static function insertTextInput(source:flight._hl.FlightNode, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_move_text_input_caret")
	public static function moveTextInputCaret(source:flight._hl.FlightNode, index:Int, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_move_text_input_caret_by_word")
	public static function moveTextInputCaretByWord(source:flight._hl.FlightNode, direction:Int, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_move_text_input_caret_down")
	public static function moveTextInputCaretDown(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_move_text_input_caret_to_line_end")
	public static function moveTextInputCaretToLineEnd(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_move_text_input_caret_to_line_start")
	public static function moveTextInputCaretToLineStart(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_move_text_input_caret_up")
	public static function moveTextInputCaretUp(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, extendSelection:Bool):Void;
	@:hlNative("flight", "flight_redo_text_input")
	public static function redoTextInput(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_replace_selected_text_input")
	public static function replaceSelectedTextInput(source:flight._hl.FlightNode, text:hl.Bytes, options:flight._hl.ReplaceTextInputOptions):Void;
	@:hlNative("flight", "flight_replace_text_input")
	public static function replaceTextInput(source:flight._hl.FlightNode, beginIndex:Int, endIndex:Int, text:hl.Bytes, options:flight._hl.ReplaceTextInputOptions):Void;
	@:hlNative("flight", "flight_scroll_text_input_caret_into_view")
	public static function scrollTextInputCaretIntoView(source:flight._hl.FlightNode, layout:flight._hl.TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void;
	@:hlNative("flight", "flight_select_all_text_input")
	public static function selectAllTextInput(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_select_line_at_text_input_index")
	public static function selectLineAtTextInputIndex(source:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_select_word_at_text_input_index")
	public static function selectWordAtTextInputIndex(source:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_set_text_input_selection")
	public static function setTextInputSelection(source:flight._hl.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:hlNative("flight", "flight_undo_text_input")
	public static function undoTextInput(source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_create_text_input_manager")
	public static function createTextInputManager():hl.Bytes;
	@:hlNative("flight", "flight_blur_text_input")
	public static function blurTextInput(manager:hl.Bytes):Void;
	@:hlNative("flight", "flight_connect_input_to_text_input")
	public static function connectInputToTextInput(input:flight._hl.TextInputSource, manager:hl.Bytes):flight._hl.TextInputDisposer;
	@:hlNative("flight", "flight_dispatch_text_input")
	public static function dispatchTextInput(manager:hl.Bytes, text:hl.Bytes):Bool;
	@:hlNative("flight", "flight_dispatch_text_input_pointer_down")
	public static function dispatchTextInputPointerDown(manager:hl.Bytes, target:flight._hl.FlightNode, x:Float, y:Float, extend:Bool, clickCount:Int):Void;
	@:hlNative("flight", "flight_dispatch_text_input_pointer_move")
	public static function dispatchTextInputPointerMove(manager:hl.Bytes, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_dispatch_text_input_wheel")
	public static function dispatchTextInputWheel(manager:hl.Bytes, deltaLines:Float):Void;
	@:hlNative("flight", "flight_focus_text_input")
	public static function focusTextInput(manager:hl.Bytes, target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_free_selectable_rich_text_manager_ref")
	public static function freeSelectableRichTextManagerRef(ptr:flight._hl.SelectableRichTextManager):Void;
	@:hlNative("flight", "flight_free_text_input_manager_ref")
	public static function freeTextInputManagerRef(ptr:flight._hl.TextInputManager):Void;
	@:hlNative("flight", "flight_free_text_input_disposer")
	public static function freeTextInputDisposer(ptr:flight._hl.TextInputDisposer):Void;
}
