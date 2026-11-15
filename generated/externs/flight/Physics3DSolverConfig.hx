package flight;

#if hl

typedef Physics3DSolverConfig = flight._hl.Physics3DSolverConfig;

#elseif cpp

typedef Physics3DSolverConfig = flight._cpp.Physics3DSolverConfig;

#elseif (js && flight_esm)

typedef Physics3DSolverConfig = flight._js.Physics3DSolverConfig;

#elseif js

#error "flight.Physics3DSolverConfig on js requires flight_esm."

#else

#error "flight.Physics3DSolverConfig: no backend for this target."

#end
