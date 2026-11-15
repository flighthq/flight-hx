package flight;

#if hl

typedef Physics2DMouseJointOptions = flight._hl.Physics2DMouseJointOptions;

#elseif cpp

typedef Physics2DMouseJointOptions = flight._cpp.Physics2DMouseJointOptions;

#elseif (js && flight_esm)

typedef Physics2DMouseJointOptions = flight._js.Physics2DMouseJointOptions;

#elseif js

#error "flight.Physics2DMouseJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DMouseJointOptions: no backend for this target."

#end
