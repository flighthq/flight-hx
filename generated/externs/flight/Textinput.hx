package flight;

#if (js && flight_esm)
extern inline function createSelectableRichTextManager():Dynamic {
	return flight._js._fn.Textinput.createSelectableRichTextManager();
}
#else
extern inline function createSelectableRichTextManager():Dynamic {
#if hl
	return flight._hl._fn.Textinput.createSelectableRichTextManager();
#elseif cpp
	return flight._cpp._fn.Textinput.createSelectableRichTextManager();
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.createSelectableRichTextManager();
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurSelectableRichText(manager:Dynamic):Void {
	flight._js._fn.Textinput.blurSelectableRichText(manager);
}
#else
extern inline function blurSelectableRichText(manager:Dynamic):Void {
#if hl
	flight._hl._fn.Textinput.blurSelectableRichText(manager);
#elseif cpp
	flight._cpp._fn.Textinput.blurSelectableRichText(manager);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.blurSelectableRichText(manager);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchSelectableRichTextPointerDown(manager:Dynamic, target:Dynamic, x:Float, y:Float, extend:Bool):Void {
	flight._js._fn.Textinput.dispatchSelectableRichTextPointerDown(manager, target, x, y, extend);
}
#else
extern inline function dispatchSelectableRichTextPointerDown(manager:Dynamic, target:flight.FlightNode, x:Float, y:Float, extend:Bool):Void {
#if hl
	flight._hl._fn.Textinput.dispatchSelectableRichTextPointerDown(manager, target, x, y, extend);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchSelectableRichTextPointerDown(manager, target, x, y, extend);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchSelectableRichTextPointerDown(manager, target, x, y, extend);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchSelectableRichTextPointerMove(manager:Dynamic, x:Float, y:Float):Void {
	flight._js._fn.Textinput.dispatchSelectableRichTextPointerMove(manager, x, y);
}
#else
extern inline function dispatchSelectableRichTextPointerMove(manager:Dynamic, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Textinput.dispatchSelectableRichTextPointerMove(manager, x, y);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchSelectableRichTextPointerMove(manager, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchSelectableRichTextPointerMove(manager, x, y);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchSelectableRichTextWheel(manager:Dynamic, deltaLines:Float):Void {
	flight._js._fn.Textinput.dispatchSelectableRichTextWheel(manager, deltaLines);
}
#else
extern inline function dispatchSelectableRichTextWheel(manager:Dynamic, deltaLines:Float):Void {
#if hl
	flight._hl._fn.Textinput.dispatchSelectableRichTextWheel(manager, deltaLines);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchSelectableRichTextWheel(manager, deltaLines);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchSelectableRichTextWheel(manager, deltaLines);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusSelectableRichText(manager:Dynamic, target:Dynamic):Void {
	flight._js._fn.Textinput.focusSelectableRichText(manager, target);
}
#else
extern inline function focusSelectableRichText(manager:Dynamic, target:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.focusSelectableRichText(manager, target);
#elseif cpp
	flight._cpp._fn.Textinput.focusSelectableRichText(manager, target);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.focusSelectableRichText(manager, target);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSelectableRichTextSelectionText(manager:Dynamic):String {
	return flight._js._fn.Textinput.getSelectableRichTextSelectionText(manager);
}
#else
extern inline function getSelectableRichTextSelectionText(manager:Dynamic):String {
#if hl
	return cast flight._hl._fn.Textinput.getSelectableRichTextSelectionText(manager);
#elseif cpp
	return cast flight._cpp._fn.Textinput.getSelectableRichTextSelectionText(manager);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textinput.getSelectableRichTextSelectionText(manager);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableTextInput(node:Dynamic):Void {
	flight._js._fn.Textinput.disableTextInput(node);
}
#else
extern inline function disableTextInput(node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.disableTextInput(node);
#elseif cpp
	flight._cpp._fn.Textinput.disableTextInput(node);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.disableTextInput(node);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextInput(node:Dynamic, options:Null<TextInputOptions>):Dynamic {
	return flight._js._fn.Textinput.enableTextInput(node, options);
}
#else
extern inline function enableTextInput(node:flight.FlightNode, options:TextInputOptions):Dynamic {
#if hl
	return flight._hl._fn.Textinput.enableTextInput(node, options);
#elseif cpp
	return flight._cpp._fn.Textinput.enableTextInput(node, options);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.enableTextInput(node, options);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputState(node:Dynamic):Null<Dynamic> {
	return flight._js._fn.Textinput.getTextInputState(node);
}
#else
extern inline function getTextInputState(node:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Textinput.getTextInputState(node);
#elseif cpp
	return flight._cpp._fn.Textinput.getTextInputState(node);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.getTextInputState(node);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasTextInput(node:Dynamic):Bool {
	return flight._js._fn.Textinput.hasTextInput(node);
}
#else
extern inline function hasTextInput(node:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Textinput.hasTextInput(node);
#elseif cpp
	return flight._cpp._fn.Textinput.hasTextInput(node);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.hasTextInput(node);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendTextInput(source:Dynamic, text:String):Void {
	flight._js._fn.Textinput.appendTextInput(source, text);
}
#else
extern inline function appendTextInput(source:flight.FlightNode, text:String):Void {
#if hl
	flight._hl._fn.Textinput.appendTextInput(source, cast text);
#elseif cpp
	flight._cpp._fn.Textinput.appendTextInput(source, cast text);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.appendTextInput(source, text);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyTextInputRestriction(source:Dynamic, text:String, replaceLength:Int):String {
	return flight._js._fn.Textinput.applyTextInputRestriction(source, text, replaceLength);
}
#else
extern inline function applyTextInputRestriction(source:flight.FlightNode, text:String, replaceLength:Int):String {
#if hl
	return cast flight._hl._fn.Textinput.applyTextInputRestriction(source, cast text, replaceLength);
#elseif cpp
	return cast flight._cpp._fn.Textinput.applyTextInputRestriction(source, cast text, replaceLength);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textinput.applyTextInputRestriction(source, text, replaceLength);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function canRedoTextInput(source:Dynamic):Bool {
	return flight._js._fn.Textinput.canRedoTextInput(source);
}
#else
extern inline function canRedoTextInput(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Textinput.canRedoTextInput(source);
#elseif cpp
	return flight._cpp._fn.Textinput.canRedoTextInput(source);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.canRedoTextInput(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function canUndoTextInput(source:Dynamic):Bool {
	return flight._js._fn.Textinput.canUndoTextInput(source);
}
#else
extern inline function canUndoTextInput(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Textinput.canUndoTextInput(source);
#elseif cpp
	return flight._cpp._fn.Textinput.canUndoTextInput(source);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.canUndoTextInput(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearTextInputHistory(source:Dynamic):Void {
	flight._js._fn.Textinput.clearTextInputHistory(source);
}
#else
extern inline function clearTextInputHistory(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.clearTextInputHistory(source);
#elseif cpp
	flight._cpp._fn.Textinput.clearTextInputHistory(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.clearTextInputHistory(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function deleteTextInputBackward(source:Dynamic):Void {
	flight._js._fn.Textinput.deleteTextInputBackward(source);
}
#else
extern inline function deleteTextInputBackward(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.deleteTextInputBackward(source);
#elseif cpp
	flight._cpp._fn.Textinput.deleteTextInputBackward(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.deleteTextInputBackward(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function deleteTextInputForward(source:Dynamic):Void {
	flight._js._fn.Textinput.deleteTextInputForward(source);
}
#else
extern inline function deleteTextInputForward(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.deleteTextInputForward(source);
#elseif cpp
	flight._cpp._fn.Textinput.deleteTextInputForward(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.deleteTextInputForward(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function deleteTextInputWordBackward(source:Dynamic):Void {
	flight._js._fn.Textinput.deleteTextInputWordBackward(source);
}
#else
extern inline function deleteTextInputWordBackward(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.deleteTextInputWordBackward(source);
#elseif cpp
	flight._cpp._fn.Textinput.deleteTextInputWordBackward(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.deleteTextInputWordBackward(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function deleteTextInputWordForward(source:Dynamic):Void {
	flight._js._fn.Textinput.deleteTextInputWordForward(source);
}
#else
extern inline function deleteTextInputWordForward(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.deleteTextInputWordForward(source);
#elseif cpp
	flight._cpp._fn.Textinput.deleteTextInputWordForward(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.deleteTextInputWordForward(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputCaretIndex(source:Dynamic):Int {
	return flight._js._fn.Textinput.getTextInputCaretIndex(source);
}
#else
extern inline function getTextInputCaretIndex(source:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Textinput.getTextInputCaretIndex(source);
#elseif cpp
	return flight._cpp._fn.Textinput.getTextInputCaretIndex(source);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.getTextInputCaretIndex(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputCaretRectangle(out:TextSelectionRectangle, source:Dynamic, layout:TextLayoutResult):Void {
	flight._js._fn.Textinput.getTextInputCaretRectangle(out, source, layout);
}
#else
extern inline function getTextInputCaretRectangle(out:TextSelectionRectangle, source:flight.FlightNode, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textinput.getTextInputCaretRectangle(out, source, layout);
#elseif cpp
	flight._cpp._fn.Textinput.getTextInputCaretRectangle(out, source, layout);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.getTextInputCaretRectangle(out, source, layout);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputCharacterIndexAtPoint(source:Dynamic, layout:TextLayoutResult, x:Float, y:Float):Int {
	return flight._js._fn.Textinput.getTextInputCharacterIndexAtPoint(source, layout, x, y);
}
#else
extern inline function getTextInputCharacterIndexAtPoint(source:flight.FlightNode, layout:TextLayoutResult, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Textinput.getTextInputCharacterIndexAtPoint(source, layout, x, y);
#elseif cpp
	return flight._cpp._fn.Textinput.getTextInputCharacterIndexAtPoint(source, layout, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.getTextInputCharacterIndexAtPoint(source, layout, x, y);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputDisplayText(source:Dynamic):String {
	return flight._js._fn.Textinput.getTextInputDisplayText(source);
}
#else
extern inline function getTextInputDisplayText(source:flight.FlightNode):String {
#if hl
	return cast flight._hl._fn.Textinput.getTextInputDisplayText(source);
#elseif cpp
	return cast flight._cpp._fn.Textinput.getTextInputDisplayText(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textinput.getTextInputDisplayText(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputSelectionBeginIndex(source:Dynamic):Int {
	return flight._js._fn.Textinput.getTextInputSelectionBeginIndex(source);
}
#else
extern inline function getTextInputSelectionBeginIndex(source:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Textinput.getTextInputSelectionBeginIndex(source);
#elseif cpp
	return flight._cpp._fn.Textinput.getTextInputSelectionBeginIndex(source);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.getTextInputSelectionBeginIndex(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputSelectionEndIndex(source:Dynamic):Int {
	return flight._js._fn.Textinput.getTextInputSelectionEndIndex(source);
}
#else
extern inline function getTextInputSelectionEndIndex(source:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Textinput.getTextInputSelectionEndIndex(source);
#elseif cpp
	return flight._cpp._fn.Textinput.getTextInputSelectionEndIndex(source);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.getTextInputSelectionEndIndex(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputSelectionRectangles(out:Dynamic, source:Dynamic, layout:TextLayoutResult):Void {
	flight._js._fn.Textinput.getTextInputSelectionRectangles(out, source, layout);
}
#else
extern inline function getTextInputSelectionRectangles(out:Dynamic, source:flight.FlightNode, layout:TextLayoutResult):Void {
#if hl
	flight._hl._fn.Textinput.getTextInputSelectionRectangles(out, source, layout);
#elseif cpp
	flight._cpp._fn.Textinput.getTextInputSelectionRectangles(out, source, layout);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.getTextInputSelectionRectangles(out, source, layout);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextInputSelectionText(source:Dynamic):String {
	return flight._js._fn.Textinput.getTextInputSelectionText(source);
}
#else
extern inline function getTextInputSelectionText(source:flight.FlightNode):String {
#if hl
	return cast flight._hl._fn.Textinput.getTextInputSelectionText(source);
#elseif cpp
	return cast flight._cpp._fn.Textinput.getTextInputSelectionText(source);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textinput.getTextInputSelectionText(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function handleTextInputKeyboard(source:Dynamic, data:InputKeyboardData, options:Null<HandleTextInputKeyboardOptions>):Bool {
	return flight._js._fn.Textinput.handleTextInputKeyboard(source, data, options);
}
#else
extern inline function handleTextInputKeyboard(source:flight.FlightNode, data:InputKeyboardData, options:HandleTextInputKeyboardOptions):Bool {
#if hl
	return flight._hl._fn.Textinput.handleTextInputKeyboard(source, data, options);
#elseif cpp
	return flight._cpp._fn.Textinput.handleTextInputKeyboard(source, data, options);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.handleTextInputKeyboard(source, data, options);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function insertTextInput(source:Dynamic, text:String):Void {
	flight._js._fn.Textinput.insertTextInput(source, text);
}
#else
extern inline function insertTextInput(source:flight.FlightNode, text:String):Void {
#if hl
	flight._hl._fn.Textinput.insertTextInput(source, cast text);
#elseif cpp
	flight._cpp._fn.Textinput.insertTextInput(source, cast text);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.insertTextInput(source, text);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaret(source:Dynamic, index:Int, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaret(source, index, extendSelection);
}
#else
extern inline function moveTextInputCaret(source:flight.FlightNode, index:Int, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaret(source, index, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaret(source, index, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaret(source, index, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaretByWord(source:Dynamic, direction:Int, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaretByWord(source, direction, extendSelection);
}
#else
extern inline function moveTextInputCaretByWord(source:flight.FlightNode, direction:Int, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaretByWord(source, direction, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaretByWord(source, direction, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaretByWord(source, direction, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaretDown(source:Dynamic, layout:Null<TextLayoutResult>, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaretDown(source, layout, extendSelection);
}
#else
extern inline function moveTextInputCaretDown(source:flight.FlightNode, layout:TextLayoutResult, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaretDown(source, layout, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaretDown(source, layout, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaretDown(source, layout, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaretToLineEnd(source:Dynamic, layout:Null<TextLayoutResult>, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaretToLineEnd(source, layout, extendSelection);
}
#else
extern inline function moveTextInputCaretToLineEnd(source:flight.FlightNode, layout:TextLayoutResult, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaretToLineEnd(source, layout, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaretToLineEnd(source, layout, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaretToLineEnd(source, layout, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaretToLineStart(source:Dynamic, layout:Null<TextLayoutResult>, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaretToLineStart(source, layout, extendSelection);
}
#else
extern inline function moveTextInputCaretToLineStart(source:flight.FlightNode, layout:TextLayoutResult, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaretToLineStart(source, layout, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaretToLineStart(source, layout, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaretToLineStart(source, layout, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function moveTextInputCaretUp(source:Dynamic, layout:Null<TextLayoutResult>, extendSelection:Bool):Void {
	flight._js._fn.Textinput.moveTextInputCaretUp(source, layout, extendSelection);
}
#else
extern inline function moveTextInputCaretUp(source:flight.FlightNode, layout:TextLayoutResult, extendSelection:Bool):Void {
#if hl
	flight._hl._fn.Textinput.moveTextInputCaretUp(source, layout, extendSelection);
#elseif cpp
	flight._cpp._fn.Textinput.moveTextInputCaretUp(source, layout, extendSelection);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.moveTextInputCaretUp(source, layout, extendSelection);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function redoTextInput(source:Dynamic):Void {
	flight._js._fn.Textinput.redoTextInput(source);
}
#else
extern inline function redoTextInput(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.redoTextInput(source);
#elseif cpp
	flight._cpp._fn.Textinput.redoTextInput(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.redoTextInput(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function replaceSelectedTextInput(source:Dynamic, text:String, options:Null<ReplaceTextInputOptions>):Void {
	flight._js._fn.Textinput.replaceSelectedTextInput(source, text, options);
}
#else
extern inline function replaceSelectedTextInput(source:flight.FlightNode, text:String, options:ReplaceTextInputOptions):Void {
#if hl
	flight._hl._fn.Textinput.replaceSelectedTextInput(source, cast text, options);
#elseif cpp
	flight._cpp._fn.Textinput.replaceSelectedTextInput(source, cast text, options);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.replaceSelectedTextInput(source, text, options);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function replaceTextInput(source:Dynamic, beginIndex:Int, endIndex:Int, text:String, options:Null<ReplaceTextInputOptions>):Void {
	flight._js._fn.Textinput.replaceTextInput(source, beginIndex, endIndex, text, options);
}
#else
extern inline function replaceTextInput(source:flight.FlightNode, beginIndex:Int, endIndex:Int, text:String, options:ReplaceTextInputOptions):Void {
#if hl
	flight._hl._fn.Textinput.replaceTextInput(source, beginIndex, endIndex, cast text, options);
#elseif cpp
	flight._cpp._fn.Textinput.replaceTextInput(source, beginIndex, endIndex, cast text, options);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.replaceTextInput(source, beginIndex, endIndex, text, options);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function scrollTextInputCaretIntoView(source:Dynamic, layout:TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void {
	flight._js._fn.Textinput.scrollTextInputCaretIntoView(source, layout, viewportWidth, viewportHeight);
}
#else
extern inline function scrollTextInputCaretIntoView(source:flight.FlightNode, layout:TextLayoutResult, viewportWidth:Float, viewportHeight:Float):Void {
#if hl
	flight._hl._fn.Textinput.scrollTextInputCaretIntoView(source, layout, viewportWidth, viewportHeight);
#elseif cpp
	flight._cpp._fn.Textinput.scrollTextInputCaretIntoView(source, layout, viewportWidth, viewportHeight);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.scrollTextInputCaretIntoView(source, layout, viewportWidth, viewportHeight);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectAllTextInput(source:Dynamic):Void {
	flight._js._fn.Textinput.selectAllTextInput(source);
}
#else
extern inline function selectAllTextInput(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.selectAllTextInput(source);
#elseif cpp
	flight._cpp._fn.Textinput.selectAllTextInput(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.selectAllTextInput(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectLineAtTextInputIndex(source:Dynamic, index:Int):Void {
	flight._js._fn.Textinput.selectLineAtTextInputIndex(source, index);
}
#else
extern inline function selectLineAtTextInputIndex(source:flight.FlightNode, index:Int):Void {
#if hl
	flight._hl._fn.Textinput.selectLineAtTextInputIndex(source, index);
#elseif cpp
	flight._cpp._fn.Textinput.selectLineAtTextInputIndex(source, index);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.selectLineAtTextInputIndex(source, index);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectWordAtTextInputIndex(source:Dynamic, index:Int):Void {
	flight._js._fn.Textinput.selectWordAtTextInputIndex(source, index);
}
#else
extern inline function selectWordAtTextInputIndex(source:flight.FlightNode, index:Int):Void {
#if hl
	flight._hl._fn.Textinput.selectWordAtTextInputIndex(source, index);
#elseif cpp
	flight._cpp._fn.Textinput.selectWordAtTextInputIndex(source, index);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.selectWordAtTextInputIndex(source, index);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextInputSelection(source:Dynamic, beginIndex:Int, endIndex:Int):Void {
	flight._js._fn.Textinput.setTextInputSelection(source, beginIndex, endIndex);
}
#else
extern inline function setTextInputSelection(source:flight.FlightNode, beginIndex:Int, endIndex:Int):Void {
#if hl
	flight._hl._fn.Textinput.setTextInputSelection(source, beginIndex, endIndex);
#elseif cpp
	flight._cpp._fn.Textinput.setTextInputSelection(source, beginIndex, endIndex);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.setTextInputSelection(source, beginIndex, endIndex);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function undoTextInput(source:Dynamic):Void {
	flight._js._fn.Textinput.undoTextInput(source);
}
#else
extern inline function undoTextInput(source:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.undoTextInput(source);
#elseif cpp
	flight._cpp._fn.Textinput.undoTextInput(source);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.undoTextInput(source);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextInputManager():Dynamic {
	return flight._js._fn.Textinput.createTextInputManager();
}
#else
extern inline function createTextInputManager():Dynamic {
#if hl
	return flight._hl._fn.Textinput.createTextInputManager();
#elseif cpp
	return flight._cpp._fn.Textinput.createTextInputManager();
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.createTextInputManager();
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function blurTextInput(manager:Dynamic):Void {
	flight._js._fn.Textinput.blurTextInput(manager);
}
#else
extern inline function blurTextInput(manager:Dynamic):Void {
#if hl
	flight._hl._fn.Textinput.blurTextInput(manager);
#elseif cpp
	flight._cpp._fn.Textinput.blurTextInput(manager);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.blurTextInput(manager);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function connectInputToTextInput(input:TextInputSource, manager:Dynamic):TextInputDisposer {
	return flight._js._fn.Textinput.connectInputToTextInput(input, manager);
}
#else
extern inline function connectInputToTextInput(input:TextInputSource, manager:Dynamic):TextInputDisposer {
#if hl
	return flight._hl._fn.Textinput.connectInputToTextInput(input, manager);
#elseif cpp
	return flight._cpp._fn.Textinput.connectInputToTextInput(input, manager);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.connectInputToTextInput(input, manager);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchTextInput(manager:Dynamic, text:String):Bool {
	return flight._js._fn.Textinput.dispatchTextInput(manager, text);
}
#else
extern inline function dispatchTextInput(manager:Dynamic, text:String):Bool {
#if hl
	return flight._hl._fn.Textinput.dispatchTextInput(manager, cast text);
#elseif cpp
	return flight._cpp._fn.Textinput.dispatchTextInput(manager, cast text);
#elseif (js && flight_esm)
	return flight._js._fn.Textinput.dispatchTextInput(manager, text);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchTextInputPointerDown(manager:Dynamic, target:Dynamic, x:Float, y:Float, extend:Bool, clickCount:Int):Void {
	flight._js._fn.Textinput.dispatchTextInputPointerDown(manager, target, x, y, extend, clickCount);
}
#else
extern inline function dispatchTextInputPointerDown(manager:Dynamic, target:flight.FlightNode, x:Float, y:Float, extend:Bool, clickCount:Int):Void {
#if hl
	flight._hl._fn.Textinput.dispatchTextInputPointerDown(manager, target, x, y, extend, clickCount);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchTextInputPointerDown(manager, target, x, y, extend, clickCount);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchTextInputPointerDown(manager, target, x, y, extend, clickCount);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchTextInputPointerMove(manager:Dynamic, x:Float, y:Float):Void {
	flight._js._fn.Textinput.dispatchTextInputPointerMove(manager, x, y);
}
#else
extern inline function dispatchTextInputPointerMove(manager:Dynamic, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Textinput.dispatchTextInputPointerMove(manager, x, y);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchTextInputPointerMove(manager, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchTextInputPointerMove(manager, x, y);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchTextInputWheel(manager:Dynamic, deltaLines:Float):Void {
	flight._js._fn.Textinput.dispatchTextInputWheel(manager, deltaLines);
}
#else
extern inline function dispatchTextInputWheel(manager:Dynamic, deltaLines:Float):Void {
#if hl
	flight._hl._fn.Textinput.dispatchTextInputWheel(manager, deltaLines);
#elseif cpp
	flight._cpp._fn.Textinput.dispatchTextInputWheel(manager, deltaLines);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.dispatchTextInputWheel(manager, deltaLines);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusTextInput(manager:Dynamic, target:Dynamic):Void {
	flight._js._fn.Textinput.focusTextInput(manager, target);
}
#else
extern inline function focusTextInput(manager:Dynamic, target:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Textinput.focusTextInput(manager, target);
#elseif cpp
	flight._cpp._fn.Textinput.focusTextInput(manager, target);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.focusTextInput(manager, target);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSelectableRichTextManagerRef(ptr:SelectableRichTextManager):Void {
	flight._js._fn.Textinput.freeSelectableRichTextManagerRef(ptr);
}
#else
extern inline function freeSelectableRichTextManagerRef(ptr:SelectableRichTextManager):Void {
#if hl
	flight._hl._fn.Textinput.freeSelectableRichTextManagerRef(ptr);
#elseif cpp
	flight._cpp._fn.Textinput.freeSelectableRichTextManagerRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.freeSelectableRichTextManagerRef(ptr);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextInputManagerRef(ptr:TextInputManager):Void {
	flight._js._fn.Textinput.freeTextInputManagerRef(ptr);
}
#else
extern inline function freeTextInputManagerRef(ptr:TextInputManager):Void {
#if hl
	flight._hl._fn.Textinput.freeTextInputManagerRef(ptr);
#elseif cpp
	flight._cpp._fn.Textinput.freeTextInputManagerRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.freeTextInputManagerRef(ptr);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextInputDisposer(ptr:TextInputDisposer):Void {
	flight._js._fn.Textinput.freeTextInputDisposer(ptr);
}
#else
extern inline function freeTextInputDisposer(ptr:TextInputDisposer):Void {
#if hl
	flight._hl._fn.Textinput.freeTextInputDisposer(ptr);
#elseif cpp
	flight._cpp._fn.Textinput.freeTextInputDisposer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textinput.freeTextInputDisposer(ptr);
#else
	#error "flight.Textinput: no backend for this target."
#end
}
#end
