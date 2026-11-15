package flight;

#if hl

typedef ToonModifierOptions = flight._hl.ToonModifierOptions;

#elseif cpp

typedef ToonModifierOptions = flight._cpp.ToonModifierOptions;

#elseif (js && flight_esm)

typedef ToonModifierOptions = flight._js.ToonModifierOptions;

#elseif js

#error "flight.ToonModifierOptions on js requires flight_esm."

#else

#error "flight.ToonModifierOptions: no backend for this target."

#end
