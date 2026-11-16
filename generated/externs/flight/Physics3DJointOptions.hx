package flight;

#if hl

typedef Physics3DJointOptions = flight._hl.Physics3DJointOptions;

#elseif cpp

typedef Physics3DJointOptions = flight._cpp.Physics3DJointOptions;

#elseif (js && flight_esm)

typedef Physics3DJointOptions = flight._js.Physics3DJointOptions;

#elseif js

#error "flight.Physics3DJointOptions on js requires flight_esm."

#else

#error "flight.Physics3DJointOptions: no backend for this target."

#end
