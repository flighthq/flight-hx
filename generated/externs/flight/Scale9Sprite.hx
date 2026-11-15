package flight;

#if hl

typedef Scale9Sprite = flight._hl.Scale9Sprite;

#elseif cpp

typedef Scale9Sprite = flight._cpp.Scale9Sprite;

#elseif (js && flight_esm)

typedef Scale9Sprite = flight._js.Scale9Sprite;

#elseif js

#error "flight.Scale9Sprite on js requires flight_esm."

#else

#error "flight.Scale9Sprite: no backend for this target."

#end
