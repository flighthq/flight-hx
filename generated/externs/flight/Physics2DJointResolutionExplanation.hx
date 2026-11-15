package flight;

#if hl

typedef Physics2DJointResolutionExplanation = flight._hl.Physics2DJointResolutionExplanation;

#elseif cpp

typedef Physics2DJointResolutionExplanation = flight._cpp.Physics2DJointResolutionExplanation;

#elseif (js && flight_esm)

typedef Physics2DJointResolutionExplanation = flight._js.Physics2DJointResolutionExplanation;

#elseif js

#error "flight.Physics2DJointResolutionExplanation on js requires flight_esm."

#else

#error "flight.Physics2DJointResolutionExplanation: no backend for this target."

#end
