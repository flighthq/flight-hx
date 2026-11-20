package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/ipc")
extern class Ipc {
  public static function invokeIpc(hostIpcInvoke:flight.esm.types.ipc.Types.HostIpcInvokeCapability, channel:String, ...args:Dynamic):js.lib.Promise<Dynamic>;
  public static function onIpcInvoke(hostIpcHandle:flight.esm.types.ipc.Types.HostIpcHandleCapability, channel:String, handler:Dynamic):(() -> Void);
  public static function onIpcMessage(hostIpcMessage:flight.esm.types.ipc.Types.HostIpcMessageCapability, channel:String, listener:Dynamic):(() -> Void);
  public static function onceIpcMessage(hostIpcMessage:flight.esm.types.ipc.Types.HostIpcMessageCapability, channel:String, listener:Dynamic):(() -> Void);
  public static function sendIpcMessage(hostIpcSend:flight.esm.types.ipc.Types.HostIpcSendCapability, channel:String, ...args:Dynamic):Void;
  public static function sendIpcMessageTo<Target>(hostIpcTargetedSend:flight.esm.types.ipc.Types.HostIpcTargetedSendCapability<Target>, target:Dynamic, channel:String, ...args:Dynamic):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
