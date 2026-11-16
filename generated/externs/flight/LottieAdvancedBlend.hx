package flight;

#if hl

typedef LottieAdvancedBlend = flight._hl.LottieAdvancedBlend;

#elseif cpp

typedef LottieAdvancedBlend = flight._cpp.LottieAdvancedBlend;

#elseif (js && flight_esm)

typedef LottieAdvancedBlend = flight._js.LottieAdvancedBlend;

#elseif js

#error "flight.LottieAdvancedBlend on js requires flight_esm."

#else

#error "flight.LottieAdvancedBlend: no backend for this target."

#end
