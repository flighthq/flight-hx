package flight;

#if hl

typedef Sprite = flight._hl.Sprite;

#elseif cpp

typedef Sprite = flight._cpp.Sprite;

#elseif (js && flight_esm)

typedef Sprite = flight._js.Sprite;

#elseif js

#error "flight.Sprite on js requires flight_esm."

#else

#error "flight.Sprite: no backend for this target."

#end
