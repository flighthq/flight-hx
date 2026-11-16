package flight;

#if hl

typedef ColladaFloatArrayEntry = flight._hl.ColladaFloatArrayEntry;

#elseif cpp

typedef ColladaFloatArrayEntry = flight._cpp.ColladaFloatArrayEntry;

#elseif (js && flight_esm)

typedef ColladaFloatArrayEntry = flight._js.ColladaFloatArrayEntry;

#elseif js

#error "flight.ColladaFloatArrayEntry on js requires flight_esm."

#else

#error "flight.ColladaFloatArrayEntry: no backend for this target."

#end
