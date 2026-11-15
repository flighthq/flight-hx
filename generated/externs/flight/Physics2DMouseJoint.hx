package flight;

#if hl

typedef Physics2DMouseJoint = flight._hl.Physics2DMouseJoint;

#elseif cpp

typedef Physics2DMouseJoint = flight._cpp.Physics2DMouseJoint;

#elseif (js && flight_esm)

typedef Physics2DMouseJoint = flight._js.Physics2DMouseJoint;

#elseif js

#error "flight.Physics2DMouseJoint on js requires flight_esm."

#else

#error "flight.Physics2DMouseJoint: no backend for this target."

#end
