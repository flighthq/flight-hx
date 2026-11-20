package flight;

#if hl

typedef TrayTooltipReading = flight._hl.TrayTooltipReading;

#elseif cpp

typedef TrayTooltipReading = flight._cpp.TrayTooltipReading;

#elseif (js && flight_esm)

typedef TrayTooltipReading = flight._js.TrayTooltipReading;

#elseif js

#error "flight.TrayTooltipReading on js requires flight_esm."

#else

#error "flight.TrayTooltipReading: no backend for this target."

#end
