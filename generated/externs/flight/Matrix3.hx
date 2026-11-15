package flight;

#if hl

typedef Matrix3 = flight._hl.Matrix3;

#elseif cpp

typedef Matrix3 = flight._cpp.Matrix3;

#elseif (js && flight_esm)

typedef Matrix3 = flight._js.Matrix3;

#elseif js

#error "flight.Matrix3 on js requires flight_esm."

#else

#error "flight.Matrix3: no backend for this target."

#end
