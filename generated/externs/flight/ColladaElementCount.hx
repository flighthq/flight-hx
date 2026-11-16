package flight;

#if hl

typedef ColladaElementCount = flight._hl.ColladaElementCount;

#elseif cpp

typedef ColladaElementCount = flight._cpp.ColladaElementCount;

#elseif (js && flight_esm)

typedef ColladaElementCount = flight._js.ColladaElementCount;

#elseif js

#error "flight.ColladaElementCount on js requires flight_esm."

#else

#error "flight.ColladaElementCount: no backend for this target."

#end
