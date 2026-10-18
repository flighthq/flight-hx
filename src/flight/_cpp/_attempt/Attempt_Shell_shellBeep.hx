// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_shellBeep extends AttemptConfig {
  @:native("flight::shell::shell_beep")
  public static function shellBeep(hostShellBeep:flight.HostShellBeepCapability):Void;
}
#end
