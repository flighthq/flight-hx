package flight;

#if hl

typedef GlyphOutlineSource = flight._hl.GlyphOutlineSource;

#elseif cpp

typedef GlyphOutlineSource = flight._cpp.GlyphOutlineSource;

#elseif (js && flight_esm)

typedef GlyphOutlineSource = flight._js.GlyphOutlineSource;

#elseif js

#error "flight.GlyphOutlineSource on js requires flight_esm."

#else

#error "flight.GlyphOutlineSource: no backend for this target."

#end
