package flight;

#if hl

typedef LottieShapePath = flight._hl.LottieShapePath;

#elseif cpp

typedef LottieShapePath = flight._cpp.LottieShapePath;

#elseif (js && flight_esm)

typedef LottieShapePath = flight._js.LottieShapePath;

#elseif js

#error "flight.LottieShapePath on js requires flight_esm."

#else

#error "flight.LottieShapePath: no backend for this target."

#end
