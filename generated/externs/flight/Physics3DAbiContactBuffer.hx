package flight;

#if hl

typedef Physics3DAbiContactBuffer = flight._hl.Physics3DAbiContactBuffer;

#elseif cpp

typedef Physics3DAbiContactBuffer = flight._cpp.Physics3DAbiContactBuffer;

#elseif (js && flight_esm)

typedef Physics3DAbiContactBuffer = flight._js.Physics3DAbiContactBuffer;

#elseif js

#error "flight.Physics3DAbiContactBuffer on js requires flight_esm."

#else

#error "flight.Physics3DAbiContactBuffer: no backend for this target."

#end
