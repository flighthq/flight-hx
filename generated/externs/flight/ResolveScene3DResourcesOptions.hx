package flight;

#if hl

typedef ResolveScene3DResourcesOptions = flight._hl.ResolveScene3DResourcesOptions;

#elseif cpp

typedef ResolveScene3DResourcesOptions = flight._cpp.ResolveScene3DResourcesOptions;

#elseif (js && flight_esm)

typedef ResolveScene3DResourcesOptions = flight._js.ResolveScene3DResourcesOptions;

#elseif js

#error "flight.ResolveScene3DResourcesOptions on js requires flight_esm."

#else

#error "flight.ResolveScene3DResourcesOptions: no backend for this target."

#end
