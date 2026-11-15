package flight;

#if hl

typedef Physics2DWeldJoint = flight._hl.Physics2DWeldJoint;

#elseif cpp

typedef Physics2DWeldJoint = flight._cpp.Physics2DWeldJoint;

#elseif (js && flight_esm)

typedef Physics2DWeldJoint = flight._js.Physics2DWeldJoint;

#elseif js

#error "flight.Physics2DWeldJoint on js requires flight_esm."

#else

#error "flight.Physics2DWeldJoint: no backend for this target."

#end
