package flight;

#if hl

typedef Physics2DPulleyJointOptions = flight._hl.Physics2DPulleyJointOptions;

#elseif cpp

typedef Physics2DPulleyJointOptions = flight._cpp.Physics2DPulleyJointOptions;

#elseif (js && flight_esm)

typedef Physics2DPulleyJointOptions = flight._js.Physics2DPulleyJointOptions;

#elseif js

#error "flight.Physics2DPulleyJointOptions on js requires flight_esm."

#else

#error "flight.Physics2DPulleyJointOptions: no backend for this target."

#end
