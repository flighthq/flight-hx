package flight._cpp._fn;

extern class Ipc {
	@:native("flight_on_ipc_invoke")
	public static function onIpcInvoke(hostIpcHandle:flight._cpp.HostIpcHandleCapability, channel:cpp.ConstCharStar, handler:flight._cpp.IpcInvokeHandler):flight._cpp.IpcUnsubscribe;
	@:native("flight_on_ipc_message")
	public static function onIpcMessage(hostIpcMessage:flight._cpp.HostIpcMessageCapability, channel:cpp.ConstCharStar, listener:flight._cpp.IpcMessageListener):flight._cpp.IpcUnsubscribe;
	@:native("flight_once_ipc_message")
	public static function onceIpcMessage(hostIpcMessage:flight._cpp.HostIpcMessageCapability, channel:cpp.ConstCharStar, listener:flight._cpp.IpcMessageListener):flight._cpp.IpcUnsubscribe;
	@:native("flight_free_ipc_unsubscribe")
	public static function freeIpcUnsubscribe(ptr:flight._cpp.IpcUnsubscribe):Void;
}
