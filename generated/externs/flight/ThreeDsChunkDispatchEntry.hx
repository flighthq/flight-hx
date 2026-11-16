package flight;

#if hl

typedef ThreeDsChunkDispatchEntry = flight._hl.ThreeDsChunkDispatchEntry;

#elseif cpp

typedef ThreeDsChunkDispatchEntry = flight._cpp.ThreeDsChunkDispatchEntry;

#elseif (js && flight_esm)

typedef ThreeDsChunkDispatchEntry = flight._js.ThreeDsChunkDispatchEntry;

#elseif js

#error "flight.ThreeDsChunkDispatchEntry on js requires flight_esm."

#else

#error "flight.ThreeDsChunkDispatchEntry: no backend for this target."

#end
