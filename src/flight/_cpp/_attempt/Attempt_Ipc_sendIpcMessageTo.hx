// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_sendIpcMessageTo extends AttemptConfig {
  @:native("flight::ipc::send_ipc_message_to")
  public static function sendIpcMessageTo<Target>(hostIpcTargetedSend:flight.HostIpcTargetedSendCapability<Target>, target:Target, channel:String, ...args:Dynamic):Void;
}
#end
