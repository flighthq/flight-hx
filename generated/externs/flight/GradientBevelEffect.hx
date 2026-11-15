package flight;

#if hl

typedef GradientBevelEffect = flight._hl.GradientBevelEffect;

#elseif cpp

typedef GradientBevelEffect = flight._cpp.GradientBevelEffect;

#elseif (js && flight_esm)

typedef GradientBevelEffect = flight._js.GradientBevelEffect;

#elseif js

#error "flight.GradientBevelEffect on js requires flight_esm."

#else

#error "flight.GradientBevelEffect: no backend for this target."

#end
