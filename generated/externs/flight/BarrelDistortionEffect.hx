package flight;

#if hl

typedef BarrelDistortionEffect = flight._hl.BarrelDistortionEffect;

#elseif cpp

typedef BarrelDistortionEffect = flight._cpp.BarrelDistortionEffect;

#elseif (js && flight_esm)

typedef BarrelDistortionEffect = flight._js.BarrelDistortionEffect;

#elseif js

#error "flight.BarrelDistortionEffect on js requires flight_esm."

#else

#error "flight.BarrelDistortionEffect: no backend for this target."

#end
