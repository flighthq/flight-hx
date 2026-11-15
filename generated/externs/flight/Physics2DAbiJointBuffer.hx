package flight;

#if hl

typedef Physics2DAbiJointBuffer = flight._hl.Physics2DAbiJointBuffer;

#elseif cpp

typedef Physics2DAbiJointBuffer = flight._cpp.Physics2DAbiJointBuffer;

#elseif (js && flight_esm)

typedef Physics2DAbiJointBuffer = flight._js.Physics2DAbiJointBuffer;

#elseif js

#error "flight.Physics2DAbiJointBuffer on js requires flight_esm."

#else

#error "flight.Physics2DAbiJointBuffer: no backend for this target."

#end
