package flight;

#if hl

typedef Physics2DWheelJoint = flight._hl.Physics2DWheelJoint;

#elseif cpp

typedef Physics2DWheelJoint = flight._cpp.Physics2DWheelJoint;

#elseif (js && flight_esm)

typedef Physics2DWheelJoint = flight._js.Physics2DWheelJoint;

#elseif js

#error "flight.Physics2DWheelJoint on js requires flight_esm."

#else

#error "flight.Physics2DWheelJoint: no backend for this target."

#end
