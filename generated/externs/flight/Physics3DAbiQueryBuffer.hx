package flight;

#if hl

typedef Physics3DAbiQueryBuffer = flight._hl.Physics3DAbiQueryBuffer;

#elseif cpp

typedef Physics3DAbiQueryBuffer = flight._cpp.Physics3DAbiQueryBuffer;

#elseif (js && flight_esm)

typedef Physics3DAbiQueryBuffer = flight._js.Physics3DAbiQueryBuffer;

#elseif js

#error "flight.Physics3DAbiQueryBuffer on js requires flight_esm."

#else

#error "flight.Physics3DAbiQueryBuffer: no backend for this target."

#end
