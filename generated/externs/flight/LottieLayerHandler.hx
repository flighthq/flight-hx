package flight;

#if hl

typedef LottieLayerHandler = flight._hl.LottieLayerHandler;

#elseif cpp

typedef LottieLayerHandler = flight._cpp.LottieLayerHandler;

#elseif (js && flight_esm)

typedef LottieLayerHandler = flight._js.LottieLayerHandler;

#elseif js

#error "flight.LottieLayerHandler on js requires flight_esm."

#else

#error "flight.LottieLayerHandler: no backend for this target."

#end
