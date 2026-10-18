// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_onceIpcMessage extends AttemptConfig {
  @:native("flight::ipc::once_ipc_message")
  public static function onceIpcMessage(hostIpcMessage:flight.HostIpcMessageCapability, channel:String, listener:(Array<Dynamic>)->Void):()->Void;
}
#end
