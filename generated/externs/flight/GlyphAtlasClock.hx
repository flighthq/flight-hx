package flight;

#if hl

typedef GlyphAtlasClock = flight._hl.GlyphAtlasClock;

#elseif cpp

typedef GlyphAtlasClock = flight._cpp.GlyphAtlasClock;

#elseif (js && flight_esm)

typedef GlyphAtlasClock = flight._js.GlyphAtlasClock;

#elseif js

#error "flight.GlyphAtlasClock on js requires flight_esm."

#else

#error "flight.GlyphAtlasClock: no backend for this target."

#end
