package flight;

#if hl

typedef Vector4 = flight._hl.Vector4;

#elseif cpp

typedef Vector4 = flight._cpp.Vector4;

#elseif (js && flight_esm)

typedef Vector4 = flight._js.Vector4;

#elseif js

#error "flight.Vector4 on js requires flight_esm."

#else

#error "flight.Vector4: no backend for this target."

#end
