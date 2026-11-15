package flight;

#if hl

typedef RiveArtboardImport = flight._hl.RiveArtboardImport;

#elseif cpp

typedef RiveArtboardImport = flight._cpp.RiveArtboardImport;

#elseif (js && flight_esm)

typedef RiveArtboardImport = flight._js.RiveArtboardImport;

#elseif js

#error "flight.RiveArtboardImport on js requires flight_esm."

#else

#error "flight.RiveArtboardImport: no backend for this target."

#end
