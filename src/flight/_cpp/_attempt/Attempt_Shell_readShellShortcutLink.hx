// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_readShellShortcutLink extends AttemptConfig {
  @:native("flight::shell::read_shell_shortcut_link")
  public static function readShellShortcutLink(hostShellShortcutLink:flight.HostShellShortcutLinkCapability, shortcutPath:String):flight._internal._Promise<flight.ShellShortcutLinkReadOutcome>;
}
#end
