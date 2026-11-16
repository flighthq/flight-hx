package flight;

#if hl

typedef Physics3DJointReaction = flight._hl.Physics3DJointReaction;

#elseif cpp

typedef Physics3DJointReaction = flight._cpp.Physics3DJointReaction;

#elseif (js && flight_esm)

typedef Physics3DJointReaction = flight._js.Physics3DJointReaction;

#elseif js

#error "flight.Physics3DJointReaction on js requires flight_esm."

#else

#error "flight.Physics3DJointReaction: no backend for this target."

#end
