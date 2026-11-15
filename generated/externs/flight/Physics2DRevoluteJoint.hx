package flight;

#if hl

typedef Physics2DRevoluteJoint = flight._hl.Physics2DRevoluteJoint;

#elseif cpp

typedef Physics2DRevoluteJoint = flight._cpp.Physics2DRevoluteJoint;

#elseif (js && flight_esm)

typedef Physics2DRevoluteJoint = flight._js.Physics2DRevoluteJoint;

#elseif js

#error "flight.Physics2DRevoluteJoint on js requires flight_esm."

#else

#error "flight.Physics2DRevoluteJoint: no backend for this target."

#end
