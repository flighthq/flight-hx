// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/importdiagnostics/contract.hpp")
extern class Attempt_Importdiagnostics_reportImportDiagnostic extends AttemptConfig {
  @:native("flight::importdiagnostics::report_import_diagnostic")
  public static function reportImportDiagnostic(sink:Null<Array<flight.ImportDiagnostic>>, severity:flight.ImportDiagnosticSeverity, kind:String, origin:String, ?detail:haxe.DynamicAccess<Dynamic>):Void;
}
#end
