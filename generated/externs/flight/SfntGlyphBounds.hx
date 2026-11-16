package flight;

#if hl

typedef SfntGlyphBounds = flight._hl.SfntGlyphBounds;

#elseif cpp

typedef SfntGlyphBounds = flight._cpp.SfntGlyphBounds;

#elseif (js && flight_esm)

typedef SfntGlyphBounds = flight._js.SfntGlyphBounds;

#elseif js

#error "flight.SfntGlyphBounds on js requires flight_esm."

#else

#error "flight.SfntGlyphBounds: no backend for this target."

#end
