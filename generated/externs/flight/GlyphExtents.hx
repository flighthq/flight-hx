package flight;

#if hl

typedef GlyphExtents = flight._hl.GlyphExtents;

#elseif cpp

typedef GlyphExtents = flight._cpp.GlyphExtents;

#elseif (js && flight_esm)

typedef GlyphExtents = flight._js.GlyphExtents;

#elseif js

#error "flight.GlyphExtents on js requires flight_esm."

#else

#error "flight.GlyphExtents: no backend for this target."

#end
