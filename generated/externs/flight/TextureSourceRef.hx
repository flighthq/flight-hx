package flight;

#if hl

typedef TextureSourceRef = flight._hl.TextureSourceRef;

#elseif cpp

typedef TextureSourceRef = flight._cpp.TextureSourceRef;

#elseif (js && flight_esm)

typedef TextureSourceRef = flight._js.TextureSourceRef;

#elseif js

#error "flight.TextureSourceRef on js requires flight_esm."

#else

#error "flight.TextureSourceRef: no backend for this target."

#end
