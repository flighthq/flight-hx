package flight;

#if hl

typedef Physics3DJointFrames = flight._hl.Physics3DJointFrames;

#elseif cpp

typedef Physics3DJointFrames = flight._cpp.Physics3DJointFrames;

#elseif (js && flight_esm)

typedef Physics3DJointFrames = flight._js.Physics3DJointFrames;

#elseif js

#error "flight.Physics3DJointFrames on js requires flight_esm."

#else

#error "flight.Physics3DJointFrames: no backend for this target."

#end
