// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_ImportDiagnosticSeverity extends AttemptConfig {
  @:native("flight::types::import_diagnostic_severity")
  public static var ImportDiagnosticSeverity:{ Drop:String, Recover:String, Reject:String, Skip:String };
}
#end
