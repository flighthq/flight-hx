package flight;

#if hl

typedef UnityVector3 = flight._hl.UnityVector3;

#elseif cpp

typedef UnityVector3 = flight._cpp.UnityVector3;

#elseif (js && flight_esm)

typedef UnityVector3 = flight._js.UnityVector3;

#elseif js

#error "flight.UnityVector3 on js requires flight_esm."

#else

#error "flight.UnityVector3: no backend for this target."

#end
