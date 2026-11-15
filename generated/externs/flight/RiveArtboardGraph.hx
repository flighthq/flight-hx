package flight;

#if hl

typedef RiveArtboardGraph = flight._hl.RiveArtboardGraph;

#elseif cpp

typedef RiveArtboardGraph = flight._cpp.RiveArtboardGraph;

#elseif (js && flight_esm)

typedef RiveArtboardGraph = flight._js.RiveArtboardGraph;

#elseif js

#error "flight.RiveArtboardGraph on js requires flight_esm."

#else

#error "flight.RiveArtboardGraph: no backend for this target."

#end
