package flight;

#if hl

typedef Scene3DHit = flight._hl.Scene3DHit;

#elseif cpp

typedef Scene3DHit = flight._cpp.Scene3DHit;

#elseif (js && flight_esm)

typedef Scene3DHit = flight._js.Scene3DHit;

#elseif js

#error "flight.Scene3DHit on js requires flight_esm."

#else

#error "flight.Scene3DHit: no backend for this target."

#end
