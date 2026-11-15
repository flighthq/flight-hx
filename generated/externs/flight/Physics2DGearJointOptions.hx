package flight;

#if hl

typedef Physics2DGearJointOptions = flight._hl.Physics2DGearJointOptions;

#elseif cpp

typedef Physics2DGearJointOptions = flight._cpp.Physics2DGearJointOptions;

#elseif (js && flight_esm)

typedef Physics2DGearJointOptions = flight._js.Physics2DGearJointOptions;

#elseif js

#error "flight.Physics2DGearJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DGearJointOptions: no backend for this target."

#end
