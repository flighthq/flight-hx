package flight;

#if hl

typedef GlyphAtlasRuntime = flight._hl.GlyphAtlasRuntime;

#elseif cpp

typedef GlyphAtlasRuntime = flight._cpp.GlyphAtlasRuntime;

#elseif (js && flight_esm)

typedef GlyphAtlasRuntime = flight._js.GlyphAtlasRuntime;

#elseif js

#error "flight.GlyphAtlasRuntime on js requires flight_esm."

#else

#error "flight.GlyphAtlasRuntime: no backend for this target."

#end
