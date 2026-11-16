package flight;

#if hl

typedef RiveAdvancedBlend = flight._hl.RiveAdvancedBlend;

#elseif cpp

typedef RiveAdvancedBlend = flight._cpp.RiveAdvancedBlend;

#elseif (js && flight_esm)

typedef RiveAdvancedBlend = flight._js.RiveAdvancedBlend;

#elseif js

#error "flight.RiveAdvancedBlend on js requires flight_esm."

#else

#error "flight.RiveAdvancedBlend: no backend for this target."

#end
