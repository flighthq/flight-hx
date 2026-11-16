package flight;

#if hl

typedef ColladaMorphEntry = flight._hl.ColladaMorphEntry;

#elseif cpp

typedef ColladaMorphEntry = flight._cpp.ColladaMorphEntry;

#elseif (js && flight_esm)

typedef ColladaMorphEntry = flight._js.ColladaMorphEntry;

#elseif js

#error "flight.ColladaMorphEntry on js requires flight_esm."

#else

#error "flight.ColladaMorphEntry: no backend for this target."

#end
