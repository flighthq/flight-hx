package flight.esm.types.textlayout_contract;

#if (js && flight_esm)
typedef HostTextShaperCapability = flight.esm.types.textshaper.Types.HostTextShaperCapability;

typedef RichTextContent = flight.esm.types.textlayout.Types.RichTextContent;

typedef TextAutoSize = flight.esm.types.textlayout.Types.TextAutoSize;

typedef TextBoundsSpec = flight.esm.types.textlayout.Types.TextBoundsSpec;

typedef TextDirection = flight.esm.types.textshaper.Types.TextDirection;

typedef TextFormat = flight.esm.types.textformat.Types.TextFormat;

typedef TextFormatAlign = flight.esm.types.textformat.Types.TextFormatAlign;

typedef TextFormatListMarker = flight.esm.types.textformat.Types.TextFormatListMarker;

typedef TextFormatRangeRaw = flight.esm.types.textformat.Types.TextFormatRangeRaw;

typedef TextJustification = flight.esm.types.textlayout.Types.TextJustification;

typedef TextLayoutGroup = flight.esm.types.textlayout.Types.TextLayoutGroup;

typedef TextLayoutParams = flight.esm.types.textlayout.Types.TextLayoutParams;

typedef TextLayoutResult = flight.esm.types.textlayout.Types.TextLayoutResult;

typedef TextLineMetrics = flight.esm.types.textlayout.Types.TextLineMetrics;

typedef TextMeasureFunction = flight.esm.types.textshaper.Types.TextMeasureFunction;

typedef TextMetrics = flight.esm.types.textlayout.Types.TextMetrics;

typedef TextSelectionRectangle = flight.esm.types.textlayout.Types.TextSelectionRectangle;

typedef TextVerticalAlign = flight.esm.types.textlayout.Types.TextVerticalAlign;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
