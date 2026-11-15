package flight;

#if hl

typedef Physics2DPrismaticJoint = flight._hl.Physics2DPrismaticJoint;

#elseif cpp

typedef Physics2DPrismaticJoint = flight._cpp.Physics2DPrismaticJoint;

#elseif (js && flight_esm)

typedef Physics2DPrismaticJoint = flight._js.Physics2DPrismaticJoint;

#elseif js

#error "flight.Physics2DPrismaticJoint on js requires flight_esm."

#else

#error "flight.Physics2DPrismaticJoint: no backend for this target."

#end
