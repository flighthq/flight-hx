package flight;

#if hl

typedef Scene2DRuntime = flight._hl.Scene2DRuntime;

#elseif cpp

typedef Scene2DRuntime = flight._cpp.Scene2DRuntime;

#elseif (js && flight_esm)

typedef Scene2DRuntime = flight._js.Scene2DRuntime;

#elseif js

#error "flight.Scene2DRuntime on js requires flight_esm."

#else

#error "flight.Scene2DRuntime: no backend for this target."

#end
