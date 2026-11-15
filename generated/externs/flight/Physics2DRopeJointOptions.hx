package flight;

#if hl

typedef Physics2DRopeJointOptions = flight._hl.Physics2DRopeJointOptions;

#elseif cpp

typedef Physics2DRopeJointOptions = flight._cpp.Physics2DRopeJointOptions;

#elseif (js && flight_esm)

typedef Physics2DRopeJointOptions = flight._js.Physics2DRopeJointOptions;

#elseif js

#error "flight.Physics2DRopeJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DRopeJointOptions: no backend for this target."

#end
