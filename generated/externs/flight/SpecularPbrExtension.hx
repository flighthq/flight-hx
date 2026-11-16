package flight;

#if hl

typedef SpecularPbrExtension = flight._hl.SpecularPbrExtension;

#elseif cpp

typedef SpecularPbrExtension = flight._cpp.SpecularPbrExtension;

#elseif (js && flight_esm)

typedef SpecularPbrExtension = flight._js.SpecularPbrExtension;

#elseif js

#error "flight.SpecularPbrExtension on js requires flight_esm."

#else

#error "flight.SpecularPbrExtension: no backend for this target."

#end
