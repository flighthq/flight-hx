package flight;

#if hl

typedef ClearcoatPbrExtension = flight._hl.ClearcoatPbrExtension;

#elseif cpp

typedef ClearcoatPbrExtension = flight._cpp.ClearcoatPbrExtension;

#elseif (js && flight_esm)

typedef ClearcoatPbrExtension = flight._js.ClearcoatPbrExtension;

#elseif js

#error "flight.ClearcoatPbrExtension on js requires flight_esm."

#else

#error "flight.ClearcoatPbrExtension: no backend for this target."

#end
