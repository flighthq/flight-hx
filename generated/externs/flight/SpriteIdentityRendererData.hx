package flight;

#if hl

typedef SpriteIdentityRendererData = flight._hl.SpriteIdentityRendererData;

#elseif cpp

typedef SpriteIdentityRendererData = flight._cpp.SpriteIdentityRendererData;

#elseif (js && flight_esm)

typedef SpriteIdentityRendererData = flight._js.SpriteIdentityRendererData;

#elseif js

#error "flight.SpriteIdentityRendererData on js requires flight_esm."

#else

#error "flight.SpriteIdentityRendererData: no backend for this target."

#end
