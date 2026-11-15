package flight;

#if hl

typedef GlyphRasterizedBitmap = flight._hl.GlyphRasterizedBitmap;

#elseif cpp

typedef GlyphRasterizedBitmap = flight._cpp.GlyphRasterizedBitmap;

#elseif (js && flight_esm)

typedef GlyphRasterizedBitmap = flight._js.GlyphRasterizedBitmap;

#elseif js

#error "flight.GlyphRasterizedBitmap on js requires flight_esm."

#else

#error "flight.GlyphRasterizedBitmap: no backend for this target."

#end
