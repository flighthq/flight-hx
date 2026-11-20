package flight.esm.types.importdiagnostics_contract;

#if (js && flight_esm)
typedef ImportDiagnostic = { ?detail:Dynamic, kind:String, origin:String, severity:flight.esm.types.importdiagnostics_contract.Types.ImportDiagnosticSeverity };

typedef ImportDiagnosticSeverity = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
