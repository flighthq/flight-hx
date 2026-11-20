package flight.esm.types.textinput_contract;

#if (js && flight_esm)
typedef HandleTextInputKeyboardOptions = { ?clipboardText:Null<String>, ?layout:Null<flight.esm.types.textlayout.Types.TextLayoutResult>, ?onCopy:Null<flight.esm.types.textinput_contract.Types.TextInputCopyCallback> };

typedef ReplaceTextInputOptions = { ?applyInputRules:Null<Bool>, ?mergeKind:Null<String>, ?skipHistory:Null<Bool> };

typedef SelectableRichTextManagerRaw = { focused:Null<flight.esm.types.text.Types.RichText> };

typedef TextInputCopyCallback = ((arg0:String) -> Void);

typedef TextInputDisposer = (() -> Void);

typedef TextInputEditRecord = { caretIndexAfter:Float, caretIndexBefore:Float, mergeKind:Null<String>, selectionIndexAfter:Float, selectionIndexBefore:Float, textAfter:String, textBefore:String };

typedef TextInputManagerRaw = { enabled:Bool, focused:Null<flight.esm.types.text.Types.RichText> };

typedef TextInputSource = { onKeyDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onTextInput:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputTextData> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
