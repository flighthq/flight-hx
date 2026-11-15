package flight;

#if hl

typedef BitmapFontGlyphExplanation = flight._hl.BitmapFontGlyphExplanation;

#elseif cpp

typedef BitmapFontGlyphExplanation = flight._cpp.BitmapFontGlyphExplanation;

#elseif (js && flight_esm)

typedef BitmapFontGlyphExplanation = flight._js.BitmapFontGlyphExplanation;

#elseif js

#error "flight.BitmapFontGlyphExplanation on js requires flight_esm."

#else

#error "flight.BitmapFontGlyphExplanation: no backend for this target."

#end
