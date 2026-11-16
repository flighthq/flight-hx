package flight;

#if hl

typedef ColladaOrthographicCameraDefinition = flight._hl.ColladaOrthographicCameraDefinition;

#elseif cpp

typedef ColladaOrthographicCameraDefinition = flight._cpp.ColladaOrthographicCameraDefinition;

#elseif (js && flight_esm)

typedef ColladaOrthographicCameraDefinition = flight._js.ColladaOrthographicCameraDefinition;

#elseif js

#error "flight.ColladaOrthographicCameraDefinition on js requires flight_esm."

#else

#error "flight.ColladaOrthographicCameraDefinition: no backend for this target."

#end
