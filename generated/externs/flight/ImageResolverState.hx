package flight;

#if hl

typedef ImageResolverState = flight._hl.ImageResolverState;

#elseif cpp

typedef ImageResolverState = flight._cpp.ImageResolverState;

#elseif (js && flight_esm)

typedef ImageResolverState = flight._js.ImageResolverState;

#elseif js

#error "flight.ImageResolverState on js requires flight_esm."

#else

#error "flight.ImageResolverState: no backend for this target."

#end
