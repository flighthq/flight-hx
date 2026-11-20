package flight;

#if hl

typedef TrayTitleReading = flight._hl.TrayTitleReading;

#elseif cpp

typedef TrayTitleReading = flight._cpp.TrayTitleReading;

#elseif (js && flight_esm)

typedef TrayTitleReading = flight._js.TrayTitleReading;

#elseif js

#error "flight.TrayTitleReading on js requires flight_esm."

#else

#error "flight.TrayTitleReading: no backend for this target."

#end
