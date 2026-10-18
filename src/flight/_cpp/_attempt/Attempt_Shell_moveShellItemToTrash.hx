// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_moveShellItemToTrash extends AttemptConfig {
  @:native("flight::shell::move_shell_item_to_trash")
  public static function moveShellItemToTrash(hostShellTrash:flight.HostShellTrashCapability, path:String):flight._internal._Promise<flight.ShellTrashOutcome>;
}
#end
