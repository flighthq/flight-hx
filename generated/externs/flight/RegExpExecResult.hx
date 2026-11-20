package flight;

#if hl

typedef RegExpExecResult = flight._hl.RegExpExecResult;

#elseif cpp

typedef RegExpExecResult = flight._cpp.RegExpExecResult;

#elseif (js && flight_esm)

typedef RegExpExecResult = flight._js.RegExpExecResult;

#elseif js

#error "flight.RegExpExecResult on js requires flight_esm."

#else

#error "flight.RegExpExecResult: no backend for this target."

#end
