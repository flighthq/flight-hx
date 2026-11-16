package flight;

#if hl

typedef ThreeDsDropTallyEntry = flight._hl.ThreeDsDropTallyEntry;

#elseif cpp

typedef ThreeDsDropTallyEntry = flight._cpp.ThreeDsDropTallyEntry;

#elseif (js && flight_esm)

typedef ThreeDsDropTallyEntry = flight._js.ThreeDsDropTallyEntry;

#elseif js

#error "flight.ThreeDsDropTallyEntry on js requires flight_esm."

#else

#error "flight.ThreeDsDropTallyEntry: no backend for this target."

#end
