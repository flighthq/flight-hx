package flight.esm.types.scene2d_formats_contract;

#if (js && flight_esm)
typedef LottieAdvancedBlend = { mode:String, node:flight.esm.types.scene2d_contract.Types.DisplayObject };

typedef LottieAnimatable<T> = Dynamic;

typedef LottieAnimatedProperty<T> = { a:Float, k:Array<flight.esm.types.scene2d_formats_contract.Types.LottieKeyframe<T>>, ?x:Null<String> };

typedef LottieAsset = Dynamic;

typedef LottieBezierHandle = { x:Dynamic, y:Dynamic };

typedef LottieDashEntry = { n:String, ?nm:Null<String>, v:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float> };

typedef LottieDocument = { ?assets:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieAsset>>, ?chars:Null<Array<Dynamic>>, ?ddd:Null<Float>, ?fonts:Dynamic, fr:Float, ip:Float, op:Float, h:Float, layers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieLayer>, ?markers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieMarker>>, ?nm:Null<String>, ?v:Null<String>, w:Float };

typedef LottieDocumentImportOptions = { ?layerHandlers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieLayerHandlerEntry>>, ?maskHandlers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieMaskHandlerEntry>>, ?resolveImageResource:Null<((asset:flight.esm.types.scene2d_formats_contract.Types.LottieImageAsset) -> Null<flight.esm.types.image_contract.Types.ImageResource>)>, ?shapeItemHandlers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapeItemHandlerEntry>> };

typedef LottieDocumentImportResult = { advancedBlends:Array<flight.esm.types.scene2d_formats_contract.Types.LottieAdvancedBlend>, clip:flight.esm.types.animation.Types.AnimationClip, duration:Float, frameRate:Float, root:flight.esm.types.scene2d_contract.Types.DisplayObject };

typedef LottieEffect = { ?ef:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieEffect>>, ?ix:Null<Float>, ?mn:Null<String>, ?nm:Null<String>, ?ty:Null<Float>, ?v:Dynamic };

typedef LottieEllipseShapeItem = { ?d:Null<Float>, p:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, s:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieFillPaint = { color:Array<Float>, kind:String, opacity:Float, winding:String };

typedef LottieFillShapeItem = { ?bm:Null<Float>, c:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, ?r:Null<Float>, o:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieFont = { ?fFamily:Null<String>, fName:String, ?fStyle:Null<String>, ?ascent:Null<Float> };

typedef LottieGradient = { p:Float, k:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>> };

typedef LottieGradientPaint = { caps:String, count:Float, dash:Array<Float>, dashOffset:Float, end:Array<Float>, joints:String, kind:String, miterLimit:Float, opacity:Float, shape:Float, start:Array<Float>, type:String, values:Array<Float>, width:Float, winding:String };

typedef LottieGradientShapeItem = { ?bm:Null<Float>, ?d:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieDashEntry>>, e:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, g:flight.esm.types.scene2d_formats_contract.Types.LottieGradient, ?a:Dynamic, ?h:Dynamic, ?lc:Null<Float>, ?lj:Null<Float>, ?ml:Null<Float>, ?ml2:Dynamic, ?o:Dynamic, ?r:Null<Float>, t:Float, s:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, ty:String, ?w:Dynamic, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieImageAsset = { ?e:Null<Float>, ?h:Null<Float>, id:String, p:String, ?u:Null<String>, ?w:Null<Float> };

typedef LottieImportContext = { advancedBlends:Array<flight.esm.types.scene2d_formats_contract.Types.LottieAdvancedBlend>, assets:js.lib.Map<String, flight.esm.types.scene2d_formats_contract.Types.LottieAsset>, channels:Array<flight.esm.types.animation.Types.AnimationChannel>, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, document:flight.esm.types.scene2d_formats_contract.Types.LottieDocument, frameOffset:Float, frameScale:Float, registry:flight.esm.types.scene2d_formats_contract.Types.LottieRegistry, resolveImageResource:Null<((asset:flight.esm.types.scene2d_formats_contract.Types.LottieImageAsset) -> Null<flight.esm.types.image_contract.Types.ImageResource>)>, resolvingPrecompositions:js.lib.Set<String> };

typedef LottieKeyframe<T> = { ?e:Null<T>, ?h:Null<Float>, ?i:Null<flight.esm.types.scene2d_formats_contract.Types.LottieBezierHandle>, ?ti:Null<Array<Float>>, ?o:Null<flight.esm.types.scene2d_formats_contract.Types.LottieBezierHandle>, ?s:Null<T>, t:Float, ?to:Null<Array<Float>> };

typedef LottieLayer = { ?ao:Null<Float>, ?bm:Null<Float>, ?ddd:Null<Float>, ?ef:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieEffect>>, ?hd:Null<Bool>, ?ind:Null<Float>, ?parent:Null<Float>, ?ip:Null<Float>, ?op:Null<Float>, ?st:Null<Float>, ?sr:Null<Float>, ?ks:Null<flight.esm.types.scene2d_formats_contract.Types.LottieTransform>, ?masksProperties:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieMask>>, ?nm:Null<String>, ?refId:Null<String>, ?shapes:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapeItem>>, ?sc:Null<String>, ?sh:Null<Float>, ?sw:Null<Float>, ?t:Null<flight.esm.types.scene2d_formats_contract.Types.LottieTextData>, ?tt:Null<Float>, ?td:Null<Float>, ?tp:Null<Float>, ty:Float, ?tm:Dynamic };

typedef LottieLayerContext = { container:flight.esm.types.scene2d_contract.Types.DisplayObject, layer:flight.esm.types.scene2d_formats_contract.Types.LottieLayer };

typedef LottieLayerHandler = ((context:flight.esm.types.scene2d_formats_contract.Types.LottieLayerContext) -> Void);

typedef LottieLayerHandlerEntry = { handle:flight.esm.types.scene2d_formats_contract.Types.LottieLayerHandler, kind:Float };

typedef LottieLayerKind = Float;

typedef LottieMarker = { cm:String, dr:Float, tm:Float };

typedef LottieMask = { ?inv:Null<Bool>, mode:String, ?nm:Null<String>, o:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, pt:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<flight.esm.types.scene2d_formats_contract.Types.LottieShapePath>, ?f:Dynamic, ?x:Dynamic };

typedef LottieMaskContext = { masks:Array<flight.esm.types.scene2d_formats_contract.Types.LottieMask>, target:flight.esm.types.scene2d_contract.Types.Node2D };

typedef LottieMaskHandler = ((context:flight.esm.types.scene2d_formats_contract.Types.LottieMaskContext) -> Void);

typedef LottieMaskHandlerEntry = { handle:flight.esm.types.scene2d_formats_contract.Types.LottieMaskHandler, kind:String };

typedef LottieMaskKind = String;

typedef LottieMergePathShapeItem = { mm:Float, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieMutableAnimationTarget = { lottieApply:((sample:Dynamic, time:Float) -> Void) };

typedef LottiePaint = Dynamic;

typedef LottiePolystarShapeItem = { ?d:Null<Float>, ?ir:Dynamic, ?is:Dynamic, or:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, os:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, p:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, pt:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, r:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, sy:Float, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottiePositionProperty = Dynamic;

typedef LottiePrecompositionAsset = { ?h:Null<Float>, id:String, layers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieLayer>, ?nm:Null<String>, ?w:Null<Float> };

typedef LottieRectangleShapeItem = { ?d:Null<Float>, p:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, r:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, s:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieRegistry = { layerHandlers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieLayerHandlerEntry>, maskHandlers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieMaskHandlerEntry>, shapeItemHandlers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapeItemHandlerEntry> };

typedef LottieRepeaterShapeItem = { c:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ?m:Null<Float>, o:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, tr:flight.esm.types.scene2d_formats_contract.Types.LottieRepeaterTransform, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieRepeaterTransform = { ?eo:Dynamic, ?so:Dynamic, ?a:Dynamic, ?o:Dynamic, ?p:Dynamic, ?r:Dynamic, ?rz:Dynamic, ?s:Dynamic, ?sa:Dynamic, ?sk:Dynamic };

typedef LottieRoundedCornersShapeItem = { r:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieSeparatedPositionProperty = { s:Bool, x:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, y:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ?z:Dynamic };

typedef LottieShapeGroup = { it:Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapeItem>, ?np:Null<Float>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieShapeItem = Dynamic;

typedef LottieShapeItemBase = { ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String>, ty:String };

typedef LottieShapeItemContext = { claims:js.lib.Set<String>, item:flight.esm.types.scene2d_formats_contract.Types.LottieShapeItem, modifiers:Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapeModifier>, painters:Array<flight.esm.types.scene2d_formats_contract.Types.LottieShapePainter>, paths:Array<flight.esm.types.path_contract.Types.PathRaw>, rerender:(() -> Void), shape:flight.esm.types.shape.Types.Shape };

typedef LottieShapeItemHandler = ((context:flight.esm.types.scene2d_formats_contract.Types.LottieShapeItemContext) -> Void);

typedef LottieShapeItemHandlerEntry = { handle:flight.esm.types.scene2d_formats_contract.Types.LottieShapeItemHandler, kind:String };

typedef LottieShapeItemKind = String;

typedef LottieShapeModifier = ((paths:Array<flight.esm.types.path_contract.Types.PathRaw>) -> Void);

typedef LottieShapePainter = ((shape:flight.esm.types.shape.Types.Shape, paths:Array<flight.esm.types.path_contract.Types.PathRaw>) -> Void);

typedef LottieShapePath = { c:Bool, i:Array<Array<Float>>, o:Array<Array<Float>>, v:Array<Array<Float>> };

typedef LottieShapePathItem = { ?d:Null<Float>, ?ind:Null<Float>, ks:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<flight.esm.types.scene2d_formats_contract.Types.LottieShapePath>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieStaticProperty<T> = { ?a:Null<Float>, k:T, ?x:Null<String> };

typedef LottieStrokePaint = { caps:String, color:Array<Float>, dash:Array<Float>, dashOffset:Float, joints:String, kind:String, miterLimit:Float, opacity:Float, width:Float };

typedef LottieStrokeShapeItem = { ?bm:Null<Float>, c:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Array<Float>>, ?d:Null<Array<flight.esm.types.scene2d_formats_contract.Types.LottieDashEntry>>, ?lc:Null<Float>, ?lj:Null<Float>, ?ml:Null<Float>, ?ml2:Dynamic, o:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ty:String, w:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieTextData = { d:Dynamic, ?a:Null<Array<Dynamic>>, ?m:Dynamic, ?p:Dynamic };

typedef LottieTextDocument = { ?fc:Null<Array<Float>>, ?f:Null<String>, ?s:Null<Float>, ?sc:Null<Array<Float>>, ?sw:Null<Float>, t:String, ?tr:Null<Float>, ?lh:Null<Float>, ?j:Null<Float> };

typedef LottieTransform = { ?a:Dynamic, ?o:Dynamic, ?p:Dynamic, ?r:Dynamic, ?rz:Dynamic, ?s:Dynamic, ?sa:Dynamic, ?sk:Dynamic };

typedef LottieTransformShapeItem = { ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String>, ?a:Dynamic, ?o:Dynamic, ?p:Dynamic, ?r:Dynamic, ?rz:Dynamic, ?s:Dynamic, ?sa:Dynamic, ?sk:Dynamic };

typedef LottieTrimPathShapeItem = { e:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, m:Float, o:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, s:flight.esm.types.scene2d_formats_contract.Types.LottieAnimatable<Float>, ty:String, ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String> };

typedef LottieUnknownShapeItem = { ?hd:Null<Bool>, ?ix:Null<Float>, ?nm:Null<String>, ty:String };

typedef RiveAdvancedBlend = { mode:String, node:flight.esm.types.scene2d_contract.Types.DisplayObject };

typedef RiveAnimationClip = { clip:flight.esm.types.animation.Types.AnimationClip, loop:flight.esm.types.scene2d_formats_contract.Types.RiveAnimationLoop, name:String, speed:Float, workAreaEnd:Null<Float>, workAreaStart:Null<Float> };

typedef RiveAnimationLoop = String;

typedef RiveArtboardGraph = { objects:Array<flight.esm.types.scene2d_formats_contract.Types.RiveCoreObject>, streamEnd:Float, streamStart:Float, parentIndices:Array<Float> };

typedef RiveArtboardImport = { advancedBlends:Array<flight.esm.types.scene2d_formats_contract.Types.RiveAdvancedBlend>, animations:Array<flight.esm.types.scene2d_formats_contract.Types.RiveAnimationClip>, stateMachines:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineDescriptor>, height:Float, layouts:Array<flight.esm.types.scene2d_formats_contract.Types.RiveLayoutImport>, name:String, root:flight.esm.types.scene2d_contract.Types.DisplayObject, skeleton:Null<flight.esm.types.scene2d_formats_contract.Types.RiveSkeleton2DImport>, width:Float };

typedef RiveArtboardImportContext = { advancedBlends:Array<flight.esm.types.scene2d_formats_contract.Types.RiveAdvancedBlend>, animations:Array<flight.esm.types.scene2d_formats_contract.Types.RiveAnimationClip>, artboard:flight.esm.types.scene2d_formats_contract.Types.RiveArtboardGraph, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, fontNames:Array<String>, layouts:Array<flight.esm.types.scene2d_formats_contract.Types.RiveLayoutImport>, nodes:Array<Null<flight.esm.types.scene2d_contract.Types.DisplayObject>>, objects:Array<flight.esm.types.scene2d_formats_contract.Types.RiveCoreObject>, rebuilds:js.lib.Map<Float, (() -> Void)>, registry:flight.esm.types.scene2d_formats_contract.Types.RiveImportRegistry, root:flight.esm.types.scene2d_contract.Types.DisplayObject, shapePaths:js.lib.Map<Float, Array<flight.esm.types.scene2d_formats_contract.Types.RivePathRecord>>, skeleton:Null<flight.esm.types.scene2d_formats_contract.Types.RiveSkeleton2DImport>, stateMachines:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineDescriptor> };

typedef RiveCoreObject = { properties:Array<flight.esm.types.scene2d_formats_contract.Types.RiveProperty>, typeKey:Float };

typedef RiveCoreObjectHandler = { ?applyArtboard:Null<((context:flight.esm.types.scene2d_formats_contract.Types.RiveArtboardImportContext) -> Void)>, ?applyDocument:Null<((context:flight.esm.types.scene2d_formats_contract.Types.RiveDocumentImportContext) -> Void)>, ?importComponent:Null<((context:flight.esm.types.scene2d_formats_contract.Types.RiveArtboardImportContext, index:Float) -> Null<flight.esm.types.scene2d_contract.Types.DisplayObject>)> };

typedef RiveDocument = { header:flight.esm.types.scene2d_formats_contract.Types.RiveDocumentHeader, objects:Array<flight.esm.types.scene2d_formats_contract.Types.RiveCoreObject> };

typedef RiveDocumentHeader = { fileId:Float, majorVersion:Float, minorVersion:Float, tableOfContents:Array<flight.esm.types.scene2d_formats_contract.Types.RivePropertyFieldType> };

typedef RiveDocumentImportContext = { assets:Array<flight.esm.types.scene2d_formats_contract.Types.RiveFileAsset>, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, objects:Array<flight.esm.types.scene2d_formats_contract.Types.RiveCoreObject>, registry:flight.esm.types.scene2d_formats_contract.Types.RiveImportRegistry };

typedef RiveDocumentImportResult = { artboards:Array<flight.esm.types.scene2d_formats_contract.Types.RiveArtboardImport>, assets:Array<flight.esm.types.scene2d_formats_contract.Types.RiveFileAsset> };

typedef RiveFieldType = Float;

typedef RiveFileAsset = { bytes:Null<js.lib.Uint8Array>, cdnBaseUrl:String, height:Float, kind:String, name:String, width:Float };

typedef RiveImportOptions = { ?pathBooleanRegistrars:Null<Array<flight.esm.types.scene2d_formats_contract.Types.RivePathBooleanRegistrar>>, ?registrars:Null<Array<flight.esm.types.scene2d_formats_contract.Types.RiveRegistrar>> };

typedef RiveImportRegistry = { handlers:js.lib.Map<Float, flight.esm.types.scene2d_formats_contract.Types.RiveCoreObjectHandler> };

typedef RiveLayoutImport = { targets:Array<flight.esm.types.scene2d_contract.Types.DisplayObject>, tree:flight.esm.types.layout.Types.LayoutTree };

typedef RiveObjectGraph = { artboards:Array<flight.esm.types.scene2d_formats_contract.Types.RiveArtboardGraph> };

typedef RivePathBooleanRegistrar = ((pathBooleanKernel:flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw, registry:flight.esm.types.scene2d_formats_contract.Types.RiveImportRegistry) -> Void);

typedef RivePathRecord = { commands:Array<Float>, data:Array<Float>, pathIndex:Float, winding:flight.esm.types.path.Types.PathWinding };

typedef RiveProperty = { key:Float, type:flight.esm.types.scene2d_formats_contract.Types.RiveFieldType, value:flight.esm.types.scene2d_formats_contract.Types.RiveValue };

typedef RivePropertyFieldType = { key:Float, type:flight.esm.types.scene2d_formats_contract.Types.RiveFieldType };

typedef RiveRegistrar = ((registry:flight.esm.types.scene2d_formats_contract.Types.RiveImportRegistry) -> Void);

typedef RiveScene2DDocumentResult = { imageResources:Array<flight.esm.types.image.Types.ImageResourceReference>, imported:flight.esm.types.scene2d_formats_contract.Types.RiveDocumentImportResult, root:flight.esm.types.scene2d_contract.Types.DisplayObject, slots:Array<flight.esm.types.scene2d_contract.Types.Scene2DSlotReference> };

typedef RiveSkeleton2DImport = { boneIndices:Array<Float>, skeleton:flight.esm.types.skeleton2d.Types.Skeleton2D };

typedef RiveStateMachineDescriptor = { inputs:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineInput>, layers:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineLayer>, name:String };

typedef RiveStateMachineInput = { kind:String, name:String, value:Dynamic };

typedef RiveStateMachineLayer = { name:String, states:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineState> };

typedef RiveStateMachineState = { animationId:Float, kind:String, transitions:Array<flight.esm.types.scene2d_formats_contract.Types.RiveStateMachineTransition> };

typedef RiveStateMachineTransition = { duration:Float, exitTime:Float, flags:Float, toStateId:Float };

typedef RiveValue = Dynamic;

typedef RiveWeightedPoint = { kind:flight.esm.types.scene2d_formats_contract.Types.RiveWeightedPointKind, vertex:Float, x:Float, y:Float };

typedef RiveWeightedPointKind = String;

typedef SvgClipContext = { element:flight.esm.types.xml.Types.XmlElement, target:flight.esm.types.scene2d_contract.Types.Node2D };

typedef SvgClipHandler = ((context:flight.esm.types.scene2d_formats_contract.Types.SvgClipContext) -> Void);

typedef SvgClipHandlerEntry = { handle:flight.esm.types.scene2d_formats_contract.Types.SvgClipHandler, kind:String };

typedef SvgClipKind = String;

typedef SvgColor = { alpha:Float, rgb:Float };

typedef SvgCssRule = { declarations:Dynamic, order:Float, selector:String, specificity:Float };

typedef SvgDocumentImportOptions = { ?clipHandlers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.SvgClipHandlerEntry>>, ?elementHandlers:Null<Array<flight.esm.types.scene2d_formats_contract.Types.SvgElementHandlerEntry>>, ?resolveImageResource:Null<((href:String) -> Null<flight.esm.types.image_contract.Types.ImageResource>)> };

typedef SvgElementContext = { element:flight.esm.types.xml.Types.XmlElement, parentStyle:flight.esm.types.scene2d_formats_contract.Types.SvgStyle };

typedef SvgElementHandler = ((context:flight.esm.types.scene2d_formats_contract.Types.SvgElementContext) -> Null<flight.esm.types.scene2d_contract.Types.Node2D>);

typedef SvgElementHandlerEntry = { handle:flight.esm.types.scene2d_formats_contract.Types.SvgElementHandler, kind:String };

typedef SvgElementKind = String;

typedef SvgGradient = { cx:Float, cy:Float, fx:Float, fy:Float, kind:String, radius:Float, spreadMethod:flight.esm.types.shape.Types.SpreadMethod, stops:Array<flight.esm.types.scene2d_formats_contract.Types.SvgGradientStop>, transform:Null<flight.esm.types.geometry.Types.Matrix>, units:String, x1:Float, x2:Float, y1:Float, y2:Float };

typedef SvgGradientStop = { color:flight.esm.types.scene2d_formats_contract.Types.SvgColor, offset:Float };

typedef SvgImportContext = { cssRules:Array<flight.esm.types.scene2d_formats_contract.Types.SvgCssRule>, diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, elementsById:js.lib.Map<String, flight.esm.types.xml.Types.XmlElement>, gradientsById:js.lib.Map<String, flight.esm.types.scene2d_formats_contract.Types.SvgGradient>, objectBoundingBoxes:js.lib.Map<flight.esm.types.scene2d_contract.Types.Node2D, flight.esm.types.geometry.Types.Rectangle>, options:Null<flight.esm.types.scene2d_formats_contract.Types.SvgDocumentImportOptions>, parentByElement:js.lib.Map<flight.esm.types.xml.Types.XmlElement, Null<flight.esm.types.xml.Types.XmlElement>>, registry:flight.esm.types.scene2d_formats_contract.Types.SvgRegistry, reportedUnsupportedElements:js.lib.Set<flight.esm.types.xml.Types.XmlElement>, resolvedDefinitionStyles:js.lib.Map<flight.esm.types.xml.Types.XmlElement, flight.esm.types.scene2d_formats_contract.Types.SvgStyle>, resolvingClipUses:js.lib.Set<String>, resolvingClips:js.lib.Set<String>, resolvingGradients:js.lib.Set<String>, resolvingUses:js.lib.Set<String> };

typedef SvgRegistry = { clipHandlers:Array<flight.esm.types.scene2d_formats_contract.Types.SvgClipHandlerEntry>, elementHandlers:Array<flight.esm.types.scene2d_formats_contract.Types.SvgElementHandlerEntry> };

typedef SvgStyle = { clipRule:flight.esm.types.path.Types.PathWinding, color:String, display:String, fill:String, fillOpacity:Float, fillRule:flight.esm.types.path.Types.PathWinding, filter:String, fontFamily:String, fontSize:Float, fontStyle:String, fontWeight:String, opacity:Float, stroke:String, strokeDasharray:String, strokeDashoffset:Float, strokeLinecap:String, strokeLinejoin:String, strokeMiterlimit:Float, strokeOpacity:Float, strokeWidth:Float, textAnchor:String, visibility:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
