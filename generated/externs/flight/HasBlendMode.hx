package flight;

#if hl

typedef HasBlendMode = flight._hl.HasBlendMode;

#elseif cpp

typedef HasBlendMode = flight._cpp.HasBlendMode;

#elseif (js && flight_esm)

typedef HasBlendMode = flight._js.HasBlendMode;

#elseif js

#error "flight.HasBlendMode on js requires flight_esm."

#else

#error "flight.HasBlendMode: no backend for this target."

#end
