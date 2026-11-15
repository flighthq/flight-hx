package flight;

#if hl

typedef VelocitySample = flight._hl.VelocitySample;

#elseif cpp

typedef VelocitySample = flight._cpp.VelocitySample;

#elseif (js && flight_esm)

typedef VelocitySample = flight._js.VelocitySample;

#elseif js

#error "flight.VelocitySample on js requires flight_esm."

#else

#error "flight.VelocitySample: no backend for this target."

#end
