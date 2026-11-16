package flight;

#if hl

typedef ColladaLightDefinition = flight._hl.ColladaLightDefinition;

#elseif cpp

typedef ColladaLightDefinition = flight._cpp.ColladaLightDefinition;

#elseif (js && flight_esm)

typedef ColladaLightDefinition = flight._js.ColladaLightDefinition;

#elseif js

#error "flight.ColladaLightDefinition on js requires flight_esm."

#else

#error "flight.ColladaLightDefinition: no backend for this target."

#end
