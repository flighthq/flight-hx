package flight;

#if hl

typedef UnityGradientAlphaKey = flight._hl.UnityGradientAlphaKey;

#elseif cpp

typedef UnityGradientAlphaKey = flight._cpp.UnityGradientAlphaKey;

#elseif (js && flight_esm)

typedef UnityGradientAlphaKey = flight._js.UnityGradientAlphaKey;

#elseif js

#error "flight.UnityGradientAlphaKey on js requires flight_esm."

#else

#error "flight.UnityGradientAlphaKey: no backend for this target."

#end
