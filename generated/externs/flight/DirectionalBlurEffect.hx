package flight;

#if hl

typedef DirectionalBlurEffect = flight._hl.DirectionalBlurEffect;

#elseif cpp

typedef DirectionalBlurEffect = flight._cpp.DirectionalBlurEffect;

#elseif (js && flight_esm)

typedef DirectionalBlurEffect = flight._js.DirectionalBlurEffect;

#elseif js

#error "flight.DirectionalBlurEffect on js requires flight_esm."

#else

#error "flight.DirectionalBlurEffect: no backend for this target."

#end
