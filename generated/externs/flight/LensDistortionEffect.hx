package flight;

#if hl

typedef LensDistortionEffect = flight._hl.LensDistortionEffect;

#elseif cpp

typedef LensDistortionEffect = flight._cpp.LensDistortionEffect;

#elseif (js && flight_esm)

typedef LensDistortionEffect = flight._js.LensDistortionEffect;

#elseif js

#error "flight.LensDistortionEffect on js requires flight_esm."

#else

#error "flight.LensDistortionEffect: no backend for this target."

#end
