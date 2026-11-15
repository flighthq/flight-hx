package flight;

#if hl

typedef Physics2DAbiContactHooks = flight._hl.Physics2DAbiContactHooks;

#elseif cpp

typedef Physics2DAbiContactHooks = flight._cpp.Physics2DAbiContactHooks;

#elseif (js && flight_esm)

typedef Physics2DAbiContactHooks = flight._js.Physics2DAbiContactHooks;

#elseif js

#error "flight.Physics2DAbiContactHooks on js requires flight_esm."

#else

#error "flight.Physics2DAbiContactHooks: no backend for this target."

#end
