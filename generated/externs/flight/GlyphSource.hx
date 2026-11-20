package flight;

#if hl

typedef GlyphSource = flight._hl.GlyphSource;

#elseif cpp

typedef GlyphSource = flight._cpp.GlyphSource;

#elseif (js && flight_esm)

typedef GlyphSource = flight._js.GlyphSource;

#elseif js

#error "flight.GlyphSource on js requires flight_esm."

#else

#error "flight.GlyphSource: no backend for this target."

#end
