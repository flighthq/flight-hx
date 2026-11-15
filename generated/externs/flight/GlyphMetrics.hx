package flight;

#if hl

typedef GlyphMetrics = flight._hl.GlyphMetrics;

#elseif cpp

typedef GlyphMetrics = flight._cpp.GlyphMetrics;

#elseif (js && flight_esm)

typedef GlyphMetrics = flight._js.GlyphMetrics;

#elseif js

#error "flight.GlyphMetrics on js requires flight_esm."

#else

#error "flight.GlyphMetrics: no backend for this target."

#end
