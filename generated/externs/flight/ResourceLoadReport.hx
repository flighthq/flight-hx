package flight;

#if hl

typedef ResourceLoadReport = flight._hl.ResourceLoadReport;

#elseif cpp

typedef ResourceLoadReport = flight._cpp.ResourceLoadReport;

#elseif (js && flight_esm)

typedef ResourceLoadReport = flight._js.ResourceLoadReport;

#elseif js

#error "flight.ResourceLoadReport on js requires flight_esm."

#else

#error "flight.ResourceLoadReport: no backend for this target."

#end
