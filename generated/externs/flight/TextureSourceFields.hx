package flight;

#if hl

typedef TextureSourceFields = flight._hl.TextureSourceFields;

#elseif cpp

typedef TextureSourceFields = flight._cpp.TextureSourceFields;

#elseif (js && flight_esm)

typedef TextureSourceFields = flight._js.TextureSourceFields;

#elseif js

#error "flight.TextureSourceFields on js requires flight_esm."

#else

#error "flight.TextureSourceFields: no backend for this target."

#end
