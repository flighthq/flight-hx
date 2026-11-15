package flight;

#if hl

typedef AsepriteLayer = flight._hl.AsepriteLayer;

#elseif cpp

typedef AsepriteLayer = flight._cpp.AsepriteLayer;

#elseif (js && flight_esm)

typedef AsepriteLayer = flight._js.AsepriteLayer;

#elseif js

#error "flight.AsepriteLayer on js requires flight_esm."

#else

#error "flight.AsepriteLayer: no backend for this target."

#end
