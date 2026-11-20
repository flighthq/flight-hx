package flight;

#if hl

typedef GlyphAtlasEntryGuardNotice = flight._hl.GlyphAtlasEntryGuardNotice;

#elseif cpp

typedef GlyphAtlasEntryGuardNotice = flight._cpp.GlyphAtlasEntryGuardNotice;

#elseif (js && flight_esm)

typedef GlyphAtlasEntryGuardNotice = flight._js.GlyphAtlasEntryGuardNotice;

#elseif js

#error "flight.GlyphAtlasEntryGuardNotice on js requires flight_esm."

#else

#error "flight.GlyphAtlasEntryGuardNotice: no backend for this target."

#end
