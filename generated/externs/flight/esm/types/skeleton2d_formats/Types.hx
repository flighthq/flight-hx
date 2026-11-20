package flight.esm.types.skeleton2d_formats;

#if (js && flight_esm)
typedef DragonBonesRegistry = { sectionHandlers:Array<flight.esm.types.skeleton2d_formats.Types.DragonBonesSectionHandlerEntry>, timelineHandlers:Array<flight.esm.types.skeleton2d_formats.Types.DragonBonesTimelineHandlerEntry> };

typedef DragonBonesSectionContext = { animations:Array<flight.esm.types.skeleton2d_formats.Types.Skeleton2DImportAnimation>, armature:Dynamic, boneIndexByName:js.lib.Map<String, Float>, bones:Array<flight.esm.types.skeleton2d.Types.Bone2D>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, displayTable:js.lib.Map<String, Array<Null<flight.esm.types.skeleton2d.Types.Attachment2D>>>, doc:Dynamic, frameRate:Float, rawIndexToOutput:Array<Float>, registry:flight.esm.types.skeleton2d_formats.Types.DragonBonesRegistry, skins:Array<flight.esm.types.skeleton2d.Types.AttachmentSkin2D>, slotOrder:js.lib.Map<String, Float>, slots:Array<flight.esm.types.skeleton2d.Types.Slot2D> };

typedef DragonBonesSectionHandler = ((context:flight.esm.types.skeleton2d_formats.Types.DragonBonesSectionContext) -> Void);

typedef DragonBonesSectionHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.DragonBonesSectionHandler, kind:String };

typedef DragonBonesSectionKind = String;

typedef DragonBonesTimelineContext = { channels:Array<flight.esm.types.animation.Types.AnimationChannel>, section:flight.esm.types.skeleton2d_formats.Types.DragonBonesSectionContext, unmodeledTimelineCounts:js.lib.Map<String, Float>, unresolvedBoneCount:Float, unregisteredTimelineCounts:js.lib.Map<String, Float> };

typedef DragonBonesTimelineHandler = ((context:flight.esm.types.skeleton2d_formats.Types.DragonBonesTimelineContext, animName:String, animEntry:Dynamic) -> Void);

typedef DragonBonesTimelineHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.DragonBonesTimelineHandler, kind:String };

typedef DragonBonesTimelineKind = String;

typedef Skeleton2DImport = { animations:Array<flight.esm.types.skeleton2d_formats.Types.Skeleton2DImportAnimation>, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D };

typedef Skeleton2DImportAnimation = { clip:flight.esm.types.animation.Types.AnimationClip, ?drawOrder:Null<flight.esm.types.skeleton2d.Types.Skeleton2DDrawOrderTimeline>, name:String };

typedef Skeleton2DJsonAnalysis = { counts:js.lib.Map<String, Float>, format:String };

typedef SpineBinaryParser = ((bytes:js.lib.Uint8Array, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> Null<flight.esm.types.skeleton2d_formats.Types.Skeleton2DImport>);

typedef SpineBinaryRegistry = { sectionHandlers:Array<flight.esm.types.skeleton2d_formats.Types.SpineBinarySectionHandlerEntry>, timelineHandlers:Array<flight.esm.types.skeleton2d_formats.Types.SpineBinaryTimelineHandlerEntry> };

typedef SpineBinarySectionContext = { animations:Array<flight.esm.types.skeleton2d_formats.Types.Skeleton2DImportAnimation>, attachmentNames:Array<Null<String>>, bones:Array<flight.esm.types.skeleton2d.Types.Bone2D>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, nonessential:Bool, reader:flight.esm.types.buffer.Types.ByteReader, registry:flight.esm.types.skeleton2d_formats.Types.SpineBinaryRegistry, skins:Array<flight.esm.types.skeleton2d.Types.AttachmentSkin2D>, slots:Array<flight.esm.types.skeleton2d.Types.Slot2D>, strings:Array<Null<String>> };

typedef SpineBinarySectionHandler = ((context:flight.esm.types.skeleton2d_formats.Types.SpineBinarySectionContext) -> Void);

typedef SpineBinarySectionHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.SpineBinarySectionHandler, kind:String };

typedef SpineBinarySectionKind = String;

typedef SpineBinaryTimelineContext = { channels:Array<flight.esm.types.animation.Types.AnimationChannel>, drawOrder:Null<flight.esm.types.skeleton2d.Types.Skeleton2DDrawOrderTimeline>, section:flight.esm.types.skeleton2d_formats.Types.SpineBinarySectionContext, unregisteredTimelineCounts:js.lib.Map<String, Float>, unmodeledTimelineCounts:js.lib.Map<String, Float> };

typedef SpineBinaryTimelineHandler = ((context:flight.esm.types.skeleton2d_formats.Types.SpineBinaryTimelineContext) -> Void);

typedef SpineBinaryTimelineHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.SpineBinaryTimelineHandler, kind:String };

typedef SpineBinaryTimelineKind = String;

typedef SpineBinaryVersionFailure = { bytes:Float, reason:flight.esm.types.skeleton2d_formats.Types.SpineBinaryVersionFailureReason, v3Candidate:Null<String>, v4Candidate:Null<String> };

typedef SpineBinaryVersionFailureReason = String;

typedef SpineJsonRegistry = { sectionHandlers:Array<flight.esm.types.skeleton2d_formats.Types.SpineJsonSectionHandlerEntry>, timelineHandlers:Array<flight.esm.types.skeleton2d_formats.Types.SpineJsonTimelineHandlerEntry> };

typedef SpineJsonSectionContext = { animations:Array<flight.esm.types.skeleton2d_formats.Types.Skeleton2DImportAnimation>, attachmentNames:Array<Null<String>>, bones:Array<flight.esm.types.skeleton2d.Types.Bone2D>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, doc:Dynamic, registry:flight.esm.types.skeleton2d_formats.Types.SpineJsonRegistry, skins:Array<flight.esm.types.skeleton2d.Types.AttachmentSkin2D>, slots:Array<flight.esm.types.skeleton2d.Types.Slot2D> };

typedef SpineJsonSectionHandler = ((context:flight.esm.types.skeleton2d_formats.Types.SpineJsonSectionContext) -> Void);

typedef SpineJsonSectionHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.SpineJsonSectionHandler, kind:String };

typedef SpineJsonSectionKind = String;

typedef SpineJsonTimelineContext = { channels:Array<flight.esm.types.animation.Types.AnimationChannel>, drawOrder:Null<flight.esm.types.skeleton2d.Types.Skeleton2DDrawOrderTimeline>, section:flight.esm.types.skeleton2d_formats.Types.SpineJsonSectionContext, unregisteredTimelineCounts:js.lib.Map<String, Float>, unmodeledTimelineCounts:js.lib.Map<String, Float> };

typedef SpineJsonTimelineHandler = ((context:flight.esm.types.skeleton2d_formats.Types.SpineJsonTimelineContext, animName:String, animEntry:Dynamic) -> Void);

typedef SpineJsonTimelineHandlerEntry = { handle:flight.esm.types.skeleton2d_formats.Types.SpineJsonTimelineHandler, kind:String };

typedef SpineJsonTimelineKind = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
