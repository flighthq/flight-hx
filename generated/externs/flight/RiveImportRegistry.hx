package flight;

#if hl

typedef RiveImportRegistry = flight._hl.RiveImportRegistry;

#elseif cpp

typedef RiveImportRegistry = flight._cpp.RiveImportRegistry;

#elseif (js && flight_esm)

typedef RiveImportRegistry = flight._js.RiveImportRegistry;

#elseif js

#error "flight.RiveImportRegistry on js requires flight_esm."

#else

#error "flight.RiveImportRegistry: no backend for this target."

#end
