package flight;

#if hl

typedef Scale9SpriteData = flight._hl.Scale9SpriteData;

#elseif cpp

typedef Scale9SpriteData = flight._cpp.Scale9SpriteData;

#elseif (js && flight_esm)

typedef Scale9SpriteData = flight._js.Scale9SpriteData;

#elseif js

#error "flight.Scale9SpriteData on js requires flight_esm."

#else

#error "flight.Scale9SpriteData: no backend for this target."

#end
