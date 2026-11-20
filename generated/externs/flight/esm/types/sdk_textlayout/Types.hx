package flight.esm.types.sdk_textlayout;

#if (js && flight_esm)
typedef RichTextContent = flight.esm.types.textlayout.Types.RichTextContent;

typedef TextAutoSize = flight.esm.types.textlayout.Types.TextAutoSize;

typedef TextBoundsSpec = flight.esm.types.textlayout.Types.TextBoundsSpec;

typedef TextJustification = flight.esm.types.textlayout.Types.TextJustification;

typedef TextLayoutGroup = flight.esm.types.textlayout.Types.TextLayoutGroup;

typedef TextLayoutParams = flight.esm.types.textlayout.Types.TextLayoutParams;

typedef TextLayoutResult = flight.esm.types.textlayout.Types.TextLayoutResult;

typedef TextLineMetrics = flight.esm.types.textlayout.Types.TextLineMetrics;

typedef TextMetrics = flight.esm.types.textlayout.Types.TextMetrics;

typedef TextSelectionRectangle = flight.esm.types.textlayout.Types.TextSelectionRectangle;

typedef TextVerticalAlign = flight.esm.types.textlayout.Types.TextVerticalAlign;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
