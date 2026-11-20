package flight._cpp._fn;

extern class Scene2DResources {
	@:native("flight_are_scene2d_resource_failure_guards_enabled")
	public static function areScene2dResourceFailureGuardsEnabled(guardState:cpp.Star<cpp.Void>):Bool;
	@:native("flight_disable_scene2d_resource_failure_guards")
	public static function disableScene2dResourceFailureGuards(guardState:cpp.Star<cpp.Void>):Void;
	@:native("flight_resolve_scene2d_resources")
	public static function resolveScene2dResources(out:flight._cpp.Scene2DResources, document:cpp.Star<cpp.Void>, options:flight._cpp.ResolveScene2DResourcesOptions, guardState:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_scene2d_document")
	public static function createScene2dDocument():cpp.Star<cpp.Void>;
	@:native("flight_create_scene2d_slot_reference")
	public static function createScene2dSlotReference():cpp.Star<cpp.Void>;
	@:native("flight_create_scene2d_document_from_bytes")
	public static function createScene2dDocumentFromBytes(source:cpp.Star<cpp.Void>, sourceLen:Int, registry:flight._cpp.Scene2DDocumentImporterRegistry, context:flight._cpp.Scene2DDocumentImportContext, guardState:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_scene2d_document_importer_registry")
	public static function createScene2dDocumentImporterRegistry():flight._cpp.Scene2DDocumentImporterRegistry;
	@:native("flight_register_scene2d_document_importer")
	public static function registerScene2dDocumentImporter(registry:flight._cpp.Scene2DDocumentImporterRegistry, kind:cpp.ConstCharStar, matches:flight._cpp.Scene2DDocumentImporterMatcher, importDocument:flight._cpp.Scene2DDocumentImporter):Void;
	@:native("flight_unregister_scene2d_document_importer")
	public static function unregisterScene2dDocumentImporter(registry:flight._cpp.Scene2DDocumentImporterRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_explain_scene2d_resource_coverage")
	public static function explainScene2dResourceCoverage(out:flight._cpp.Scene2DResourceCoverageExplanation, document:flight._cpp.Scene2DDocument):Void;
	@:native("flight_set_scene2d_slot_reference_content")
	public static function setScene2dSlotReferenceContent(reference:flight._cpp.Scene2DSlotReference, content:Null<flight._cpp.FlightNode>):Void;
	@:native("flight_free_scene2_ddocument_ref")
	public static function freeScene2DdocumentRef(ptr:flight._cpp.Scene2DDocument):Void;
	@:native("flight_free_scene2_ddocument_importer_registry")
	public static function freeScene2DdocumentImporterRegistry(ptr:flight._cpp.Scene2DDocumentImporterRegistry):Void;
}
