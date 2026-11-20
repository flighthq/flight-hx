package flight._hl._fn;

extern class Scene2DResources {
	@:hlNative("flight", "flight_are_scene2d_resource_failure_guards_enabled")
	public static function areScene2dResourceFailureGuardsEnabled(guardState:hl.Bytes):Bool;
	@:hlNative("flight", "flight_disable_scene2d_resource_failure_guards")
	public static function disableScene2dResourceFailureGuards(guardState:hl.Bytes):Void;
	@:hlNative("flight", "flight_resolve_scene2d_resources")
	public static function resolveScene2dResources(out:flight._hl.Scene2DResources, document:hl.Bytes, options:flight._hl.ResolveScene2DResourcesOptions, guardState:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_scene2d_document")
	public static function createScene2dDocument():hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d_slot_reference")
	public static function createScene2dSlotReference():hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d_document_from_bytes")
	public static function createScene2dDocumentFromBytes(source:hl.Bytes, sourceLen:Int, registry:flight._hl.Scene2DDocumentImporterRegistry, context:flight._hl.Scene2DDocumentImportContext, guardState:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d_document_importer_registry")
	public static function createScene2dDocumentImporterRegistry():flight._hl.Scene2DDocumentImporterRegistry;
	@:hlNative("flight", "flight_register_scene2d_document_importer")
	public static function registerScene2dDocumentImporter(registry:flight._hl.Scene2DDocumentImporterRegistry, kind:hl.Bytes, matches:flight._hl.Scene2DDocumentImporterMatcher, importDocument:flight._hl.Scene2DDocumentImporter):Void;
	@:hlNative("flight", "flight_unregister_scene2d_document_importer")
	public static function unregisterScene2dDocumentImporter(registry:flight._hl.Scene2DDocumentImporterRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_explain_scene2d_resource_coverage")
	public static function explainScene2dResourceCoverage(out:flight._hl.Scene2DResourceCoverageExplanation, document:flight._hl.Scene2DDocument):Void;
	@:hlNative("flight", "flight_set_scene2d_slot_reference_content")
	public static function setScene2dSlotReferenceContent(reference:flight._hl.Scene2DSlotReference, content:Null<flight._hl.FlightNode>):Void;
	@:hlNative("flight", "flight_free_scene2_ddocument_ref")
	public static function freeScene2DdocumentRef(ptr:flight._hl.Scene2DDocument):Void;
	@:hlNative("flight", "flight_free_scene2_ddocument_importer_registry")
	public static function freeScene2DdocumentImporterRegistry(ptr:flight._hl.Scene2DDocumentImporterRegistry):Void;
}
