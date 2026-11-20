package flight;

#if hl

typedef RadialBlurEffect = flight._hl.RadialBlurEffect;

#elseif cpp

typedef RadialBlurEffect = flight._cpp.RadialBlurEffect;

#elseif (js && flight_esm)

typedef RadialBlurEffect = flight._js.RadialBlurEffect;

#elseif js

#error "flight.RadialBlurEffect on js requires flight_esm."

#else

#error "flight.RadialBlurEffect: no backend for this target."

#end
