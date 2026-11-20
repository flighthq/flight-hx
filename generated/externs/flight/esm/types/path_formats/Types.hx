package flight.esm.types.path_formats;

#if (js && flight_esm)
typedef SvgPathDataExplanation = { position:Float, reason:String };

typedef SvgPathDataFormatOptions = { ?precision:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
