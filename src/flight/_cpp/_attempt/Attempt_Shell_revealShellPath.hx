// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_revealShellPath extends AttemptConfig {
  @:native("flight::shell::reveal_shell_path")
  public static function revealShellPath(hostShellPathReveal:flight.HostShellPathRevealCapability, path:String):flight._internal._Promise<flight.ShellPathRevealOutcome>;
}
#end
