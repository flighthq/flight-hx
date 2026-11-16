package flight;

#if hl

typedef BlendEffect = flight._hl.BlendEffect;

#elseif cpp

typedef BlendEffect = flight._cpp.BlendEffect;

#elseif (js && flight_esm)

typedef BlendEffect = flight._js.BlendEffect;

#elseif js

#error "flight.BlendEffect on js requires flight_esm."

#else

#error "flight.BlendEffect: no backend for this target."

#end
