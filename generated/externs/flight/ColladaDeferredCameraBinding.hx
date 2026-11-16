package flight;

#if hl

typedef ColladaDeferredCameraBinding = flight._hl.ColladaDeferredCameraBinding;

#elseif cpp

typedef ColladaDeferredCameraBinding = flight._cpp.ColladaDeferredCameraBinding;

#elseif (js && flight_esm)

typedef ColladaDeferredCameraBinding = flight._js.ColladaDeferredCameraBinding;

#elseif js

#error "flight.ColladaDeferredCameraBinding on js requires flight_esm."

#else

#error "flight.ColladaDeferredCameraBinding: no backend for this target."

#end
