package flight;

#if hl

typedef ColladaDeferredLightBinding = flight._hl.ColladaDeferredLightBinding;

#elseif cpp

typedef ColladaDeferredLightBinding = flight._cpp.ColladaDeferredLightBinding;

#elseif (js && flight_esm)

typedef ColladaDeferredLightBinding = flight._js.ColladaDeferredLightBinding;

#elseif js

#error "flight.ColladaDeferredLightBinding on js requires flight_esm."

#else

#error "flight.ColladaDeferredLightBinding: no backend for this target."

#end
