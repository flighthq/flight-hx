package flight;

#if hl

typedef BitmapFontGlyphData = flight._hl.BitmapFontGlyphData;

#elseif cpp

typedef BitmapFontGlyphData = flight._cpp.BitmapFontGlyphData;

#elseif (js && flight_esm)

typedef BitmapFontGlyphData = flight._js.BitmapFontGlyphData;

#elseif js

#error "flight.BitmapFontGlyphData on js requires flight_esm."

#else

#error "flight.BitmapFontGlyphData: no backend for this target."

#end
