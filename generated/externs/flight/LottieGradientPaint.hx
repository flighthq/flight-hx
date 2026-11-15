package flight;

#if hl

typedef LottieGradientPaint = flight._hl.LottieGradientPaint;

#elseif cpp

typedef LottieGradientPaint = flight._cpp.LottieGradientPaint;

#elseif (js && flight_esm)

typedef LottieGradientPaint = flight._js.LottieGradientPaint;

#elseif js

#error "flight.LottieGradientPaint on js requires flight_esm."

#else

#error "flight.LottieGradientPaint: no backend for this target."

#end
