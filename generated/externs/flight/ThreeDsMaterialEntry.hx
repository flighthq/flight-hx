package flight;

#if hl

typedef ThreeDsMaterialEntry = flight._hl.ThreeDsMaterialEntry;

#elseif cpp

typedef ThreeDsMaterialEntry = flight._cpp.ThreeDsMaterialEntry;

#elseif (js && flight_esm)

typedef ThreeDsMaterialEntry = flight._js.ThreeDsMaterialEntry;

#elseif js

#error "flight.ThreeDsMaterialEntry on js requires flight_esm."

#else

#error "flight.ThreeDsMaterialEntry: no backend for this target."

#end
