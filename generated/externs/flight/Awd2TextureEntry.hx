package flight;

#if hl

typedef Awd2TextureEntry = flight._hl.Awd2TextureEntry;

#elseif cpp

typedef Awd2TextureEntry = flight._cpp.Awd2TextureEntry;

#elseif (js && flight_esm)

typedef Awd2TextureEntry = flight._js.Awd2TextureEntry;

#elseif js

#error "flight.Awd2TextureEntry on js requires flight_esm."

#else

#error "flight.Awd2TextureEntry: no backend for this target."

#end
