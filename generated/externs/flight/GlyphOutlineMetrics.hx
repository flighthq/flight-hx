package flight;

#if hl

typedef GlyphOutlineMetrics = flight._hl.GlyphOutlineMetrics;

#elseif cpp

typedef GlyphOutlineMetrics = flight._cpp.GlyphOutlineMetrics;

#elseif (js && flight_esm)

typedef GlyphOutlineMetrics = flight._js.GlyphOutlineMetrics;

#elseif js

#error "flight.GlyphOutlineMetrics on js requires flight_esm."

#else

#error "flight.GlyphOutlineMetrics: no backend for this target."

#end
