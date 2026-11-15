package flight;

#if hl

typedef Physics2DPulleyJoint = flight._hl.Physics2DPulleyJoint;

#elseif cpp

typedef Physics2DPulleyJoint = flight._cpp.Physics2DPulleyJoint;

#elseif (js && flight_esm)

typedef Physics2DPulleyJoint = flight._js.Physics2DPulleyJoint;

#elseif js

#error "flight.Physics2DPulleyJoint on js requires flight_esm."

#else

#error "flight.Physics2DPulleyJoint: no backend for this target."

#end
