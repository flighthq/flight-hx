package flight;

#if hl

typedef TextureAtlasGuardState = flight._hl.TextureAtlasGuardState;

#elseif cpp

typedef TextureAtlasGuardState = flight._cpp.TextureAtlasGuardState;

#elseif (js && flight_esm)

typedef TextureAtlasGuardState = flight._js.TextureAtlasGuardState;

#elseif js

#error "flight.TextureAtlasGuardState on js requires flight_esm."

#else

#error "flight.TextureAtlasGuardState: no backend for this target."

#end
