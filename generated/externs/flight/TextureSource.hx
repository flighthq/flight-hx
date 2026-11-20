package flight;

#if hl

typedef TextureSource = flight._hl.TextureSource;

#elseif cpp

typedef TextureSource = flight._cpp.TextureSource;

#elseif (js && flight_esm)

typedef TextureSource = flight._js.TextureSource;

#elseif js

#error "flight.TextureSource on js requires flight_esm."

#else

#error "flight.TextureSource: no backend for this target."

#end
