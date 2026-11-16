package flight;

#if hl

typedef ColladaPerspectiveCameraDefinition = flight._hl.ColladaPerspectiveCameraDefinition;

#elseif cpp

typedef ColladaPerspectiveCameraDefinition = flight._cpp.ColladaPerspectiveCameraDefinition;

#elseif (js && flight_esm)

typedef ColladaPerspectiveCameraDefinition = flight._js.ColladaPerspectiveCameraDefinition;

#elseif js

#error "flight.ColladaPerspectiveCameraDefinition on js requires flight_esm."

#else

#error "flight.ColladaPerspectiveCameraDefinition: no backend for this target."

#end
