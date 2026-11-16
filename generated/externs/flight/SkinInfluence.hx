package flight;

#if hl

typedef SkinInfluence = flight._hl.SkinInfluence;

#elseif cpp

typedef SkinInfluence = flight._cpp.SkinInfluence;

#elseif (js && flight_esm)

typedef SkinInfluence = flight._js.SkinInfluence;

#elseif js

#error "flight.SkinInfluence on js requires flight_esm."

#else

#error "flight.SkinInfluence: no backend for this target."

#end
