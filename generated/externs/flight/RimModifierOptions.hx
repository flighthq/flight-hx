package flight;

#if hl

typedef RimModifierOptions = flight._hl.RimModifierOptions;

#elseif cpp

typedef RimModifierOptions = flight._cpp.RimModifierOptions;

#elseif (js && flight_esm)

typedef RimModifierOptions = flight._js.RimModifierOptions;

#elseif js

#error "flight.RimModifierOptions on js requires flight_esm."

#else

#error "flight.RimModifierOptions: no backend for this target."

#end
