package flight._js._fn;

@:jsRequire("@flighthq/importdiagnostics")
extern class Importdiagnostics {
	@:native("collectImportDiagnostics")
	public static function collectImportDiagnostics(out:Dynamic, run:Dynamic):Void;
	@:native("formatImportDiagnostic")
	public static function formatImportDiagnostic(diagnostic:flight._js.ImportDiagnostic):String;
}
