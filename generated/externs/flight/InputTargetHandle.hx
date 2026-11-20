package flight;

#if hl

typedef InputTargetHandle = flight._hl.InputTargetHandle;

#elseif cpp

typedef InputTargetHandle = flight._cpp.InputTargetHandle;

#elseif (js && flight_esm)

typedef InputTargetHandle = flight._js.InputTargetHandle;

#elseif js

#error "flight.InputTargetHandle on js requires flight_esm."

#else

#error "flight.InputTargetHandle: no backend for this target."

#end
