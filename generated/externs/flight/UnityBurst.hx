package flight;

#if hl

typedef UnityBurst = flight._hl.UnityBurst;

#elseif cpp

typedef UnityBurst = flight._cpp.UnityBurst;

#elseif (js && flight_esm)

typedef UnityBurst = flight._js.UnityBurst;

#elseif js

#error "flight.UnityBurst on js requires flight_esm."

#else

#error "flight.UnityBurst: no backend for this target."

#end
