package flight;

#if hl

typedef PosterizeEffect = flight._hl.PosterizeEffect;

#elseif cpp

typedef PosterizeEffect = flight._cpp.PosterizeEffect;

#elseif (js && flight_esm)

typedef PosterizeEffect = flight._js.PosterizeEffect;

#elseif js

#error "flight.PosterizeEffect on js requires flight_esm."

#else

#error "flight.PosterizeEffect: no backend for this target."

#end
