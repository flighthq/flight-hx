// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/ipc/contract.hpp")
extern class Attempt_Ipc_sendIpcMessage extends AttemptConfig {
  @:native("flight::ipc::send_ipc_message")
  public static function sendIpcMessage(hostIpcSend:flight.HostIpcSendCapability, channel:String, ...args:Dynamic):Void;
}
#end
