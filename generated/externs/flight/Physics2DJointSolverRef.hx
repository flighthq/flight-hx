package flight;

#if hl

typedef Physics2DJointSolverRef = flight._hl.Physics2DJointSolverRef;

#elseif cpp

typedef Physics2DJointSolverRef = flight._cpp.Physics2DJointSolverRef;

#elseif (js && flight_esm)

typedef Physics2DJointSolverRef = flight._js.Physics2DJointSolverRef;

#elseif js

#error "flight.Physics2DJointSolverRef on js requires flight_esm."

#else

#error "flight.Physics2DJointSolverRef: no backend for this target."

#end
