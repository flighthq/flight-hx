package flight;

#if hl

typedef Physics3DMassData = flight._hl.Physics3DMassData;

#elseif cpp

typedef Physics3DMassData = flight._cpp.Physics3DMassData;

#elseif (js && flight_esm)

typedef Physics3DMassData = flight._js.Physics3DMassData;

#elseif js

#error "flight.Physics3DMassData on js requires flight_esm."

#else

#error "flight.Physics3DMassData: no backend for this target."

#end
