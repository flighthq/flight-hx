package flight._js._fn;

@:jsRequire("@flighthq/textinput")
extern class Textinput {
	@:native("createSelectableRichTextManager")
	public static function createSelectableRichTextManager():Dynamic;
	@:native("blurSelectableRichText")
	public static function blurSelectableRichText(manager:Dynamic):Void;
	@:native("dispatchSelectableRichTextPointerDown")
	public static function dispatchSelectableRichTextPointerDown(manager:Dynamic, target:Dynamic, x:Float, y:Float, extend:Bool):Void;
	@:native("dispatchSelectableRichTextPointerMove")
	public static function dispatchSelectableRichTextPointerMove(manager:Dynamic, x:Float, y:Float):Void;
	@:native("dispatchSelectableRichTextWheel")
	public static function dispatchSelectableRichTextWheel(manager:Dynamic, deltaLines:Float):Void;
	@:native("focusSelectableRichText")
	public static function focusSelectableRichText(manager:Dynamic, target:Dynamic):Void;
	@:native("getSelectableRichTextSelectionText")
	public static function getSelectableRichTextSelectionText(manager:Dynamic):String;
	@:native("disableTextInput")
	public static function disableTextInput(node:Dynamic):Void;
	@:native("enableTextInput")
	public static function enableTextInput(node:Dynamic, options:Null<flight._js.TextInputOptions>):Dynamic;
	@:native("getTextInputState")
	public static function getTextInputState(node:Dynamic):Null<Dynamic>;
	@:native("hasTextInput")
	public static function hasTextInput(node:Dynamic):Bool;
	@:native("appendTextInput")
	public static function appendTextInput(source:Dynamic, text:String):Void;
	@:native("applyTextInputRestriction")
	public static function applyTextInputRestriction(source:Dynamic, text:String, replaceLength:Int):String;
	@:native("canRedoTextInput")
	public static function canRedoTextInput(source:Dynamic):Bool;
	@:native("canUndoTextInput")
	public static function canUndoTextInput(source:Dynamic):Bool;
	@:native("clearTextInputHistory")
	public static function clearTextInputHistory(source:Dynamic):Void;
	@:native("deleteTextInputBackward")
	public static function deleteTextInputBackward(source:Dynamic):Void;
	@:native("deleteTextInputForward")
	public static function deleteTextInputForward(source:Dynamic):Void;
	@:native("deleteTextInputWordBackward")
	public static function deleteTextInputWordBackward(source:Dynamic):Void;
	@:native("deleteTextInputWordForward")
	public static function deleteTextInputWordForward(source:Dynamic):Void;
	@:native("getTextInputCaretIndex")
	public static function getTextInputCaretIndex(source:Dynamic):Int;
	@:native("getTextInputCaretRectangle")
	public static function getTextInputCaretRectangle(out:flight._js.TextSelectionRectangle, source:Dynamic, layout:flight._js.TextLayoutResult):Void;
	@:native("getTextInputCharacterIndexAtPoint")
	public static function getTextInputCharacterIndexAtPoint(source:Dynamic, layout:flight._js.TextLayoutResult, x:Float, y:Float):Int;
	@:native("getTextInputDisplayText")
	public static function getTextInputDisplayText(source:Dynamic):String;
	@:native("getTextInputSelectionBeginIndex")
	public static function getTextInputSelectionBeginIndex(source:Dynamic):Int;
	@:native("getTextInputSelectionEndIndex")
	public static function getTextInputSelectionEndIndex(source:Dynamic):Int;
	@:native("getTextInputSelectionRectangles")
	public static function getTextInputSelectionRectangles(out:Dynamic, source:Dynamic, layout:flight._js.TextLayoutResult):Void;
	@:native("getTextInputSelectionText")
	public static function getTextInputSelectionText(source:Dynamic):String;
	@:native("handleTextInputKeyboard")
	public static function handleTextInputKeyboard(source:Dynamic, data:flight._js.InputKeyboardData, options:Null<flight._js.HandleTextInputKeyboardOptions>):Bool;
	@:native("insertTextInput")
	public static function insertTextInput(source:Dynamic, text:String):Void;
	@:native("moveTextInputCaret")
	public static function moveTextInputCaret(source:Dynamic, index:Int, extendSelection:Bool):Void;
	@:native("moveTextInputCaretByWord")
	public static function moveTextInputCaretByWord(source:Dynamic, direction:Int, extendSelection:Bool):Void;
	@:native("moveTextInputCaretDown")
	public static function moveTextInputCaretDown(source:Dynamic, layout:Null<flight._js.TextLayoutResult>, extendSelection:Bool):Void;
	@:native("moveTextInputCaretToLineEnd")
	public static function moveTextInputCaretToLineEnd(source:Dynamic, layout:Null<flight._js.TextLayoutResult>, extendSelection:Bool):Void;
	@:native("moveTextInputCaretToLineStart")
	public static function moveTextInputCaretToLineStart(source:Dynamic, layout:Null<flight._js.TextLayoutResult>, extendSelection:Bool):Void;
	@:native("moveTextInputCaretUp")
	public static function moveTextInputCaretUp(source:Dynamic, layout:Null<flight._js.TextLayoutResult>, extendSelection:Bool):Void;
	@:native("redoTextInput")
	public static function redoTextInput(source:Dynamic):Void;
	@:native("replaceSelectedTextInput")
	public static function replaceSelectedTextInput(source:Dynamic, text:String, options:Null<flight._js.ReplaceTextInputOptions>):Void;
	@:native("replaceTextInput")
	public static function replaceTextInput(source:Dynamic, beginIndex:Int, endIndex:Int, text:String, options:Null<flight._js.ReplaceTextInputOptions>):Void;
	@:native("scrollTextInputCaretIntoView")
	public static function scrollTextInputCaretIntoView(source:Dynamic, layout:flight._js.TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void;
	@:native("selectAllTextInput")
	public static function selectAllTextInput(source:Dynamic):Void;
	@:native("selectLineAtTextInputIndex")
	public static function selectLineAtTextInputIndex(source:Dynamic, index:Int):Void;
	@:native("selectWordAtTextInputIndex")
	public static function selectWordAtTextInputIndex(source:Dynamic, index:Int):Void;
	@:native("setTextInputSelection")
	public static function setTextInputSelection(source:Dynamic, beginIndex:Int, endIndex:Int):Void;
	@:native("undoTextInput")
	public static function undoTextInput(source:Dynamic):Void;
	@:native("createTextInputManager")
	public static function createTextInputManager():Dynamic;
	@:native("blurTextInput")
	public static function blurTextInput(manager:Dynamic):Void;
	@:native("connectInputToTextInput")
	public static function connectInputToTextInput(input:flight._js.TextInputSource, manager:Dynamic):flight._js.TextInputDisposer;
	@:native("dispatchTextInput")
	public static function dispatchTextInput(manager:Dynamic, text:String):Bool;
	@:native("dispatchTextInputPointerDown")
	public static function dispatchTextInputPointerDown(manager:Dynamic, target:Dynamic, x:Float, y:Float, extend:Bool, clickCount:Int):Void;
	@:native("dispatchTextInputPointerMove")
	public static function dispatchTextInputPointerMove(manager:Dynamic, x:Float, y:Float):Void;
	@:native("dispatchTextInputWheel")
	public static function dispatchTextInputWheel(manager:Dynamic, deltaLines:Float):Void;
	@:native("focusTextInput")
	public static function focusTextInput(manager:Dynamic, target:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSelectableRichTextManagerRef(ptr:flight._js.SelectableRichTextManager):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextInputManagerRef(ptr:flight._js.TextInputManager):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextInputDisposer(ptr:flight._js.TextInputDisposer):Void {}
}
