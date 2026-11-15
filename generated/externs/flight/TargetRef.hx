package flight;

#if hl

typedef TargetRef = flight._hl.TargetRef;

#elseif cpp

typedef TargetRef = flight._cpp.TargetRef;

#elseif (js && flight_esm)

typedef TargetRef = flight._js.TargetRef;

#elseif js

#error "flight.TargetRef on js requires flight_esm."

#else

#error "flight.TargetRef: no backend for this target."

#end
