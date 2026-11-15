package flight;

#if hl

typedef Matrix4 = flight._hl.Matrix4;

#elseif cpp

typedef Matrix4 = flight._cpp.Matrix4;

#elseif (js && flight_esm)

typedef Matrix4 = flight._js.Matrix4;

#elseif js

#error "flight.Matrix4 on js requires flight_esm."

#else

#error "flight.Matrix4: no backend for this target."

#end
