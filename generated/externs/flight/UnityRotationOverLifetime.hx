package flight;

#if hl

typedef UnityRotationOverLifetime = flight._hl.UnityRotationOverLifetime;

#elseif cpp

typedef UnityRotationOverLifetime = flight._cpp.UnityRotationOverLifetime;

#elseif (js && flight_esm)

typedef UnityRotationOverLifetime = flight._js.UnityRotationOverLifetime;

#elseif js

#error "flight.UnityRotationOverLifetime on js requires flight_esm."

#else

#error "flight.UnityRotationOverLifetime: no backend for this target."

#end
