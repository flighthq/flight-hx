package flight;

#if hl

typedef InputTextData = flight._hl.InputTextData;

#elseif cpp

typedef InputTextData = flight._cpp.InputTextData;

#elseif (js && flight_esm)

typedef InputTextData = flight._js.InputTextData;

#elseif js

#error "flight.InputTextData on js requires flight_esm."

#else

#error "flight.InputTextData: no backend for this target."

#end
