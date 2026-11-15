package flight;

#if hl

typedef UnityColor = flight._hl.UnityColor;

#elseif cpp

typedef UnityColor = flight._cpp.UnityColor;

#elseif (js && flight_esm)

typedef UnityColor = flight._js.UnityColor;

#elseif js

#error "flight.UnityColor on js requires flight_esm."

#else

#error "flight.UnityColor: no backend for this target."

#end
