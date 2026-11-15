package flight;

#if hl

typedef Physics2DJointFields = flight._hl.Physics2DJointFields;

#elseif cpp

typedef Physics2DJointFields = flight._cpp.Physics2DJointFields;

#elseif (js && flight_esm)

typedef Physics2DJointFields = flight._js.Physics2DJointFields;

#elseif js

#error "flight.Physics2DJointFields on js requires flight_esm."

#else

#error "flight.Physics2DJointFields: no backend for this target."

#end
