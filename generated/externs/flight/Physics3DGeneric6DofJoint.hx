package flight;

#if hl

typedef Physics3DGeneric6DofJoint = flight._hl.Physics3DGeneric6DofJoint;

#elseif cpp

typedef Physics3DGeneric6DofJoint = flight._cpp.Physics3DGeneric6DofJoint;

#elseif (js && flight_esm)

typedef Physics3DGeneric6DofJoint = flight._js.Physics3DGeneric6DofJoint;

#elseif js

#error "flight.Physics3DGeneric6DofJoint on js requires flight_esm."

#else

#error "flight.Physics3DGeneric6DofJoint: no backend for this target."

#end
