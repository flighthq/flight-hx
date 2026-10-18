// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_writeShellShortcutLink extends AttemptConfig {
  @:native("flight::shell::write_shell_shortcut_link")
  public static function writeShellShortcutLink(hostShellShortcutLink:flight.HostShellShortcutLinkCapability, shortcutPath:String, link:flight.ShellShortcutLink, operation:flight.ShellShortcutWriteOperation):flight._internal._Promise<flight.ShellShortcutLinkWriteOutcome>;
}
#end
