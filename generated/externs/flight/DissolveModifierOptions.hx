package flight;

#if hl

typedef DissolveModifierOptions = flight._hl.DissolveModifierOptions;

#elseif cpp

typedef DissolveModifierOptions = flight._cpp.DissolveModifierOptions;

#elseif (js && flight_esm)

typedef DissolveModifierOptions = flight._js.DissolveModifierOptions;

#elseif js

#error "flight.DissolveModifierOptions on js requires flight_esm."

#else

#error "flight.DissolveModifierOptions: no backend for this target."

#end
