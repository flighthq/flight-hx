package flight;

#if hl

typedef Physics2DJointResolution = flight._hl.Physics2DJointResolution;

#elseif cpp

typedef Physics2DJointResolution = flight._cpp.Physics2DJointResolution;

#elseif (js && flight_esm)

typedef Physics2DJointResolution = flight._js.Physics2DJointResolution;

#elseif js

#error "flight.Physics2DJointResolution on js requires flight_esm."

#else

#error "flight.Physics2DJointResolution: no backend for this target."

#end
