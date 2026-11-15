package flight;

#if hl

typedef LottieLayerKind = flight._hl.LottieLayerKind;

#elseif cpp

typedef LottieLayerKind = flight._cpp.LottieLayerKind;

#elseif (js && flight_esm)

typedef LottieLayerKind = flight._js.LottieLayerKind;

#elseif js

#error "flight.LottieLayerKind on js requires flight_esm."

#else

#error "flight.LottieLayerKind: no backend for this target."

#end
