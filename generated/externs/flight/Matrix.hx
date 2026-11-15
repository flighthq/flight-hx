package flight;

#if hl

typedef Matrix = flight._hl.Matrix;

#elseif cpp

typedef Matrix = flight._cpp.Matrix;

#elseif (js && flight_esm)

typedef Matrix = flight._js.Matrix;

#elseif js

#error "flight.Matrix on js requires flight_esm."

#else

#error "flight.Matrix: no backend for this target."

#end
