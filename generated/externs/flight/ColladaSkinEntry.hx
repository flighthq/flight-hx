package flight;

#if hl

typedef ColladaSkinEntry = flight._hl.ColladaSkinEntry;

#elseif cpp

typedef ColladaSkinEntry = flight._cpp.ColladaSkinEntry;

#elseif (js && flight_esm)

typedef ColladaSkinEntry = flight._js.ColladaSkinEntry;

#elseif js

#error "flight.ColladaSkinEntry on js requires flight_esm."

#else

#error "flight.ColladaSkinEntry: no backend for this target."

#end
