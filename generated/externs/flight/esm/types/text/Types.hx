package flight.esm.types.text;

#if (js && flight_esm)
typedef NativeText = { data:flight.esm.types.text.Types.NativeTextData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef NativeTextData = { autoSize:flight.esm.types.textlayout.Types.TextAutoSize, height:Float, style:flight.esm.types.text.Types.NativeTextStyle, text:String, verticalAlign:flight.esm.types.textlayout.Types.TextVerticalAlign, width:Float };

typedef NativeTextStyle = { ?align:Null<String>, ?bold:Null<Bool>, ?color:Null<Float>, ?font:Null<String>, ?italic:Null<Bool>, ?leading:Null<Float>, ?size:Null<Float> };

typedef RichText = { data:flight.esm.types.text.Types.RichTextData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef RichTextData = { background:Bool, backgroundColor:Float, border:Bool, borderColor:Float, condenseWhite:Bool, defaultTextFormat:flight.esm.types.textformat.Types.TextFormat, maxChars:Float, mouseWheelEnabled:Bool, multiline:Bool, scrollH:Float, scrollV:Float, selectable:Bool, textColor:Float, textFormatRanges:Array<flight.esm.types.textformat.Types.TextFormatRangeRaw>, wordWrap:Bool, autoSize:flight.esm.types.textlayout.Types.TextAutoSize, height:Float, text:String, textFormat:flight.esm.types.textformat.Types.TextFormat, verticalAlign:flight.esm.types.textlayout.Types.TextVerticalAlign, width:Float };

typedef TextFieldChangeEvent = { previousText:String, text:String };

typedef TextFieldLinkEvent = { url:String, x:Float, y:Float };

typedef TextFieldScrollEvent = { previousScrollH:Float, previousScrollV:Float, scrollH:Float, scrollV:Float };

typedef TextFieldSignals = { onTextFieldChange:flight.esm.types.signals.Types.Signal<flight.esm.types.text.Types.TextFieldChangeEvent>, onTextFieldLink:flight.esm.types.signals.Types.Signal<flight.esm.types.text.Types.TextFieldLinkEvent>, onTextFieldScroll:flight.esm.types.signals.Types.Signal<flight.esm.types.text.Types.TextFieldScrollEvent> };

typedef TextInputHistoryEntry = { caretIndexAfter:Float, caretIndexBefore:Float, mergeKind:Null<String>, selectionIndexAfter:Float, selectionIndexBefore:Float, textAfter:String, textBefore:String };

typedef TextInputOptions = { ?alwaysShowSelection:Null<Bool>, ?caretColor:Null<Float>, ?caretWidth:Null<Float>, ?displayAsPassword:Null<Bool>, ?historyLimit:Null<Float>, ?passwordCharacter:Null<String>, ?restrict:Null<String>, ?selectionAlpha:Null<Float>, ?selectionColor:Null<Float> };

typedef TextInputState = { alwaysShowSelection:Bool, caretColor:Float, caretIndex:Float, caretWidth:Float, desiredCaretX:Float, displayAsPassword:Bool, focused:Bool, history:Array<flight.esm.types.text.Types.TextInputHistoryEntry>, historyIndex:Float, historyLimit:Float, passwordCharacter:String, restrict:String, selectionAlpha:Float, selectionColor:Float, selectionIndex:Float };

typedef TextLabel = { data:flight.esm.types.text.Types.TextLabelData, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, blendMode:Null<String>, clip:Null<flight.esm.types.clip.Types.ClipRegion>, material:Null<flight.esm.types.materials_contract.Types.Material2D>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float };

typedef TextLabelContentExplanation = { agreement:Bool, liveString:String, rasterizedString:Null<String>, revision:Float };

typedef TextLabelData = { autoSize:flight.esm.types.textlayout.Types.TextAutoSize, height:Float, text:String, textFormat:flight.esm.types.textformat.Types.TextFormat, verticalAlign:flight.esm.types.textlayout.Types.TextVerticalAlign, width:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
