package flight;

#if hl

typedef UnityShape = flight._hl.UnityShape;

#elseif cpp

typedef UnityShape = flight._cpp.UnityShape;

#elseif (js && flight_esm)

typedef UnityShape = flight._js.UnityShape;

#elseif js

#error "flight.UnityShape on js requires flight_esm."

#else

#error "flight.UnityShape: no backend for this target."

#end
