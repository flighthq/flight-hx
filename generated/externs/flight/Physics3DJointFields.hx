package flight;

#if hl

typedef Physics3DJointFields = flight._hl.Physics3DJointFields;

#elseif cpp

typedef Physics3DJointFields = flight._cpp.Physics3DJointFields;

#elseif (js && flight_esm)

typedef Physics3DJointFields = flight._js.Physics3DJointFields;

#elseif js

#error "flight.Physics3DJointFields on js requires flight_esm."

#else

#error "flight.Physics3DJointFields: no backend for this target."

#end
