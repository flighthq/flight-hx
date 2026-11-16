package flight;

#if hl

typedef ThreeDsDropTally = flight._hl.ThreeDsDropTally;

#elseif cpp

typedef ThreeDsDropTally = flight._cpp.ThreeDsDropTally;

#elseif (js && flight_esm)

typedef ThreeDsDropTally = flight._js.ThreeDsDropTally;

#elseif js

#error "flight.ThreeDsDropTally on js requires flight_esm."

#else

#error "flight.ThreeDsDropTally: no backend for this target."

#end
