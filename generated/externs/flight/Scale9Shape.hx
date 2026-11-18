package flight;

#if hl

typedef Scale9Shape = flight._hl.Scale9Shape;

#elseif cpp

typedef Scale9Shape = flight._cpp.Scale9Shape;

#elseif (js && flight_esm)

typedef Scale9Shape = flight._js.Scale9Shape;

#elseif js

#error "flight.Scale9Shape on js requires flight_esm."

#else

#error "flight.Scale9Shape: no backend for this target."

#end
