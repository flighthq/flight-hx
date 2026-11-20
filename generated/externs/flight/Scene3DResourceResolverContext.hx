package flight;

#if hl

typedef Scene3DResourceResolverContext = flight._hl.Scene3DResourceResolverContext;

#elseif cpp

typedef Scene3DResourceResolverContext = flight._cpp.Scene3DResourceResolverContext;

#elseif (js && flight_esm)

typedef Scene3DResourceResolverContext = flight._js.Scene3DResourceResolverContext;

#elseif js

#error "flight.Scene3DResourceResolverContext on js requires flight_esm."

#else

#error "flight.Scene3DResourceResolverContext: no backend for this target."

#end
