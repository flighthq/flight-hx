package flight;

#if (js && flight_esm)
extern inline function onIpcInvoke(hostIpcHandle:HostIpcHandleCapability, channel:String, handler:IpcInvokeHandler):IpcUnsubscribe {
	return flight._js._fn.Ipc.onIpcInvoke(hostIpcHandle, channel, handler);
}
#else
extern inline function onIpcInvoke(hostIpcHandle:HostIpcHandleCapability, channel:String, handler:IpcInvokeHandler):IpcUnsubscribe {
#if hl
	return flight._hl._fn.Ipc.onIpcInvoke(hostIpcHandle, cast channel, handler);
#elseif cpp
	return flight._cpp._fn.Ipc.onIpcInvoke(hostIpcHandle, cast channel, handler);
#elseif (js && flight_esm)
	return flight._js._fn.Ipc.onIpcInvoke(hostIpcHandle, channel, handler);
#else
	#error "flight.Ipc: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function onIpcMessage(hostIpcMessage:HostIpcMessageCapability, channel:String, listener:IpcMessageListener):IpcUnsubscribe {
	return flight._js._fn.Ipc.onIpcMessage(hostIpcMessage, channel, listener);
}
#else
extern inline function onIpcMessage(hostIpcMessage:HostIpcMessageCapability, channel:String, listener:IpcMessageListener):IpcUnsubscribe {
#if hl
	return flight._hl._fn.Ipc.onIpcMessage(hostIpcMessage, cast channel, listener);
#elseif cpp
	return flight._cpp._fn.Ipc.onIpcMessage(hostIpcMessage, cast channel, listener);
#elseif (js && flight_esm)
	return flight._js._fn.Ipc.onIpcMessage(hostIpcMessage, channel, listener);
#else
	#error "flight.Ipc: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function onceIpcMessage(hostIpcMessage:HostIpcMessageCapability, channel:String, listener:IpcMessageListener):IpcUnsubscribe {
	return flight._js._fn.Ipc.onceIpcMessage(hostIpcMessage, channel, listener);
}
#else
extern inline function onceIpcMessage(hostIpcMessage:HostIpcMessageCapability, channel:String, listener:IpcMessageListener):IpcUnsubscribe {
#if hl
	return flight._hl._fn.Ipc.onceIpcMessage(hostIpcMessage, cast channel, listener);
#elseif cpp
	return flight._cpp._fn.Ipc.onceIpcMessage(hostIpcMessage, cast channel, listener);
#elseif (js && flight_esm)
	return flight._js._fn.Ipc.onceIpcMessage(hostIpcMessage, channel, listener);
#else
	#error "flight.Ipc: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeIpcUnsubscribe(ptr:IpcUnsubscribe):Void {
	flight._js._fn.Ipc.freeIpcUnsubscribe(ptr);
}
#else
extern inline function freeIpcUnsubscribe(ptr:IpcUnsubscribe):Void {
#if hl
	flight._hl._fn.Ipc.freeIpcUnsubscribe(ptr);
#elseif cpp
	flight._cpp._fn.Ipc.freeIpcUnsubscribe(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Ipc.freeIpcUnsubscribe(ptr);
#else
	#error "flight.Ipc: no backend for this target."
#end
}
#end
