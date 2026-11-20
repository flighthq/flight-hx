package flight;

#if hl

typedef GlyphAtlasShelf = flight._hl.GlyphAtlasShelf;

#elseif cpp

typedef GlyphAtlasShelf = flight._cpp.GlyphAtlasShelf;

#elseif (js && flight_esm)

typedef GlyphAtlasShelf = flight._js.GlyphAtlasShelf;

#elseif js

#error "flight.GlyphAtlasShelf on js requires flight_esm."

#else

#error "flight.GlyphAtlasShelf: no backend for this target."

#end
