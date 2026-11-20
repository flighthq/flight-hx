package flight;

#if hl

typedef IpcInvokeHandler = flight._hl.IpcInvokeHandler;

#elseif cpp

typedef IpcInvokeHandler = flight._cpp.IpcInvokeHandler;

#elseif (js && flight_esm)

typedef IpcInvokeHandler = flight._js.IpcInvokeHandler;

#elseif js

#error "flight.IpcInvokeHandler on js requires flight_esm."

#else

#error "flight.IpcInvokeHandler: no backend for this target."

#end
