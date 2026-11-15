package flight;

#if hl

typedef Physics2DJointReaction = flight._hl.Physics2DJointReaction;

#elseif cpp

typedef Physics2DJointReaction = flight._cpp.Physics2DJointReaction;

#elseif (js && flight_esm)

typedef Physics2DJointReaction = flight._js.Physics2DJointReaction;

#elseif js

#error "flight.Physics2DJointReaction on js requires flight_esm."

#else

#error "flight.Physics2DJointReaction: no backend for this target."

#end
