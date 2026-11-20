package flight;

#if hl

typedef Scene3DResourceSignals = flight._hl.Scene3DResourceSignals;

#elseif cpp

typedef Scene3DResourceSignals = flight._cpp.Scene3DResourceSignals;

#elseif (js && flight_esm)

typedef Scene3DResourceSignals = flight._js.Scene3DResourceSignals;

#elseif js

#error "flight.Scene3DResourceSignals on js requires flight_esm."

#else

#error "flight.Scene3DResourceSignals: no backend for this target."

#end
