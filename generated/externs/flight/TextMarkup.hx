package flight;

inline function resolveMarkupHexColor(value:String):Int {
#if hl
	return flight._hl._fn.TextMarkup.resolveMarkupHexColor(cast value);
#elseif cpp
	return flight._cpp._fn.TextMarkup.resolveMarkupHexColor(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.TextMarkup.resolveMarkupHexColor(value);
#else
	#error "flight.TextMarkup: no backend for this target."
#end
}
inline function formatTextMarkup(content:RichTextContent):String {
#if hl
	return cast flight._hl._fn.TextMarkup.formatTextMarkup(content);
#elseif cpp
	return cast flight._cpp._fn.TextMarkup.formatTextMarkup(content);
#elseif (js && flight_esm)
	return cast flight._js._fn.TextMarkup.formatTextMarkup(content);
#else
	#error "flight.TextMarkup: no backend for this target."
#end
}
