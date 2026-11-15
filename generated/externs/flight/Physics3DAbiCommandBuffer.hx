package flight;

#if hl

typedef Physics3DAbiCommandBuffer = flight._hl.Physics3DAbiCommandBuffer;

#elseif cpp

typedef Physics3DAbiCommandBuffer = flight._cpp.Physics3DAbiCommandBuffer;

#elseif (js && flight_esm)

typedef Physics3DAbiCommandBuffer = flight._js.Physics3DAbiCommandBuffer;

#elseif js

#error "flight.Physics3DAbiCommandBuffer on js requires flight_esm."

#else

#error "flight.Physics3DAbiCommandBuffer: no backend for this target."

#end
