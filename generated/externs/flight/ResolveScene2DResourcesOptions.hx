package flight;

#if hl

typedef ResolveScene2DResourcesOptions = flight._hl.ResolveScene2DResourcesOptions;

#elseif cpp

typedef ResolveScene2DResourcesOptions = flight._cpp.ResolveScene2DResourcesOptions;

#elseif (js && flight_esm)

typedef ResolveScene2DResourcesOptions = flight._js.ResolveScene2DResourcesOptions;

#elseif js

#error "flight.ResolveScene2DResourcesOptions on js requires flight_esm."

#else

#error "flight.ResolveScene2DResourcesOptions: no backend for this target."

#end
