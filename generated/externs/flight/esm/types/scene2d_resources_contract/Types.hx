package flight.esm.types.scene2d_resources_contract;

#if (js && flight_esm)
typedef LoadScene2DAudioResourcesOptions = { ?audioDecode:Null<flight.esm.types.audio.Types.HostAudioDecodeCapabilities>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>, ?fetch:Null<flight.esm.types.audio.Types.AudioResourceFetch>, ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene2d_resources_contract.Types.Scene2DAudioResourceLoadProgress>>, ?select:Null<((reference:flight.esm.types.audio.Types.AudioResourceReference) -> Bool)>, ?signal:Null<js.html.AbortSignal> };

typedef LoadScene2DImageResourcesOptions = { ?decode:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeFallback>, ?fetch:Null<flight.esm.types.image.Types.ImageResourceFetch>, ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene2d_resources_contract.Types.Scene2DImageResourceLoadProgress>>, ?select:Null<((reference:flight.esm.types.image.Types.ImageResourceReference) -> Bool)>, ?signal:Null<js.html.AbortSignal> };

typedef ResolveScene2DResourcesOptions = { ?resolveSlotContent:Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DSlotContentResolver>, ?select:Null<((reference:flight.esm.types.scene2d_contract.Types.Scene2DSlotReference) -> Bool)> };

typedef Scene2DAudioResourceLoadProgress = { loaded:Float, reference:flight.esm.types.audio.Types.AudioResourceReference, total:Float };

typedef Scene2DAudioResources = { document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, resolved:Array<flight.esm.types.audio.Types.AudioResourceReference>, unresolved:Array<flight.esm.types.audio.Types.AudioResourceReference> };

typedef Scene2DDocument = { audioResources:Array<flight.esm.types.audio.Types.AudioResourceReference>, backgroundColor:Null<Float>, imageResources:Array<flight.esm.types.image.Types.ImageResourceReference>, root:flight.esm.types.scene2d_contract.Types.Node2D, slots:Array<flight.esm.types.scene2d_contract.Types.Scene2DSlotReference>, sourceKind:Null<String> };

typedef Scene2DDocumentFetchProgress = { loaded:Float, total:Float, url:String };

typedef Scene2DDocumentFetcher = ((url:String, signal:js.html.AbortSignal, progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentFetchProgress>>) -> js.lib.Promise<Null<js.lib.Uint8Array>>);

typedef Scene2DDocumentImportContext = { mimeType:Null<String>, url:Null<String> };

typedef Scene2DDocumentImporter = ((source:js.lib.Uint8Array, context:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImportContext) -> Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument>);

typedef Scene2DDocumentImporterEntry = { importDocument:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporter, kind:String, matches:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterMatcher };

typedef Scene2DDocumentImporterMatcher = ((source:js.lib.Uint8Array, context:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImportContext) -> Bool);

typedef Scene2DDocumentImporterRegistry = { entries:Array<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterEntry> };

typedef Scene2DDocumentLoadOptions = { ?mimeType:Null<String>, ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentFetchProgress>>, ?signal:Null<js.html.AbortSignal> };

typedef Scene2DImageResourceLoadProgress = { loaded:Float, reference:flight.esm.types.image.Types.ImageResourceReference, total:Float };

typedef Scene2DImageResources = { document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, resolved:Array<flight.esm.types.image.Types.ImageResourceReference>, unresolved:Array<flight.esm.types.image.Types.ImageResourceReference> };

typedef Scene2DResourceCoverageCount = { resolved:Float, total:Float };

typedef Scene2DResourceCoverageExplanation = { audioResources:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceCoverageCount, complete:Bool, imageResources:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceCoverageCount, requiredSlots:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceCoverageCount };

typedef Scene2DResourceFailureGuard = ((notice:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceFailureNotice) -> Void);

typedef Scene2DResourceFailureNotice = { operation:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceFailureOperation, reason:flight.esm.types.scene2d_resources_contract.Types.Scene2DResourceFailureReason, total:Float, unresolved:Float, url:Null<String> };

typedef Scene2DResourceFailureOperation = String;

typedef Scene2DResourceFailureReason = String;

typedef Scene2DResources = { document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, resolved:Array<flight.esm.types.scene2d_resources_contract.Types.Scene2DSlotResolution>, root:flight.esm.types.scene2d_contract.Types.Node2D, unresolved:Array<flight.esm.types.scene2d_contract.Types.Scene2DSlotReference> };

typedef Scene2DSlotContentResolver = ((reference:flight.esm.types.scene2d_contract.Types.Scene2DSlotReference) -> Null<flight.esm.types.scene2d_contract.Types.Node2D>);

typedef Scene2DSlotReference = flight.esm.types.scene2d_contract.Types.Scene2DSlotReference;

typedef Scene2DSlotResolution = { content:flight.esm.types.scene2d_contract.Types.Node2D, reference:flight.esm.types.scene2d_contract.Types.Scene2DSlotReference };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
