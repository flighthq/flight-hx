package flight.esm.types.bitmaptext_contract;

#if (js && flight_esm)
typedef BitmapText = flight.esm.types.bitmaptext.Types.BitmapText;

typedef BitmapTextAlign = flight.esm.types.bitmaptext.Types.BitmapTextAlign;

typedef BitmapTextData = flight.esm.types.bitmaptext.Types.BitmapTextData;

typedef BitmapTextMissingGlyphs = flight.esm.types.bitmaptext.Types.BitmapTextMissingGlyphs;

typedef BitmapTextOptions = flight.esm.types.bitmaptext.Types.BitmapTextOptions;

typedef BitmapTextPage = flight.esm.types.bitmaptext.Types.BitmapTextPage;

typedef BitmapTextRuntime = flight.esm.types.bitmaptext.Types.BitmapTextRuntime;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
