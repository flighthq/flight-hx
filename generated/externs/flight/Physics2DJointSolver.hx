package flight;

#if hl

typedef Physics2DJointSolver = flight._hl.Physics2DJointSolver;

#elseif cpp

typedef Physics2DJointSolver = flight._cpp.Physics2DJointSolver;

#elseif (js && flight_esm)

typedef Physics2DJointSolver = flight._js.Physics2DJointSolver;

#elseif js

#error "flight.Physics2DJointSolver on js requires flight_esm."

#else

#error "flight.Physics2DJointSolver: no backend for this target."

#end
