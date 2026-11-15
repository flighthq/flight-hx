package flight;

#if hl

typedef BlurEffect = flight._hl.BlurEffect;

#elseif cpp

typedef BlurEffect = flight._cpp.BlurEffect;

#elseif (js && flight_esm)

typedef BlurEffect = flight._js.BlurEffect;

#elseif js

#error "flight.BlurEffect on js requires flight_esm."

#else

#error "flight.BlurEffect: no backend for this target."

#end
