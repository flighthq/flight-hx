package flight;

#if hl

typedef RiveImportOptions = flight._hl.RiveImportOptions;

#elseif cpp

typedef RiveImportOptions = flight._cpp.RiveImportOptions;

#elseif (js && flight_esm)

typedef RiveImportOptions = flight._js.RiveImportOptions;

#elseif js

#error "flight.RiveImportOptions on js requires flight_esm."

#else

#error "flight.RiveImportOptions: no backend for this target."

#end
