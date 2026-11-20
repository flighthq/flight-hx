package flight;

#if hl

typedef SceneCoverageCatalog = flight._hl.SceneCoverageCatalog;

#elseif cpp

typedef SceneCoverageCatalog = flight._cpp.SceneCoverageCatalog;

#elseif (js && flight_esm)

typedef SceneCoverageCatalog = flight._js.SceneCoverageCatalog;

#elseif js

#error "flight.SceneCoverageCatalog on js requires flight_esm."

#else

#error "flight.SceneCoverageCatalog: no backend for this target."

#end
