package flight;

#if hl

typedef Physics2DGearJoint = flight._hl.Physics2DGearJoint;

#elseif cpp

typedef Physics2DGearJoint = flight._cpp.Physics2DGearJoint;

#elseif (js && flight_esm)

typedef Physics2DGearJoint = flight._js.Physics2DGearJoint;

#elseif js

#error "flight.Physics2DGearJoint on js requires flight_esm."

#else

#error "flight.Physics2DGearJoint: no backend for this target."

#end
