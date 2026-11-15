package flight;

#if hl

typedef FrameTick = flight._hl.FrameTick;

#elseif cpp

typedef FrameTick = flight._cpp.FrameTick;

#elseif (js && flight_esm)

typedef FrameTick = flight._js.FrameTick;

#elseif js

#error "flight.FrameTick on js requires flight_esm."

#else

#error "flight.FrameTick: no backend for this target."

#end
