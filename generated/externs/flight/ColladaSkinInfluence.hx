package flight;

#if hl

typedef ColladaSkinInfluence = flight._hl.ColladaSkinInfluence;

#elseif cpp

typedef ColladaSkinInfluence = flight._cpp.ColladaSkinInfluence;

#elseif (js && flight_esm)

typedef ColladaSkinInfluence = flight._js.ColladaSkinInfluence;

#elseif js

#error "flight.ColladaSkinInfluence on js requires flight_esm."

#else

#error "flight.ColladaSkinInfluence: no backend for this target."

#end
