package flight;

#if hl

typedef CaptureBaselineProvenance = flight._hl.CaptureBaselineProvenance;

#elseif cpp

typedef CaptureBaselineProvenance = flight._cpp.CaptureBaselineProvenance;

#elseif (js && flight_esm)

typedef CaptureBaselineProvenance = flight._js.CaptureBaselineProvenance;

#elseif js

#error "flight.CaptureBaselineProvenance on js requires flight_esm."

#else

#error "flight.CaptureBaselineProvenance: no backend for this target."

#end
