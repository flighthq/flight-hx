package flight;

#if hl

typedef Scene3DResourceResolverOptions = flight._hl.Scene3DResourceResolverOptions;

#elseif cpp

typedef Scene3DResourceResolverOptions = flight._cpp.Scene3DResourceResolverOptions;

#elseif (js && flight_esm)

typedef Scene3DResourceResolverOptions = flight._js.Scene3DResourceResolverOptions;

#elseif js

#error "flight.Scene3DResourceResolverOptions on js requires flight_esm."

#else

#error "flight.Scene3DResourceResolverOptions: no backend for this target."

#end
