// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/shell/contract.hpp")
extern class Attempt_Shell_spawnShellProcess extends AttemptConfig {
  @:native("flight::shell::spawn_shell_process")
  public static function spawnShellProcess(hostShellProcess:flight.HostShellProcessCapability, command:String, args:Array<String>, ?options:flight.ShellProcessOptions):flight.ShellProcess;
}
#end
