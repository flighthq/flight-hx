package flight;

#if hl

typedef Physics3DContactConstraint = flight._hl.Physics3DContactConstraint;

#elseif cpp

typedef Physics3DContactConstraint = flight._cpp.Physics3DContactConstraint;

#elseif (js && flight_esm)

typedef Physics3DContactConstraint = flight._js.Physics3DContactConstraint;

#elseif js

#error "flight.Physics3DContactConstraint on js requires flight_esm."

#else

#error "flight.Physics3DContactConstraint: no backend for this target."

#end
