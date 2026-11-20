package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/scene2d-resources")
extern class Scene2DResources {
  public static function areScene2DResourceFailureGuardsEnabled():Bool;
  public static function createScene2DDocument(root:flight.esm.types.scene2d_contract.Types.Node2D, ?slots:Array<flight.esm.types.scene2d_contract.Types.Scene2DSlotReference>, ?sourceKind:Null<String>, ?backgroundColor:Null<Float>, ?imageResources:Array<flight.esm.types.image.Types.ImageResourceReference>, ?audioResources:Array<flight.esm.types.audio.Types.AudioResourceReference>):flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument;
  public static function createScene2DDocumentFromBytes(source:js.lib.Uint8Array, registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry, ?context:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImportContext):Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument>;
  public static function createScene2DDocumentImporterRegistry():flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry;
  public static function createScene2DSlotReference(name:String, target:flight.esm.types.scene2d_contract.Types.Node2D, ?linkage:Null<String>, ?required:Bool):flight.esm.types.scene2d_contract.Types.Scene2DSlotReference;
  public static function disableScene2DResourceFailureGuards():Void;
  public static function enableScene2DResourceFailureGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainScene2DResourceCoverage(document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument):flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceCoverageExplanation;
  public static function loadScene2DAudioResources(document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, ?options:Null<flight.esm.types.scene2d_resources_contract.Types.LoadScene2DAudioResourcesOptions>):js.lib.Promise<flight.esm.types.scene2d_resources_contract.Types.Scene2DAudioResources>;
  public static function loadScene2DDocumentFromUrl(url:String, registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry, fetchDocument:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentFetcher, ?options:Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentLoadOptions>):js.lib.Promise<Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument>>;
  public static function loadScene2DImageResources(imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, ?options:Null<flight.esm.types.scene2d_resources_contract.Types.LoadScene2DImageResourcesOptions>):js.lib.Promise<flight.esm.types.scene2d_resources_contract.Types.Scene2DImageResources>;
  public static function registerLottieScene2DDocumentImporter(registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry):Void;
  public static function registerRiveScene2DDocumentImporter(pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry):Void;
  public static function registerScene2DDocumentImporter(registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry, kind:String, matches:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterMatcher, importDocument:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporter):Void;
  public static function registerSvgScene2DDocumentImporter(registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry):Void;
  public static function resolveScene2DResources(document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, ?options:Null<flight.esm.types.scene2d_resources_contract.Types.ResolveScene2DResourcesOptions>):flight.esm.types.scene2d_resources_contract.Types.Scene2DResources;
  public static function setScene2DSlotReferenceContent(reference:flight.esm.types.scene2d_contract.Types.Scene2DSlotReference, content:Null<flight.esm.types.scene2d_contract.Types.Node2D>):Void;
  public static function unregisterScene2DDocumentImporter(registry:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry, kind:String):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
