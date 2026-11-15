package flight;

#if hl

typedef Physics2DSolverConfigOptions = flight._hl.Physics2DSolverConfigOptions;

#elseif cpp

typedef Physics2DSolverConfigOptions = flight._cpp.Physics2DSolverConfigOptions;

#elseif (js && flight_esm)

typedef Physics2DSolverConfigOptions = flight._js.Physics2DSolverConfigOptions;

#elseif js

#error "flight.Physics2DSolverConfigOptions on js requires flight_esm."

#else

#error "flight.Physics2DSolverConfigOptions: no backend for this target."

#end
