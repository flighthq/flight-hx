package flight;

#if hl

typedef AppLifecycle = flight._hl.AppLifecycle;

#elseif cpp

typedef AppLifecycle = flight._cpp.AppLifecycle;

#elseif (js && flight_esm)

typedef AppLifecycle = flight._js.AppLifecycle;

#elseif js

#error "flight.AppLifecycle on js requires flight_esm."

#else

#error "flight.AppLifecycle: no backend for this target."

#end
