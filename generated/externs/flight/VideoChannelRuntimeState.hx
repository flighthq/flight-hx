package flight;

#if hl

typedef VideoChannelRuntimeState = flight._hl.VideoChannelRuntimeState;

#elseif cpp

typedef VideoChannelRuntimeState = flight._cpp.VideoChannelRuntimeState;

#elseif (js && flight_esm)

typedef VideoChannelRuntimeState = flight._js.VideoChannelRuntimeState;

#elseif js

#error "flight.VideoChannelRuntimeState on js requires flight_esm."

#else

#error "flight.VideoChannelRuntimeState: no backend for this target."

#end
