package flight;

#if hl

typedef ColladaDeferredControllerBinding = flight._hl.ColladaDeferredControllerBinding;

#elseif cpp

typedef ColladaDeferredControllerBinding = flight._cpp.ColladaDeferredControllerBinding;

#elseif (js && flight_esm)

typedef ColladaDeferredControllerBinding = flight._js.ColladaDeferredControllerBinding;

#elseif js

#error "flight.ColladaDeferredControllerBinding on js requires flight_esm."

#else

#error "flight.ColladaDeferredControllerBinding: no backend for this target."

#end
