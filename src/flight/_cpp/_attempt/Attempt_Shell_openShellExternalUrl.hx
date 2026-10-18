// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_openShellExternalUrl extends AttemptConfig {
  @:native("flight::shell::open_shell_external_url")
  public static function openShellExternalUrl(hostShellExternal:flight.HostShellExternalCapability, url:String, policy:flight.ShellExternalUrlPolicy):flight._internal._Promise<flight.ShellExternalOutcome>;
}
#end
