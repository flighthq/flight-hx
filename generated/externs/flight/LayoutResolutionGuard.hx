package flight;

#if hl

typedef LayoutResolutionGuard = flight._hl.LayoutResolutionGuard;

#elseif cpp

typedef LayoutResolutionGuard = flight._cpp.LayoutResolutionGuard;

#elseif (js && flight_esm)

typedef LayoutResolutionGuard = flight._js.LayoutResolutionGuard;

#elseif js

#error "flight.LayoutResolutionGuard on js requires flight_esm."

#else

#error "flight.LayoutResolutionGuard: no backend for this target."

#end
