package flight;

#if hl

typedef GlyphEntry = flight._hl.GlyphEntry;

#elseif cpp

typedef GlyphEntry = flight._cpp.GlyphEntry;

#elseif (js && flight_esm)

typedef GlyphEntry = flight._js.GlyphEntry;

#elseif js

#error "flight.GlyphEntry on js requires flight_esm."

#else

#error "flight.GlyphEntry: no backend for this target."

#end
