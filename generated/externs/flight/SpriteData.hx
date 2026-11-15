package flight;

#if hl

typedef SpriteData = flight._hl.SpriteData;

#elseif cpp

typedef SpriteData = flight._cpp.SpriteData;

#elseif (js && flight_esm)

typedef SpriteData = flight._js.SpriteData;

#elseif js

#error "flight.SpriteData on js requires flight_esm."

#else

#error "flight.SpriteData: no backend for this target."

#end
