package flight;

#if hl

typedef CaptureBaseline = flight._hl.CaptureBaseline;

#elseif cpp

typedef CaptureBaseline = flight._cpp.CaptureBaseline;

#elseif (js && flight_esm)

typedef CaptureBaseline = flight._js.CaptureBaseline;

#elseif js

#error "flight.CaptureBaseline on js requires flight_esm."

#else

#error "flight.CaptureBaseline: no backend for this target."

#end
