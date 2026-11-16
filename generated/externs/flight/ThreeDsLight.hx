package flight;

#if hl

typedef ThreeDsLight = flight._hl.ThreeDsLight;

#elseif cpp

typedef ThreeDsLight = flight._cpp.ThreeDsLight;

#elseif (js && flight_esm)

typedef ThreeDsLight = flight._js.ThreeDsLight;

#elseif js

#error "flight.ThreeDsLight on js requires flight_esm."

#else

#error "flight.ThreeDsLight: no backend for this target."

#end
