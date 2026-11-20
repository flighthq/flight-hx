package flight._hl._fn;

extern class Ipc {
	@:hlNative("flight", "flight_on_ipc_invoke")
	public static function onIpcInvoke(hostIpcHandle:flight._hl.HostIpcHandleCapability, channel:hl.Bytes, handler:flight._hl.IpcInvokeHandler):flight._hl.IpcUnsubscribe;
	@:hlNative("flight", "flight_on_ipc_message")
	public static function onIpcMessage(hostIpcMessage:flight._hl.HostIpcMessageCapability, channel:hl.Bytes, listener:flight._hl.IpcMessageListener):flight._hl.IpcUnsubscribe;
	@:hlNative("flight", "flight_once_ipc_message")
	public static function onceIpcMessage(hostIpcMessage:flight._hl.HostIpcMessageCapability, channel:hl.Bytes, listener:flight._hl.IpcMessageListener):flight._hl.IpcUnsubscribe;
	@:hlNative("flight", "flight_free_ipc_unsubscribe")
	public static function freeIpcUnsubscribe(ptr:flight._hl.IpcUnsubscribe):Void;
}
