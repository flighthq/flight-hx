package flight;

#if hl

typedef FilmicToneMapOptions = flight._hl.FilmicToneMapOptions;

#elseif cpp

typedef FilmicToneMapOptions = flight._cpp.FilmicToneMapOptions;

#elseif (js && flight_esm)

typedef FilmicToneMapOptions = flight._js.FilmicToneMapOptions;

#elseif js

#error "flight.FilmicToneMapOptions on js requires flight_esm."

#else

#error "flight.FilmicToneMapOptions: no backend for this target."

#end
