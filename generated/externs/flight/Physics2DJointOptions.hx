package flight;

#if hl

typedef Physics2DJointOptions = flight._hl.Physics2DJointOptions;

#elseif cpp

typedef Physics2DJointOptions = flight._cpp.Physics2DJointOptions;

#elseif (js && flight_esm)

typedef Physics2DJointOptions = flight._js.Physics2DJointOptions;

#elseif js

#error "flight.Physics2DJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DJointOptions: no backend for this target."

#end
