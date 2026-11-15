package flight;

#if hl

typedef ClockOptions = flight._hl.ClockOptions;

#elseif cpp

typedef ClockOptions = flight._cpp.ClockOptions;

#elseif (js && flight_esm)

typedef ClockOptions = flight._js.ClockOptions;

#elseif js

#error "flight.ClockOptions on js requires flight_esm."

#else

#error "flight.ClockOptions: no backend for this target."

#end
