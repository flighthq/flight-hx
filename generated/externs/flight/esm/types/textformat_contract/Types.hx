package flight.esm.types.textformat_contract;

#if (js && flight_esm)
typedef FontVariation = flight.esm.types.textformat.Types.FontVariation;

typedef TextFormat = flight.esm.types.textformat.Types.TextFormat;

typedef TextFormatAlign = flight.esm.types.textformat.Types.TextFormatAlign;

typedef TextFormatListMarker = flight.esm.types.textformat.Types.TextFormatListMarker;

typedef TextFormatRange = flight.esm.types.textformat.Types.TextFormatRange;

typedef TextFormatRangeRaw = flight.esm.types.textformat.Types.TextFormatRangeRaw;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
