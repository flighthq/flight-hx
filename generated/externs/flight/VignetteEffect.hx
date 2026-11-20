package flight;

#if hl

typedef VignetteEffect = flight._hl.VignetteEffect;

#elseif cpp

typedef VignetteEffect = flight._cpp.VignetteEffect;

#elseif (js && flight_esm)

typedef VignetteEffect = flight._js.VignetteEffect;

#elseif js

#error "flight.VignetteEffect on js requires flight_esm."

#else

#error "flight.VignetteEffect: no backend for this target."

#end
