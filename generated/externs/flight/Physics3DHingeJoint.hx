package flight;

#if hl

typedef Physics3DHingeJoint = flight._hl.Physics3DHingeJoint;

#elseif cpp

typedef Physics3DHingeJoint = flight._cpp.Physics3DHingeJoint;

#elseif (js && flight_esm)

typedef Physics3DHingeJoint = flight._js.Physics3DHingeJoint;

#elseif js

#error "flight.Physics3DHingeJoint on js requires flight_esm."

#else

#error "flight.Physics3DHingeJoint: no backend for this target."

#end
