package flight;

#if hl

typedef CompositeEffect = flight._hl.CompositeEffect;

#elseif cpp

typedef CompositeEffect = flight._cpp.CompositeEffect;

#elseif (js && flight_esm)

typedef CompositeEffect = flight._js.CompositeEffect;

#elseif js

#error "flight.CompositeEffect on js requires flight_esm."

#else

#error "flight.CompositeEffect: no backend for this target."

#end
