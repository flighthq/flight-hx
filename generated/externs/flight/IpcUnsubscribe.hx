package flight;

#if hl

typedef IpcUnsubscribe = flight._hl.IpcUnsubscribe;

#elseif cpp

typedef IpcUnsubscribe = flight._cpp.IpcUnsubscribe;

#elseif (js && flight_esm)

typedef IpcUnsubscribe = flight._js.IpcUnsubscribe;

#elseif js

#error "flight.IpcUnsubscribe on js requires flight_esm."

#else

#error "flight.IpcUnsubscribe: no backend for this target."

#end
