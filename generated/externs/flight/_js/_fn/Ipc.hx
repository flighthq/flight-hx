package flight._js._fn;

@:jsRequire("@flighthq/ipc")
extern class Ipc {
	@:native("onIpcInvoke")
	public static function onIpcInvoke(hostIpcHandle:flight._js.HostIpcHandleCapability, channel:String, handler:flight._js.IpcInvokeHandler):flight._js.IpcUnsubscribe;
	@:native("onIpcMessage")
	public static function onIpcMessage(hostIpcMessage:flight._js.HostIpcMessageCapability, channel:String, listener:flight._js.IpcMessageListener):flight._js.IpcUnsubscribe;
	@:native("onceIpcMessage")
	public static function onceIpcMessage(hostIpcMessage:flight._js.HostIpcMessageCapability, channel:String, listener:flight._js.IpcMessageListener):flight._js.IpcUnsubscribe;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeIpcUnsubscribe(ptr:flight._js.IpcUnsubscribe):Void {}
}
