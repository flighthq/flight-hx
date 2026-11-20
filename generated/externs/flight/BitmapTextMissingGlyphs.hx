package flight;

#if hl

typedef BitmapTextMissingGlyphs = flight._hl.BitmapTextMissingGlyphs;

#elseif cpp

typedef BitmapTextMissingGlyphs = flight._cpp.BitmapTextMissingGlyphs;

#elseif (js && flight_esm)

typedef BitmapTextMissingGlyphs = flight._js.BitmapTextMissingGlyphs;

#elseif js

#error "flight.BitmapTextMissingGlyphs on js requires flight_esm."

#else

#error "flight.BitmapTextMissingGlyphs: no backend for this target."

#end
