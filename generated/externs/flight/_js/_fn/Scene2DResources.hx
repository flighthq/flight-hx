package flight._js._fn;

@:jsRequire("@flighthq/scene2d-resources")
extern class Scene2DResources {
	@:native("areScene2DResourceFailureGuardsEnabled")
	public static function areScene2dResourceFailureGuardsEnabled(guardState:Dynamic):Bool;
	@:native("disableScene2DResourceFailureGuards")
	public static function disableScene2dResourceFailureGuards(guardState:Dynamic):Void;
	@:native("enableScene2DResourceFailureGuards")
	public static function enableScene2dResourceFailureGuards(guardState:Dynamic, logState:Dynamic, clock:Dynamic):Void;
	@:native("resolveScene2DResources")
	public static function resolveScene2dResources(out:flight._js.Scene2DResources, document:Dynamic, options:Null<flight._js.ResolveScene2DResourcesOptions>, guardState:Dynamic):Void;
	@:native("createScene2DDocument")
	public static function createScene2dDocument():Dynamic;
	@:native("createScene2DSlotReference")
	public static function createScene2dSlotReference():Dynamic;
	@:native("createScene2DDocumentFromBytes")
	public static function createScene2dDocumentFromBytes(source:Dynamic, registry:flight._js.Scene2DDocumentImporterRegistry, context:Null<flight._js.Scene2DDocumentImportContext>, guardState:Dynamic):Null<Dynamic>;
	@:native("createScene2DDocumentImporterRegistry")
	public static function createScene2dDocumentImporterRegistry():flight._js.Scene2DDocumentImporterRegistry;
	@:native("registerScene2DDocumentImporter")
	public static function registerScene2dDocumentImporter(registry:flight._js.Scene2DDocumentImporterRegistry, kind:String, matches:flight._js.Scene2DDocumentImporterMatcher, importDocument:flight._js.Scene2DDocumentImporter):Void;
	@:native("unregisterScene2DDocumentImporter")
	public static function unregisterScene2dDocumentImporter(registry:flight._js.Scene2DDocumentImporterRegistry, kind:String):Bool;
	@:native("explainScene2DResourceCoverage")
	public static function explainScene2dResourceCoverage(out:flight._js.Scene2DResourceCoverageExplanation, document:flight._js.Scene2DDocument):Void;
	@:native("setScene2DSlotReferenceContent")
	public static function setScene2dSlotReferenceContent(reference:flight._js.Scene2DSlotReference, content:Null<Dynamic>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DdocumentRef(ptr:flight._js.Scene2DDocument):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DdocumentImporterRegistry(ptr:flight._js.Scene2DDocumentImporterRegistry):Void {}
}
