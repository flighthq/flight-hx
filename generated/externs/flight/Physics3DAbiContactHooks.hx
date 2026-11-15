package flight;

#if hl

typedef Physics3DAbiContactHooks = flight._hl.Physics3DAbiContactHooks;

#elseif cpp

typedef Physics3DAbiContactHooks = flight._cpp.Physics3DAbiContactHooks;

#elseif (js && flight_esm)

typedef Physics3DAbiContactHooks = flight._js.Physics3DAbiContactHooks;

#elseif js

#error "flight.Physics3DAbiContactHooks on js requires flight_esm."

#else

#error "flight.Physics3DAbiContactHooks: no backend for this target."

#end
