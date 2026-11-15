package flight;

#if hl

typedef RiveCoreObject = flight._hl.RiveCoreObject;

#elseif cpp

typedef RiveCoreObject = flight._cpp.RiveCoreObject;

#elseif (js && flight_esm)

typedef RiveCoreObject = flight._js.RiveCoreObject;

#elseif js

#error "flight.RiveCoreObject on js requires flight_esm."

#else

#error "flight.RiveCoreObject: no backend for this target."

#end
