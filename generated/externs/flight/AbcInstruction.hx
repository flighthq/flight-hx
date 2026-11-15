package flight;

#if hl

typedef AbcInstruction = flight._hl.AbcInstruction;

#elseif cpp

typedef AbcInstruction = flight._cpp.AbcInstruction;

#elseif (js && flight_esm)

typedef AbcInstruction = flight._js.AbcInstruction;

#elseif js

#error "flight.AbcInstruction on js requires flight_esm."

#else

#error "flight.AbcInstruction: no backend for this target."

#end
