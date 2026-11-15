package flight;

#if hl

typedef LottieRegistry = flight._hl.LottieRegistry;

#elseif cpp

typedef LottieRegistry = flight._cpp.LottieRegistry;

#elseif (js && flight_esm)

typedef LottieRegistry = flight._js.LottieRegistry;

#elseif js

#error "flight.LottieRegistry on js requires flight_esm."

#else

#error "flight.LottieRegistry: no backend for this target."

#end
