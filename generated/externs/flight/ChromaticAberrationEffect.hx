package flight;

#if hl

typedef ChromaticAberrationEffect = flight._hl.ChromaticAberrationEffect;

#elseif cpp

typedef ChromaticAberrationEffect = flight._cpp.ChromaticAberrationEffect;

#elseif (js && flight_esm)

typedef ChromaticAberrationEffect = flight._js.ChromaticAberrationEffect;

#elseif js

#error "flight.ChromaticAberrationEffect on js requires flight_esm."

#else

#error "flight.ChromaticAberrationEffect: no backend for this target."

#end
