package flight;

#if hl

typedef Physics3DJointExplanation = flight._hl.Physics3DJointExplanation;

#elseif cpp

typedef Physics3DJointExplanation = flight._cpp.Physics3DJointExplanation;

#elseif (js && flight_esm)

typedef Physics3DJointExplanation = flight._js.Physics3DJointExplanation;

#elseif js

#error "flight.Physics3DJointExplanation on js requires flight_esm."

#else

#error "flight.Physics3DJointExplanation: no backend for this target."

#end
