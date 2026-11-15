package flight;

#if hl

typedef TextureSourceKind = flight._hl.TextureSourceKind;

#elseif cpp

typedef TextureSourceKind = flight._cpp.TextureSourceKind;

#elseif (js && flight_esm)

typedef TextureSourceKind = flight._js.TextureSourceKind;

#elseif js

#error "flight.TextureSourceKind on js requires flight_esm."

#else

#error "flight.TextureSourceKind: no backend for this target."

#end
