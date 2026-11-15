package flight;

#if hl

typedef GradientGlowEffect = flight._hl.GradientGlowEffect;

#elseif cpp

typedef GradientGlowEffect = flight._cpp.GradientGlowEffect;

#elseif (js && flight_esm)

typedef GradientGlowEffect = flight._js.GradientGlowEffect;

#elseif js

#error "flight.GradientGlowEffect on js requires flight_esm."

#else

#error "flight.GradientGlowEffect: no backend for this target."

#end
