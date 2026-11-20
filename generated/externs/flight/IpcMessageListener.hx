package flight;

#if hl

typedef IpcMessageListener = flight._hl.IpcMessageListener;

#elseif cpp

typedef IpcMessageListener = flight._cpp.IpcMessageListener;

#elseif (js && flight_esm)

typedef IpcMessageListener = flight._js.IpcMessageListener;

#elseif js

#error "flight.IpcMessageListener on js requires flight_esm."

#else

#error "flight.IpcMessageListener: no backend for this target."

#end
