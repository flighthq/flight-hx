package flight;

#if hl

typedef Physics3DContactConstraintPoint = flight._hl.Physics3DContactConstraintPoint;

#elseif cpp

typedef Physics3DContactConstraintPoint = flight._cpp.Physics3DContactConstraintPoint;

#elseif (js && flight_esm)

typedef Physics3DContactConstraintPoint = flight._js.Physics3DContactConstraintPoint;

#elseif js

#error "flight.Physics3DContactConstraintPoint on js requires flight_esm."

#else

#error "flight.Physics3DContactConstraintPoint: no backend for this target."

#end
