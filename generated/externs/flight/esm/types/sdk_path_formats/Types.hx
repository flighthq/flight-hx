package flight.esm.types.sdk_path_formats;

#if (js && flight_esm)
typedef SvgPathDataExplanation = flight.esm.types.path_formats.Types.SvgPathDataExplanation;

typedef SvgPathDataFormatOptions = flight.esm.types.path_formats.Types.SvgPathDataFormatOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
