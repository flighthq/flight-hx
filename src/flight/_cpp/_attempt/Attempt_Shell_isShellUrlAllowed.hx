// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_isShellUrlAllowed extends AttemptConfig {
  @:native("flight::shell::is_shell_url_allowed")
  public static function isShellUrlAllowed(url:String, policy:flight.ShellExternalUrlPolicy):Bool;
}
#end
