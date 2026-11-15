package flight;

#if hl

typedef LottieShapeItemHandler = flight._hl.LottieShapeItemHandler;

#elseif cpp

typedef LottieShapeItemHandler = flight._cpp.LottieShapeItemHandler;

#elseif (js && flight_esm)

typedef LottieShapeItemHandler = flight._js.LottieShapeItemHandler;

#elseif js

#error "flight.LottieShapeItemHandler on js requires flight_esm."

#else

#error "flight.LottieShapeItemHandler: no backend for this target."

#end
