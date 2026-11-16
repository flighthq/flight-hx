package flight;

#if hl

typedef ThreeDsChunkCount = flight._hl.ThreeDsChunkCount;

#elseif cpp

typedef ThreeDsChunkCount = flight._cpp.ThreeDsChunkCount;

#elseif (js && flight_esm)

typedef ThreeDsChunkCount = flight._js.ThreeDsChunkCount;

#elseif js

#error "flight.ThreeDsChunkCount on js requires flight_esm."

#else

#error "flight.ThreeDsChunkCount: no backend for this target."

#end
