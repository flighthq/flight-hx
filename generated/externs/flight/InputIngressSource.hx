package flight;

#if hl

typedef InputIngressSource = flight._hl.InputIngressSource;

#elseif cpp

typedef InputIngressSource = flight._cpp.InputIngressSource;

#elseif (js && flight_esm)

typedef InputIngressSource = flight._js.InputIngressSource;

#elseif js

#error "flight.InputIngressSource on js requires flight_esm."

#else

#error "flight.InputIngressSource: no backend for this target."

#end
