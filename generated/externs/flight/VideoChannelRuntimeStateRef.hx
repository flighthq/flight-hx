package flight;

#if hl

typedef VideoChannelRuntimeStateRef = flight._hl.VideoChannelRuntimeStateRef;

#elseif cpp

typedef VideoChannelRuntimeStateRef = flight._cpp.VideoChannelRuntimeStateRef;

#elseif (js && flight_esm)

typedef VideoChannelRuntimeStateRef = flight._js.VideoChannelRuntimeStateRef;

#elseif js

#error "flight.VideoChannelRuntimeStateRef on js requires flight_esm."

#else

#error "flight.VideoChannelRuntimeStateRef: no backend for this target."

#end
