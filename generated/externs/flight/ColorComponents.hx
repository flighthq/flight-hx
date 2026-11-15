package flight;

#if hl

typedef ColorComponents = flight._hl.ColorComponents;

#elseif cpp

typedef ColorComponents = flight._cpp.ColorComponents;

#elseif (js && flight_esm)

typedef ColorComponents = flight._js.ColorComponents;

#elseif js

#error "flight.ColorComponents on js requires flight_esm."

#else

#error "flight.ColorComponents: no backend for this target."

#end
