package flight;

#if hl

typedef Physics3DFixedJoint = flight._hl.Physics3DFixedJoint;

#elseif cpp

typedef Physics3DFixedJoint = flight._cpp.Physics3DFixedJoint;

#elseif (js && flight_esm)

typedef Physics3DFixedJoint = flight._js.Physics3DFixedJoint;

#elseif js

#error "flight.Physics3DFixedJoint on js requires flight_esm."

#else

#error "flight.Physics3DFixedJoint: no backend for this target."

#end
