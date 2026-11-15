package flight;

#if hl

typedef DisplayObjectRuntime = flight._hl.DisplayObjectRuntime;

#elseif cpp

typedef DisplayObjectRuntime = flight._cpp.DisplayObjectRuntime;

#elseif (js && flight_esm)

typedef DisplayObjectRuntime = flight._js.DisplayObjectRuntime;

#elseif js

#error "flight.DisplayObjectRuntime on js requires flight_esm."

#else

#error "flight.DisplayObjectRuntime: no backend for this target."

#end
