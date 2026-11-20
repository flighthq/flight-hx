package flight;

#if hl

typedef ShapedGlyph = flight._hl.ShapedGlyph;

#elseif cpp

typedef ShapedGlyph = flight._cpp.ShapedGlyph;

#elseif (js && flight_esm)

typedef ShapedGlyph = flight._js.ShapedGlyph;

#elseif js

#error "flight.ShapedGlyph on js requires flight_esm."

#else

#error "flight.ShapedGlyph: no backend for this target."

#end
