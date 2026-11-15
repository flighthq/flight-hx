package flight;

#if hl

typedef GlyphRasterizeFontWeightNumber = flight._hl.GlyphRasterizeFontWeightNumber;

#elseif cpp

typedef GlyphRasterizeFontWeightNumber = flight._cpp.GlyphRasterizeFontWeightNumber;

#elseif (js && flight_esm)

typedef GlyphRasterizeFontWeightNumber = flight._js.GlyphRasterizeFontWeightNumber;

#elseif js

#error "flight.GlyphRasterizeFontWeightNumber on js requires flight_esm."

#else

#error "flight.GlyphRasterizeFontWeightNumber: no backend for this target."

#end
