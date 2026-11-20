package flight.esm.types.sdk_text;

#if (js && flight_esm)
typedef NativeText = flight.esm.types.text.Types.NativeText;

typedef NativeTextData = flight.esm.types.text.Types.NativeTextData;

typedef NativeTextStyle = flight.esm.types.text.Types.NativeTextStyle;

typedef RichText = flight.esm.types.text.Types.RichText;

typedef RichTextData = flight.esm.types.text.Types.RichTextData;

typedef TextFieldChangeEvent = flight.esm.types.text.Types.TextFieldChangeEvent;

typedef TextFieldLinkEvent = flight.esm.types.text.Types.TextFieldLinkEvent;

typedef TextFieldScrollEvent = flight.esm.types.text.Types.TextFieldScrollEvent;

typedef TextFieldSignals = flight.esm.types.text.Types.TextFieldSignals;

typedef TextInputHistoryEntry = flight.esm.types.text.Types.TextInputHistoryEntry;

typedef TextInputOptions = flight.esm.types.text.Types.TextInputOptions;

typedef TextInputState = flight.esm.types.text.Types.TextInputState;

typedef TextLabel = flight.esm.types.text.Types.TextLabel;

typedef TextLabelContentExplanation = flight.esm.types.text.Types.TextLabelContentExplanation;

typedef TextLabelData = flight.esm.types.text.Types.TextLabelData;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
