// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function invokeIpc(hostIpcInvoke:flight.HostIpcInvokeCapability, channel:String, ...args:Dynamic):flight._internal._Promise<Dynamic> {
  return flight._cpp._attempt.Attempt_Ipc_invokeIpc.invokeIpc(hostIpcInvoke, channel, ...args);
}

extern inline function onIpcInvoke(hostIpcHandle:flight.HostIpcHandleCapability, channel:String, handler:(Array<Dynamic>)->Dynamic):()->Void {
  return flight._cpp._attempt.Attempt_Ipc_onIpcInvoke.onIpcInvoke(hostIpcHandle, channel, handler);
}

extern inline function onIpcMessage(hostIpcMessage:flight.HostIpcMessageCapability, channel:String, listener:(Array<Dynamic>)->Void):()->Void {
  return flight._cpp._attempt.Attempt_Ipc_onIpcMessage.onIpcMessage(hostIpcMessage, channel, listener);
}

extern inline function onceIpcMessage(hostIpcMessage:flight.HostIpcMessageCapability, channel:String, listener:(Array<Dynamic>)->Void):()->Void {
  return flight._cpp._attempt.Attempt_Ipc_onceIpcMessage.onceIpcMessage(hostIpcMessage, channel, listener);
}

extern inline function sendIpcMessage(hostIpcSend:flight.HostIpcSendCapability, channel:String, ...args:Dynamic):Void {
  flight._cpp._attempt.Attempt_Ipc_sendIpcMessage.sendIpcMessage(hostIpcSend, channel, ...args);
}

extern inline function sendIpcMessageTo<Target>(hostIpcTargetedSend:flight.HostIpcTargetedSendCapability<Target>, target:Target, channel:String, ...args:Dynamic):Void {
  flight._cpp._attempt.Attempt_Ipc_sendIpcMessageTo.sendIpcMessageTo(hostIpcTargetedSend, target, channel, ...args);
}
