package flight;

#if hl

typedef Physics3DConeTwistJoint = flight._hl.Physics3DConeTwistJoint;

#elseif cpp

typedef Physics3DConeTwistJoint = flight._cpp.Physics3DConeTwistJoint;

#elseif (js && flight_esm)

typedef Physics3DConeTwistJoint = flight._js.Physics3DConeTwistJoint;

#elseif js

#error "flight.Physics3DConeTwistJoint on js requires flight_esm."

#else

#error "flight.Physics3DConeTwistJoint: no backend for this target."

#end
