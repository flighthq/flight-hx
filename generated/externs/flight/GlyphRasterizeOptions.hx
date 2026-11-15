package flight;

#if hl

typedef GlyphRasterizeOptions = flight._hl.GlyphRasterizeOptions;

#elseif cpp

typedef GlyphRasterizeOptions = flight._cpp.GlyphRasterizeOptions;

#elseif (js && flight_esm)

typedef GlyphRasterizeOptions = flight._js.GlyphRasterizeOptions;

#elseif js

#error "flight.GlyphRasterizeOptions on js requires flight_esm."

#else

#error "flight.GlyphRasterizeOptions: no backend for this target."

#end
