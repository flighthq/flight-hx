package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/importdiagnostics")
extern class Importdiagnostics {
  public static function collectImportDiagnostics(run:((sink:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>) -> Void)):Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>;
  public static function formatImportDiagnostic(diagnostic:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic):String;
  public static function reportImportDiagnostic(sink:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity, kind:String, origin:String, ?detail:Dynamic):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
