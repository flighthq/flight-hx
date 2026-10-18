// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_invokeIpc extends AttemptConfig {
  @:native("flight::ipc::invoke_ipc")
  public static function invokeIpc(hostIpcInvoke:flight.HostIpcInvokeCapability, channel:String, ...args:Dynamic):flight._internal._Promise<Dynamic>;
}
#end
