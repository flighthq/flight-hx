package flight;

#if hl

typedef EmissiveModifierOptions = flight._hl.EmissiveModifierOptions;

#elseif cpp

typedef EmissiveModifierOptions = flight._cpp.EmissiveModifierOptions;

#elseif (js && flight_esm)

typedef EmissiveModifierOptions = flight._js.EmissiveModifierOptions;

#elseif js

#error "flight.EmissiveModifierOptions on js requires flight_esm."

#else

#error "flight.EmissiveModifierOptions: no backend for this target."

#end
