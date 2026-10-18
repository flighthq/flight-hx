// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/importdiagnostics/contract.hpp")
extern class Attempt_Importdiagnostics_collectImportDiagnostics extends AttemptConfig {
  @:native("flight::importdiagnostics::collect_import_diagnostics")
  public static function collectImportDiagnostics(run:(Array<flight.ImportDiagnostic>)->Void):Array<flight.ImportDiagnostic>;
}
#end
