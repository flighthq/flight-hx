package flight;

#if hl

typedef WrappedDiffusePbrExtension = flight._hl.WrappedDiffusePbrExtension;

#elseif cpp

typedef WrappedDiffusePbrExtension = flight._cpp.WrappedDiffusePbrExtension;

#elseif (js && flight_esm)

typedef WrappedDiffusePbrExtension = flight._js.WrappedDiffusePbrExtension;

#elseif js

#error "flight.WrappedDiffusePbrExtension on js requires flight_esm."

#else

#error "flight.WrappedDiffusePbrExtension: no backend for this target."

#end
