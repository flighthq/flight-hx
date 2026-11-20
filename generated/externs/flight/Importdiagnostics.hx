package flight;

#if (js && flight_esm)
extern inline function collectImportDiagnostics(out:Dynamic, run:Dynamic):Void {
	flight._js._fn.Importdiagnostics.collectImportDiagnostics(out, run);
}
#end
#if (js && flight_esm)
extern inline function formatImportDiagnostic(diagnostic:ImportDiagnostic):String {
	return flight._js._fn.Importdiagnostics.formatImportDiagnostic(diagnostic);
}
#else
extern inline function formatImportDiagnostic(diagnostic:ImportDiagnostic):String {
#if hl
	return cast flight._hl._fn.Importdiagnostics.formatImportDiagnostic(diagnostic);
#elseif cpp
	return cast flight._cpp._fn.Importdiagnostics.formatImportDiagnostic(diagnostic);
#elseif (js && flight_esm)
	return cast flight._js._fn.Importdiagnostics.formatImportDiagnostic(diagnostic);
#else
	#error "flight.Importdiagnostics: no backend for this target."
#end
}
#end
