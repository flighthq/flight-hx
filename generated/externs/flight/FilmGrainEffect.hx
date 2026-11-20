package flight;

#if hl

typedef FilmGrainEffect = flight._hl.FilmGrainEffect;

#elseif cpp

typedef FilmGrainEffect = flight._cpp.FilmGrainEffect;

#elseif (js && flight_esm)

typedef FilmGrainEffect = flight._js.FilmGrainEffect;

#elseif js

#error "flight.FilmGrainEffect on js requires flight_esm."

#else

#error "flight.FilmGrainEffect: no backend for this target."

#end
