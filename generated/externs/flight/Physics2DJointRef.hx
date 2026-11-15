package flight;

#if hl

typedef Physics2DJointRef = flight._hl.Physics2DJointRef;

#elseif cpp

typedef Physics2DJointRef = flight._cpp.Physics2DJointRef;

#elseif (js && flight_esm)

typedef Physics2DJointRef = flight._js.Physics2DJointRef;

#elseif js

#error "flight.Physics2DJointRef on js requires flight_esm."

#else

#error "flight.Physics2DJointRef: no backend for this target."

#end
