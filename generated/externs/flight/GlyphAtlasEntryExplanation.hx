package flight;

#if hl

typedef GlyphAtlasEntryExplanation = flight._hl.GlyphAtlasEntryExplanation;

#elseif cpp

typedef GlyphAtlasEntryExplanation = flight._cpp.GlyphAtlasEntryExplanation;

#elseif (js && flight_esm)

typedef GlyphAtlasEntryExplanation = flight._js.GlyphAtlasEntryExplanation;

#elseif js

#error "flight.GlyphAtlasEntryExplanation on js requires flight_esm."

#else

#error "flight.GlyphAtlasEntryExplanation: no backend for this target."

#end
