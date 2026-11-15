package flight;

#if hl

typedef UnityGradientColorKey = flight._hl.UnityGradientColorKey;

#elseif cpp

typedef UnityGradientColorKey = flight._cpp.UnityGradientColorKey;

#elseif (js && flight_esm)

typedef UnityGradientColorKey = flight._js.UnityGradientColorKey;

#elseif js

#error "flight.UnityGradientColorKey on js requires flight_esm."

#else

#error "flight.UnityGradientColorKey: no backend for this target."

#end
