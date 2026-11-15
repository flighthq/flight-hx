package flight;

#if hl

typedef BinPackOptions = flight._hl.BinPackOptions;

#elseif cpp

typedef BinPackOptions = flight._cpp.BinPackOptions;

#elseif (js && flight_esm)

typedef BinPackOptions = flight._js.BinPackOptions;

#elseif js

#error "flight.BinPackOptions on js requires flight_esm."

#else

#error "flight.BinPackOptions: no backend for this target."

#end
