package flight;

#if hl

typedef Physics2DRopeJoint = flight._hl.Physics2DRopeJoint;

#elseif cpp

typedef Physics2DRopeJoint = flight._cpp.Physics2DRopeJoint;

#elseif (js && flight_esm)

typedef Physics2DRopeJoint = flight._js.Physics2DRopeJoint;

#elseif js

#error "flight.Physics2DRopeJoint on js requires flight_esm."

#else

#error "flight.Physics2DRopeJoint: no backend for this target."

#end
