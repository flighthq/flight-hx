package flight;

#if hl

typedef SpineBinaryVersionFailure = flight._hl.SpineBinaryVersionFailure;

#elseif cpp

typedef SpineBinaryVersionFailure = flight._cpp.SpineBinaryVersionFailure;

#elseif (js && flight_esm)

typedef SpineBinaryVersionFailure = flight._js.SpineBinaryVersionFailure;

#elseif js

#error "flight.SpineBinaryVersionFailure on js requires flight_esm."

#else

#error "flight.SpineBinaryVersionFailure: no backend for this target."

#end
