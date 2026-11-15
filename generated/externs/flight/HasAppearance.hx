package flight;

#if hl

typedef HasAppearance = flight._hl.HasAppearance;

#elseif cpp

typedef HasAppearance = flight._cpp.HasAppearance;

#elseif (js && flight_esm)

typedef HasAppearance = flight._js.HasAppearance;

#elseif js

#error "flight.HasAppearance on js requires flight_esm."

#else

#error "flight.HasAppearance: no backend for this target."

#end
