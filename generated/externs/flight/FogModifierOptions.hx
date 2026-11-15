package flight;

#if hl

typedef FogModifierOptions = flight._hl.FogModifierOptions;

#elseif cpp

typedef FogModifierOptions = flight._cpp.FogModifierOptions;

#elseif (js && flight_esm)

typedef FogModifierOptions = flight._js.FogModifierOptions;

#elseif js

#error "flight.FogModifierOptions on js requires flight_esm."

#else

#error "flight.FogModifierOptions: no backend for this target."

#end
