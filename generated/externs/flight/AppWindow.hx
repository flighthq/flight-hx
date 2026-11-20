package flight;

#if hl

typedef AppWindow = flight._hl.AppWindow;

#elseif cpp

typedef AppWindow = flight._cpp.AppWindow;

#elseif (js && flight_esm)

typedef AppWindow = flight._js.AppWindow;

#elseif js

#error "flight.AppWindow on js requires flight_esm."

#else

#error "flight.AppWindow: no backend for this target."

#end
