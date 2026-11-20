package flight;

#if hl

typedef AppLoop = flight._hl.AppLoop;

#elseif cpp

typedef AppLoop = flight._cpp.AppLoop;

#elseif (js && flight_esm)

typedef AppLoop = flight._js.AppLoop;

#elseif js

#error "flight.AppLoop on js requires flight_esm."

#else

#error "flight.AppLoop: no backend for this target."

#end
