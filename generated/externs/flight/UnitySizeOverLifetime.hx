package flight;

#if hl

typedef UnitySizeOverLifetime = flight._hl.UnitySizeOverLifetime;

#elseif cpp

typedef UnitySizeOverLifetime = flight._cpp.UnitySizeOverLifetime;

#elseif (js && flight_esm)

typedef UnitySizeOverLifetime = flight._js.UnitySizeOverLifetime;

#elseif js

#error "flight.UnitySizeOverLifetime on js requires flight_esm."

#else

#error "flight.UnitySizeOverLifetime: no backend for this target."

#end
