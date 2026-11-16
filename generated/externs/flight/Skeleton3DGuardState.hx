package flight;

#if hl

typedef Skeleton3DGuardState = flight._hl.Skeleton3DGuardState;

#elseif cpp

typedef Skeleton3DGuardState = flight._cpp.Skeleton3DGuardState;

#elseif (js && flight_esm)

typedef Skeleton3DGuardState = flight._js.Skeleton3DGuardState;

#elseif js

#error "flight.Skeleton3DGuardState on js requires flight_esm."

#else

#error "flight.Skeleton3DGuardState: no backend for this target."

#end
