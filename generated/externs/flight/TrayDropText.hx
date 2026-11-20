package flight;

#if hl

typedef TrayDropText = flight._hl.TrayDropText;

#elseif cpp

typedef TrayDropText = flight._cpp.TrayDropText;

#elseif (js && flight_esm)

typedef TrayDropText = flight._js.TrayDropText;

#elseif js

#error "flight.TrayDropText on js requires flight_esm."

#else

#error "flight.TrayDropText: no backend for this target."

#end
