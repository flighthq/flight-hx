package flight;

#if hl

typedef CaptureCheckResult = flight._hl.CaptureCheckResult;

#elseif cpp

typedef CaptureCheckResult = flight._cpp.CaptureCheckResult;

#elseif (js && flight_esm)

typedef CaptureCheckResult = flight._js.CaptureCheckResult;

#elseif js

#error "flight.CaptureCheckResult on js requires flight_esm."

#else

#error "flight.CaptureCheckResult: no backend for this target."

#end
