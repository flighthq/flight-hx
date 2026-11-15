package flight;

#if hl

typedef GlitchEffect = flight._hl.GlitchEffect;

#elseif cpp

typedef GlitchEffect = flight._cpp.GlitchEffect;

#elseif (js && flight_esm)

typedef GlitchEffect = flight._js.GlitchEffect;

#elseif js

#error "flight.GlitchEffect on js requires flight_esm."

#else

#error "flight.GlitchEffect: no backend for this target."

#end
