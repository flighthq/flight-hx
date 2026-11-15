package flight;

#if hl

typedef GridSliceOptions = flight._hl.GridSliceOptions;

#elseif cpp

typedef GridSliceOptions = flight._cpp.GridSliceOptions;

#elseif (js && flight_esm)

typedef GridSliceOptions = flight._js.GridSliceOptions;

#elseif js

#error "flight.GridSliceOptions on js requires flight_esm."

#else

#error "flight.GridSliceOptions: no backend for this target."

#end
