package flight;

#if hl

typedef RegExp = flight._hl.RegExp;

#elseif cpp

typedef RegExp = flight._cpp.RegExp;

#elseif (js && flight_esm)

typedef RegExp = flight._js.RegExp;

#elseif js

#error "flight.RegExp on js requires flight_esm."

#else

#error "flight.RegExp: no backend for this target."

#end

