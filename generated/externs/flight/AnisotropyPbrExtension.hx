package flight;

#if hl

typedef AnisotropyPbrExtension = flight._hl.AnisotropyPbrExtension;

#elseif cpp

typedef AnisotropyPbrExtension = flight._cpp.AnisotropyPbrExtension;

#elseif (js && flight_esm)

typedef AnisotropyPbrExtension = flight._js.AnisotropyPbrExtension;

#elseif js

#error "flight.AnisotropyPbrExtension on js requires flight_esm."

#else

#error "flight.AnisotropyPbrExtension: no backend for this target."

#end
