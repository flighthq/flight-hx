package flight;

#if hl

typedef GlyphRasterizeFontWeightString = flight._hl.GlyphRasterizeFontWeightString;

#elseif cpp

typedef GlyphRasterizeFontWeightString = flight._cpp.GlyphRasterizeFontWeightString;

#elseif (js && flight_esm)

typedef GlyphRasterizeFontWeightString = flight._js.GlyphRasterizeFontWeightString;

#elseif js

#error "flight.GlyphRasterizeFontWeightString on js requires flight_esm."

#else

#error "flight.GlyphRasterizeFontWeightString: no backend for this target."

#end
