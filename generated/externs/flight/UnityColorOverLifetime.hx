package flight;

#if hl

typedef UnityColorOverLifetime = flight._hl.UnityColorOverLifetime;

#elseif cpp

typedef UnityColorOverLifetime = flight._cpp.UnityColorOverLifetime;

#elseif (js && flight_esm)

typedef UnityColorOverLifetime = flight._js.UnityColorOverLifetime;

#elseif js

#error "flight.UnityColorOverLifetime on js requires flight_esm."

#else

#error "flight.UnityColorOverLifetime: no backend for this target."

#end
