// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function collectImportDiagnostics(run:(Array<flight.ImportDiagnostic>)->Void):Array<flight.ImportDiagnostic> {
  return flight._cpp._attempt.Attempt_Importdiagnostics_collectImportDiagnostics.collectImportDiagnostics(run);
}

extern inline function formatImportDiagnostic(diagnostic:flight.ImportDiagnostic):String {
  return flight._cpp._attempt.Attempt_Importdiagnostics_formatImportDiagnostic.formatImportDiagnostic(diagnostic);
}

extern inline function reportImportDiagnostic(sink:Null<Array<flight.ImportDiagnostic>>, severity:flight.ImportDiagnosticSeverity, kind:String, origin:String, ?detail:haxe.DynamicAccess<Dynamic>):Void {
  flight._cpp._attempt.Attempt_Importdiagnostics_reportImportDiagnostic.reportImportDiagnostic(sink, severity, kind, origin, detail);
}
