package flight;

#if hl

typedef Physics3DAbiJointBuffer = flight._hl.Physics3DAbiJointBuffer;

#elseif cpp

typedef Physics3DAbiJointBuffer = flight._cpp.Physics3DAbiJointBuffer;

#elseif (js && flight_esm)

typedef Physics3DAbiJointBuffer = flight._js.Physics3DAbiJointBuffer;

#elseif js

#error "flight.Physics3DAbiJointBuffer on js requires flight_esm."

#else

#error "flight.Physics3DAbiJointBuffer: no backend for this target."

#end
