package flight;

#if hl

typedef LensFlareEffect = flight._hl.LensFlareEffect;

#elseif cpp

typedef LensFlareEffect = flight._cpp.LensFlareEffect;

#elseif (js && flight_esm)

typedef LensFlareEffect = flight._js.LensFlareEffect;

#elseif js

#error "flight.LensFlareEffect on js requires flight_esm."

#else

#error "flight.LensFlareEffect: no backend for this target."

#end
