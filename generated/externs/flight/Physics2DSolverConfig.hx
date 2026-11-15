package flight;

#if hl

typedef Physics2DSolverConfig = flight._hl.Physics2DSolverConfig;

#elseif cpp

typedef Physics2DSolverConfig = flight._cpp.Physics2DSolverConfig;

#elseif (js && flight_esm)

typedef Physics2DSolverConfig = flight._js.Physics2DSolverConfig;

#elseif js

#error "flight.Physics2DSolverConfig on js requires flight_esm."

#else

#error "flight.Physics2DSolverConfig: no backend for this target."

#end
