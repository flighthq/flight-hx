// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_onIpcMessage extends AttemptConfig {
  @:native("flight::ipc::on_ipc_message")
  public static function onIpcMessage(hostIpcMessage:flight.HostIpcMessageCapability, channel:String, listener:(Array<Dynamic>)->Void):()->Void;
}
#end
