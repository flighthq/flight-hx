package flight;

#if hl

typedef AsepriteNamedFrame = flight._hl.AsepriteNamedFrame;

#elseif cpp

typedef AsepriteNamedFrame = flight._cpp.AsepriteNamedFrame;

#elseif (js && flight_esm)

typedef AsepriteNamedFrame = flight._js.AsepriteNamedFrame;

#elseif js

#error "flight.AsepriteNamedFrame on js requires flight_esm."

#else

#error "flight.AsepriteNamedFrame: no backend for this target."

#end
