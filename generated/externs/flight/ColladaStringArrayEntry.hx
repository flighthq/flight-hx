package flight;

#if hl

typedef ColladaStringArrayEntry = flight._hl.ColladaStringArrayEntry;

#elseif cpp

typedef ColladaStringArrayEntry = flight._cpp.ColladaStringArrayEntry;

#elseif (js && flight_esm)

typedef ColladaStringArrayEntry = flight._js.ColladaStringArrayEntry;

#elseif js

#error "flight.ColladaStringArrayEntry on js requires flight_esm."

#else

#error "flight.ColladaStringArrayEntry: no backend for this target."

#end
