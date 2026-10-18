// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_openShellPath extends AttemptConfig {
  @:native("flight::shell::open_shell_path")
  public static function openShellPath(hostShellPathOpen:flight.HostShellPathOpenCapability, path:String):flight._internal._Promise<flight.ShellPathOpenOutcome>;
}
#end
