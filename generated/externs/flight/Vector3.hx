package flight;

#if hl

typedef Vector3 = flight._hl.Vector3;

#elseif cpp

typedef Vector3 = flight._cpp.Vector3;

#elseif (js && flight_esm)

typedef Vector3 = flight._js.Vector3;

#elseif js

#error "flight.Vector3 on js requires flight_esm."

#else

#error "flight.Vector3: no backend for this target."

#end
