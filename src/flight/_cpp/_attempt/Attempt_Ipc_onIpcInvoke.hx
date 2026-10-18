// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_onIpcInvoke extends AttemptConfig {
  @:native("flight::ipc::on_ipc_invoke")
  public static function onIpcInvoke(hostIpcHandle:flight.HostIpcHandleCapability, channel:String, handler:(Array<Dynamic>)->Dynamic):()->Void;
}
#end
