package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/textinput")
extern class Textinput {
  public static function appendTextInput(source:flight.esm.types.text.Types.RichText, text:String):Void;
  public static function applyTextInputRestriction(source:flight.esm.types.text.Types.RichText, text:String, replaceLength:Float):String;
  public static function blurSelectableRichText(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw):Void;
  public static function blurTextInput(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw):Void;
  public static function canRedoTextInput(source:flight.esm.types.text.Types.RichText):Bool;
  public static function canUndoTextInput(source:flight.esm.types.text.Types.RichText):Bool;
  public static function clearTextInputHistory(source:flight.esm.types.text.Types.RichText):Void;
  public static function connectInputToTextInput(input:flight.esm.types.textinput_contract.Types.TextInputSource, manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw):flight.esm.types.textinput_contract.Types.TextInputDisposer;
  public static function createSelectableRichTextManager():flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw;
  public static function createTextInputManager():flight.esm.types.textinput_contract.Types.TextInputManagerRaw;
  public static function deleteTextInputBackward(source:flight.esm.types.text.Types.RichText):Void;
  public static function deleteTextInputForward(source:flight.esm.types.text.Types.RichText):Void;
  public static function deleteTextInputWordBackward(source:flight.esm.types.text.Types.RichText):Void;
  public static function deleteTextInputWordForward(source:flight.esm.types.text.Types.RichText):Void;
  public static function disableTextInput(node:flight.esm.types.text.Types.RichText):Void;
  public static function dispatchSelectableRichTextKeyDown(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw, data:flight.esm.types.input.Types.InputKeyboardData, ?onCopy:Null<flight.esm.types.textinput_contract.Types.TextInputCopyCallback>):Bool;
  public static function dispatchSelectableRichTextPointerDown(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw, target:flight.esm.types.text.Types.RichText, x:Float, y:Float, extend:Bool):Void;
  public static function dispatchSelectableRichTextPointerMove(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw, x:Float, y:Float):Void;
  public static function dispatchSelectableRichTextWheel(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw, deltaLines:Float):Void;
  public static function dispatchTextInput(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, text:String):Bool;
  public static function dispatchTextInputKeyDown(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, data:flight.esm.types.input.Types.InputKeyboardData, ?clipboardText:Null<String>, ?onCopy:Null<flight.esm.types.textinput_contract.Types.TextInputCopyCallback>):Bool;
  public static function dispatchTextInputPointerDown(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, target:flight.esm.types.text.Types.RichText, x:Float, y:Float, extend:Bool, clickCount:Float):Void;
  public static function dispatchTextInputPointerMove(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, x:Float, y:Float):Void;
  public static function dispatchTextInputWheel(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, deltaLines:Float):Void;
  public static function enableTextInput(node:flight.esm.types.text.Types.RichText, ?options:Null<flight.esm.types.text.Types.TextInputOptions>):flight.esm.types.text.Types.TextInputState;
  public static function focusSelectableRichText(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw, target:flight.esm.types.text.Types.RichText):Void;
  public static function focusTextInput(manager:flight.esm.types.textinput_contract.Types.TextInputManagerRaw, target:flight.esm.types.text.Types.RichText):Void;
  public static function getSelectableRichTextSelectionText(manager:flight.esm.types.textinput_contract.Types.SelectableRichTextManagerRaw):String;
  public static function getTextInputCaretIndex(source:flight.esm.types.text.Types.RichText):Float;
  public static function getTextInputCaretRectangle(out:flight.esm.types.textlayout.Types.TextSelectionRectangle, source:flight.esm.types.text.Types.RichText, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Void;
  public static function getTextInputCharacterIndexAtPoint(source:flight.esm.types.text.Types.RichText, layout:flight.esm.types.textlayout.Types.TextLayoutResult, x:Float, y:Float):Float;
  public static function getTextInputDisplayText(source:flight.esm.types.text.Types.RichText):String;
  public static function getTextInputSelectionBeginIndex(source:flight.esm.types.text.Types.RichText):Float;
  public static function getTextInputSelectionEndIndex(source:flight.esm.types.text.Types.RichText):Float;
  public static function getTextInputSelectionRectangles(out:Array<flight.esm.types.textlayout.Types.TextSelectionRectangle>, source:flight.esm.types.text.Types.RichText, layout:flight.esm.types.textlayout.Types.TextLayoutResult):Void;
  public static function getTextInputSelectionText(source:flight.esm.types.text.Types.RichText):String;
  public static function getTextInputState(node:flight.esm.types.text.Types.RichText):Null<flight.esm.types.text.Types.TextInputState>;
  public static function handleTextInputKeyboard(source:flight.esm.types.text.Types.RichText, data:flight.esm.types.input.Types.InputKeyboardData, ?options:Null<flight.esm.types.textinput_contract.Types.HandleTextInputKeyboardOptions>):Bool;
  public static function hasTextInput(node:flight.esm.types.text.Types.RichText):Bool;
  public static function insertTextInput(source:flight.esm.types.text.Types.RichText, text:String):Void;
  public static function moveTextInputCaret(source:flight.esm.types.text.Types.RichText, index:Float, extendSelection:Bool):Void;
  public static function moveTextInputCaretByWord(source:flight.esm.types.text.Types.RichText, direction:Float, extendSelection:Bool):Void;
  public static function moveTextInputCaretDown(source:flight.esm.types.text.Types.RichText, layout:Null<flight.esm.types.textlayout.Types.TextLayoutResult>, extendSelection:Bool):Void;
  public static function moveTextInputCaretToLineEnd(source:flight.esm.types.text.Types.RichText, layout:Null<flight.esm.types.textlayout.Types.TextLayoutResult>, extendSelection:Bool):Void;
  public static function moveTextInputCaretToLineStart(source:flight.esm.types.text.Types.RichText, layout:Null<flight.esm.types.textlayout.Types.TextLayoutResult>, extendSelection:Bool):Void;
  public static function moveTextInputCaretUp(source:flight.esm.types.text.Types.RichText, layout:Null<flight.esm.types.textlayout.Types.TextLayoutResult>, extendSelection:Bool):Void;
  public static function redoTextInput(source:flight.esm.types.text.Types.RichText):Void;
  public static function replaceSelectedTextInput(source:flight.esm.types.text.Types.RichText, text:String, ?options:Null<flight.esm.types.textinput_contract.Types.ReplaceTextInputOptions>):Void;
  public static function replaceTextInput(source:flight.esm.types.text.Types.RichText, beginIndex:Float, endIndex:Float, text:String, ?options:Null<flight.esm.types.textinput_contract.Types.ReplaceTextInputOptions>):Void;
  public static function scrollTextInputCaretIntoView(source:flight.esm.types.text.Types.RichText, layout:flight.esm.types.textlayout.Types.TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void;
  public static function selectAllTextInput(source:flight.esm.types.text.Types.RichText):Void;
  public static function selectLineAtTextInputIndex(source:flight.esm.types.text.Types.RichText, index:Float):Void;
  public static function selectWordAtTextInputIndex(source:flight.esm.types.text.Types.RichText, index:Float):Void;
  public static function setTextInputSelection(source:flight.esm.types.text.Types.RichText, beginIndex:Float, endIndex:Float):Void;
  public static function undoTextInput(source:flight.esm.types.text.Types.RichText):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
