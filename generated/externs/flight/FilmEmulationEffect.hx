package flight;

#if hl

typedef FilmEmulationEffect = flight._hl.FilmEmulationEffect;

#elseif cpp

typedef FilmEmulationEffect = flight._cpp.FilmEmulationEffect;

#elseif (js && flight_esm)

typedef FilmEmulationEffect = flight._js.FilmEmulationEffect;

#elseif js

#error "flight.FilmEmulationEffect on js requires flight_esm."

#else

#error "flight.FilmEmulationEffect: no backend for this target."

#end
