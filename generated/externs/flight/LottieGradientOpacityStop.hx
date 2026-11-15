package flight;

#if hl

typedef LottieGradientOpacityStop = flight._hl.LottieGradientOpacityStop;

#elseif cpp

typedef LottieGradientOpacityStop = flight._cpp.LottieGradientOpacityStop;

#elseif (js && flight_esm)

typedef LottieGradientOpacityStop = flight._js.LottieGradientOpacityStop;

#elseif js

#error "flight.LottieGradientOpacityStop on js requires flight_esm."

#else

#error "flight.LottieGradientOpacityStop: no backend for this target."

#end
