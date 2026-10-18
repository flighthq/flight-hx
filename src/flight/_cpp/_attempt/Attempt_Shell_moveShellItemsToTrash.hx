// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_moveShellItemsToTrash extends AttemptConfig {
  @:native("flight::shell::move_shell_items_to_trash")
  public static function moveShellItemsToTrash(hostShellTrash:flight.HostShellTrashCapability, paths:Array<String>):flight._internal._Promise<Array<flight.ShellTrashOutcome>>;
}
#end
