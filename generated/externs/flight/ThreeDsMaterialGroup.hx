package flight;

#if hl

typedef ThreeDsMaterialGroup = flight._hl.ThreeDsMaterialGroup;

#elseif cpp

typedef ThreeDsMaterialGroup = flight._cpp.ThreeDsMaterialGroup;

#elseif (js && flight_esm)

typedef ThreeDsMaterialGroup = flight._js.ThreeDsMaterialGroup;

#elseif js

#error "flight.ThreeDsMaterialGroup on js requires flight_esm."

#else

#error "flight.ThreeDsMaterialGroup: no backend for this target."

#end
