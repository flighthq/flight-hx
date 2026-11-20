package flight;

#if hl

typedef GlyphAtlasOptions = flight._hl.GlyphAtlasOptions;

#elseif cpp

typedef GlyphAtlasOptions = flight._cpp.GlyphAtlasOptions;

#elseif (js && flight_esm)

typedef GlyphAtlasOptions = flight._js.GlyphAtlasOptions;

#elseif js

#error "flight.GlyphAtlasOptions on js requires flight_esm."

#else

#error "flight.GlyphAtlasOptions: no backend for this target."

#end
