package flight;

#if hl

typedef Capsule = flight._hl.Capsule;

#elseif cpp

typedef Capsule = flight._cpp.Capsule;

#elseif (js && flight_esm)

typedef Capsule = flight._js.Capsule;

#elseif js

#error "flight.Capsule on js requires flight_esm."

#else

#error "flight.Capsule: no backend for this target."

#end
