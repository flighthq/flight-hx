// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/importdiagnostics/contract.hpp")
extern class Attempt_Importdiagnostics_formatImportDiagnostic extends AttemptConfig {
  @:native("flight::importdiagnostics::format_import_diagnostic")
  public static function formatImportDiagnostic(diagnostic:flight.ImportDiagnostic):String;
}
#end
