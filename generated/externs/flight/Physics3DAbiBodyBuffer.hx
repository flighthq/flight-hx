package flight;

#if hl

typedef Physics3DAbiBodyBuffer = flight._hl.Physics3DAbiBodyBuffer;

#elseif cpp

typedef Physics3DAbiBodyBuffer = flight._cpp.Physics3DAbiBodyBuffer;

#elseif (js && flight_esm)

typedef Physics3DAbiBodyBuffer = flight._js.Physics3DAbiBodyBuffer;

#elseif js

#error "flight.Physics3DAbiBodyBuffer on js requires flight_esm."

#else

#error "flight.Physics3DAbiBodyBuffer: no backend for this target."

#end
