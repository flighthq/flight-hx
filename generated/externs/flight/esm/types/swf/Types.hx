package flight.esm.types.swf;

#if (js && flight_esm)
typedef SwfContentCapabilities = { tagCounts:js.lib.Map<Float, Float>, usesBlendMode:Bool, usesFilters:Bool, usesBitmapFills:Bool };

typedef SwfDocumentImport = { appearances:Array<flight.esm.types.swf.Types.SwfNodeAppearance>, document:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument, jpegAlphaPayloads:Array<flight.esm.types.swf.Types.SwfJpegAlphaPayload> };

typedef SwfFilterListGuard = ((filterId:Float, filterIndex:Float) -> Void);

typedef SwfHeader = { fileLength:Float, frameRate:Float, stageBounds:flight.esm.types.swf.Types.SwfTagRectangle, version:Float };

typedef SwfJpegAlphaPayload = { characterId:Float, compressedAlphaBytes:js.lib.Uint8Array, deblockingParameterRaw:Null<Float>, height:Float, reference:flight.esm.types.image.Types.EmbeddedImageResourceReference, width:Float };

typedef SwfMorphShapePaths = { fills:js.lib.Map<Float, Dynamic>, lines:js.lib.Map<Float, Dynamic> };

typedef SwfNodeAppearance = { advancedBlendMode:Null<String>, effects:Array<flight.esm.types.effects.Types.Effect>, frame:Float, node:flight.esm.types.scene2d_contract.Types.Node2D };

typedef SwfParseOptions = { ?deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, ?lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability>, tags:Array<flight.esm.types.swf.Types.SwfTagHandler> };

typedef SwfTagHandler = { ?instantiate:Null<flight.esm.types.swf.Types.SwfTagHandlerInstantiation>, tags:Array<Float>, parse:((body:flight.esm.types.swf.Types.SwfTagReader, tag:Float, state:flight.esm.types.swf.Types.SwfTagParseState, timeline:flight.esm.types.swf.Types.SwfTagTimelineState, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> Bool), ?finishTimeline:Null<((state:flight.esm.types.swf.Types.SwfTagParseState, timeline:flight.esm.types.swf.Types.SwfTagTimelineState) -> Void)>, ?resolve:Null<((state:flight.esm.types.swf.Types.SwfTagParseState, timeline:flight.esm.types.swf.Types.SwfTimeline) -> Void)> };

typedef SwfTagHandlerDispatch = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:Float) -> Null<flight.esm.types.swf.Types.SwfTagHandler>), has:((key:Float) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef SwfTagHandlerInstantiation = { ?createResources:Null<((parsed:flight.esm.types.swf.Types.SwfTagParseResult, out:flight.esm.types.swf.Types.SwfTagHandlerResources) -> Void)>, ?createPlacementNode:Null<((parsed:flight.esm.types.swf.Types.SwfTagParseResult, characterId:Float, bounds:Dynamic, diagnostics:Null<Array<Dynamic>>) -> Null<flight.esm.types.scene2d_contract.Types.Node2D>)>, ?hasPlacementContent:Null<((parsed:flight.esm.types.swf.Types.SwfTagParseResult, characterId:Float) -> Bool)> };

typedef SwfTagHandlerResources = { audio:Array<flight.esm.types.audio.Types.AudioResourceReference>, images:Array<flight.esm.types.image.Types.ImageResourceReference>, jpegAlphaPayloads:Array<flight.esm.types.swf.Types.SwfJpegAlphaPayload> };

typedef SwfTagMatrix = { a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float };

typedef SwfTagParseResult = { timeline:flight.esm.types.swf.Types.SwfTimeline, abcBlobs:Array<Dynamic>, backgroundColor:Null<Float>, characterBounds:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagRectangle>, definedCharacters:js.lib.Set<Float>, dispatch:flight.esm.types.swf.Types.SwfTagHandlerDispatch, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, editTexts:js.lib.Map<Float, ((resolveFontName:Dynamic) -> flight.esm.types.text.Types.RichText)>, fontCodePoints:js.lib.Map<Float, Array<Float>>, fontNames:js.lib.Map<Float, String>, fontOutlineSources:js.lib.Map<Float, flight.esm.types.font.Types.GlyphOutlineSource>, images:js.lib.Map<Float, Dynamic>, imageTextures:js.lib.Map<Float, js.lib.Map<String, flight.esm.types.texture_contract.Types.Texture2D>>, jpegAlphaPayloads:js.lib.Map<Float, Dynamic>, jpegTables:Null<js.lib.Uint8Array>, linkages:js.lib.Map<Float, String>, morphBounds:js.lib.Map<Float, Dynamic>, morphShapes:js.lib.Map<Float, (() -> Null<flight.esm.types.shape.Types.MorphShape>)>, pendingInitActions:Array<Dynamic>, pendingTexts:Array<Dynamic>, remainingFrameEntries:Float, scalingGrids:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagRectangle>, shapes:js.lib.Map<Float, flight.esm.types.shape.Types.Shape>, soundCuesAwaitingClass:Array<Dynamic>, soundCuesAwaitingRate:Array<Dynamic>, soundResources:js.lib.Map<Float, flight.esm.types.audio.Types.AudioResource>, sounds:js.lib.Map<Float, Dynamic>, sprites:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTimeline>, streamSounds:Array<Dynamic>, videoTextures:js.lib.Map<Float, flight.esm.types.texture_contract.Types.Texture2D>, videos:js.lib.Map<Float, Dynamic> };

typedef SwfTagParseState = { abcBlobs:Array<Dynamic>, backgroundColor:Null<Float>, characterBounds:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagRectangle>, definedCharacters:js.lib.Set<Float>, dispatch:flight.esm.types.swf.Types.SwfTagHandlerDispatch, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, editTexts:js.lib.Map<Float, ((resolveFontName:Dynamic) -> flight.esm.types.text.Types.RichText)>, fontCodePoints:js.lib.Map<Float, Array<Float>>, fontNames:js.lib.Map<Float, String>, fontOutlineSources:js.lib.Map<Float, flight.esm.types.font.Types.GlyphOutlineSource>, images:js.lib.Map<Float, Dynamic>, imageTextures:js.lib.Map<Float, js.lib.Map<String, flight.esm.types.texture_contract.Types.Texture2D>>, jpegAlphaPayloads:js.lib.Map<Float, Dynamic>, jpegTables:Null<js.lib.Uint8Array>, linkages:js.lib.Map<Float, String>, morphBounds:js.lib.Map<Float, Dynamic>, morphShapes:js.lib.Map<Float, (() -> Null<flight.esm.types.shape.Types.MorphShape>)>, pendingInitActions:Array<Dynamic>, pendingTexts:Array<Dynamic>, remainingFrameEntries:Float, scalingGrids:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagRectangle>, shapes:js.lib.Map<Float, flight.esm.types.shape.Types.Shape>, soundCuesAwaitingClass:Array<Dynamic>, soundCuesAwaitingRate:Array<Dynamic>, soundResources:js.lib.Map<Float, flight.esm.types.audio.Types.AudioResource>, sounds:js.lib.Map<Float, Dynamic>, sprites:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTimeline>, streamSounds:Array<Dynamic>, videoTextures:js.lib.Map<Float, flight.esm.types.texture_contract.Types.Texture2D>, videos:js.lib.Map<Float, Dynamic> };

typedef SwfTagPlacement = { advancedBlendMode:Null<String>, alpha:Float, blendMode:String, characterId:Float, clipDepth:Float, colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorTransformAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, depth:Float, directLinkage:Null<String>, effects:Array<flight.esm.types.effects.Types.Effect>, filterAdjustments:Array<flight.esm.types.adjustments_contract.Types.Adjustment>, matrix:flight.esm.types.swf.Types.SwfTagMatrix, name:Null<String>, ratio:Float };

typedef SwfTagReader = { bitPosition:Float, end:Float, pos:Float, source:js.lib.Uint8Array, valid:Bool, alignToByte:(() -> Void), readEncodedUint32:(() -> Float), readFixed8:(() -> Float), readSignedBits:((count:Float) -> Float), readString:(() -> String), readUint8:(() -> Float), readUint16:(() -> Float), readUint32:(() -> Float), readUnsignedBits:((count:Float) -> Float) };

typedef SwfTagRectangle = { height:Float, width:Float, x:Float, y:Float };

typedef SwfTagTimelineState = { actions:js.lib.Map<Float, flight.esm.types.timeline.Types.FrameScript>, cues:Array<flight.esm.types.timeline.Types.TimelineCue>, frames:Array<js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagPlacement>>, labels:Array<flight.esm.types.timeline.Types.TimelineLabel>, placements:js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagPlacement>, streamChunks:Array<js.lib.Uint8Array>, streamFormat:Float, streamStartFrame:Float };

typedef SwfTimeline = { actions:js.lib.Map<Float, flight.esm.types.timeline.Types.FrameScript>, cues:Array<flight.esm.types.timeline.Types.TimelineCue>, frames:Array<js.lib.Map<Float, flight.esm.types.swf.Types.SwfTagPlacement>>, labels:Array<flight.esm.types.timeline.Types.TimelineLabel> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
