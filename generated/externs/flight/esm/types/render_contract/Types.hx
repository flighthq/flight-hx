package flight.esm.types.render_contract;

#if (js && flight_esm)
typedef BatchFormat = Float;

typedef CatalogEntry = { kind:String, registrations:Array<flight.esm.types.render_contract.Types.CatalogRegistration>, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef CatalogRegistration = { module:String, registrar:String };

typedef ColorAdjustmentUnsupportedGuard = ((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny) -> Void);

typedef CreateExternalTextureOptions = { ?colorSpace:Null<String>, height:Float, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, width:Float };

typedef CreateRenderTextureOptions = { ?colorSpace:Null<String>, ?colorAttachments:Null<Float>, ?colorFormats:Null<Array<flight.esm.types.render_contract.Types.RenderTargetFormat>>, ?depth:Null<String>, ?flipX:Null<Bool>, ?flipY:Null<Bool>, ?format:Null<String>, height:Float, ?sampleCount:Null<Float>, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?uvOffset:Null<flight.esm.types.geometry.Types.Vector2Like>, ?uvRotation:Null<Float>, ?uvScale:Null<flight.esm.types.geometry.Types.Vector2Like>, width:Float };

typedef EffectPadding = flight.esm.types.render.Types.EffectPadding;

typedef EffectPaddingResolver = flight.esm.types.render.Types.EffectPaddingResolver;

typedef ExternalTexture = { kind:String, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, version:Float, width:Float };

typedef FallbackRemediableSceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable, module:String, registrar:String };

typedef FallbackUnavailableSceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef NodeRenderer = { ?format:Null<Float>, createData:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny) -> Null<flight.esm.types.node.Types.RendererData>), ?destroyData:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.node.Types.RendererData) -> Void)>, ?isDirty:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:Null<flight.esm.types.node.Types.RendererData>) -> Bool)>, submit:((state:flight.esm.types.render_contract.Types.RenderState, node:flight.esm.types.render_contract.Types.RenderProxy) -> Void) };

typedef RenderBatchKey = { blend:Null<String>, format:flight.esm.types.render_contract.Types.BatchFormat, material:Null<flight.esm.types.materials_contract.Types.Material>, rendererKind:String, texture:Dynamic };

typedef RenderBlendStateEntry = { alpha:Float, blendMode:Null<String> };

typedef RenderCache = { kind:String, transform:flight.esm.types.geometry.Types.Matrix };

typedef RenderCacheAdapter = { adapt:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, node:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<Bool>), cache:Null<flight.esm.types.render_contract.Types.RenderCache>, signals:Null<flight.esm.types.render_contract.Types.RenderCacheAdapterSignals> };

typedef RenderCacheAdapterSignals = { onPrepare:flight.esm.types.signals.Types.Signal<Void> };

typedef RenderCacheKind = flight.esm.types.render.Types.RenderCacheKind;

typedef RenderCacheRefreshOptions = { ?padding:Null<Float>, ?minWidth:Null<Float>, ?minHeight:Null<Float> };

typedef RenderDrawContext = { drawCallCount:Float, flushCount:Float, openBatchKey:Null<flight.esm.types.render_contract.Types.RenderBatchKey>, proxyVisitedCount:Float };

typedef RenderProxy = { source:flight.esm.types.node.Types.NodeAny, kind:String, next:Null<flight.esm.types.render_contract.Types.RenderProxy>, alpha:Float, appearanceFrameId:Float, blendMode:Null<String>, colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, ?colorMatrix:Null<js.lib.Float32Array>, material:Null<flight.esm.types.materials_contract.Types.Material>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, lastAppearanceId:Float, lastChildrenId:Float, lastLocalContentId:Float, lastLocalTransformId:Float, lastParentReferenceId:Float, name:Null<String>, renderer:Null<flight.esm.types.render_contract.Types.NodeRenderer>, rendererData:Null<flight.esm.types.node.Types.RendererData>, rendererDataSource:Null<flight.esm.types.node.Types.NodeAny>, rendererMapId:Float, transformFrameId:Float, visible:Bool };

typedef RenderProxy2D = { material:Null<flight.esm.types.materials_contract.Types.Material2D>, source:flight.esm.types.scene2d_contract.Types.Node2D, transform2D:flight.esm.types.geometry.Types.Matrix, traverseChildren:Bool, clipDepth:Float, kind:String, next:Null<flight.esm.types.render_contract.Types.RenderProxy>, alpha:Float, appearanceFrameId:Float, blendMode:Null<String>, colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, ?colorMatrix:Null<js.lib.Float32Array>, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, lastAppearanceId:Float, lastChildrenId:Float, lastLocalContentId:Float, lastLocalTransformId:Float, lastParentReferenceId:Float, name:Null<String>, renderer:Null<flight.esm.types.render_contract.Types.NodeRenderer>, rendererData:Null<flight.esm.types.node.Types.RendererData>, rendererDataSource:Null<flight.esm.types.node.Types.NodeAny>, rendererMapId:Float, transformFrameId:Float, visible:Bool };

typedef RenderProxyAdapter = { adapt:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, node:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<Bool>) };

typedef RenderProxyResolver = { resolve:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.scene2d_contract.Types.Node2D, node:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<Bool>) };

typedef RenderProxyVisitor = ((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D, parentData:Null<flight.esm.types.render_contract.Types.RenderProxy2D>) -> Void);

typedef RenderQueue = { entries:Array<flight.esm.types.render_contract.Types.RenderQueueEntry>, entryCount:Float };

typedef RenderQueueEntry = { proxy:flight.esm.types.render_contract.Types.RenderProxy, sortKey:Float };

typedef RenderRegistries = { ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef RenderRegistriesMiss = { kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef RenderRegistriesMissExplanation = { misses:Array<flight.esm.types.render_contract.Types.RenderRegistriesMiss>, status:String };

typedef RenderRegistrySignals = { onRegistryMiss:flight.esm.types.signals.Types.Signal<Array<Dynamic>> };

typedef RenderRegistryTable = Float;

typedef RenderRootGuard = ((state:flight.esm.types.render_contract.Types.RenderState, root:flight.esm.types.node.Types.NodeAny) -> Void);

typedef RenderSortKey = Float;

typedef RenderState = { allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef RenderStateOptions = { ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef RenderStateRuntime = { currentFrameId:Float, renderAdaptHook:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>, renderProxyAdapterMap:Dynamic, renderProxyMap:Dynamic, renderProxySources:js.lib.Set<flight.esm.types.node.Types.NodeAny>, registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)>, registries:flight.esm.types.render_contract.Types.RenderRegistries, rendererMapId:Float, tempStack:Array<flight.esm.types.node.Types.NodeAny>, binding:Dynamic, ?uid:Null<String> };

typedef RenderStateStats = { drawCallCount:Float, flushCount:Float, proxyVisitedCount:Float };

typedef RenderTarget = { kind:String, width:Float, height:Float, ?format:Null<String>, ?colorAttachments:Null<Float>, ?colorFormats:Null<Array<flight.esm.types.render_contract.Types.RenderTargetFormat>>, ?sampleCount:Null<Float>, ?depth:Null<String>, ?colorSpace:Null<String>, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, version:Float };

typedef RenderTargetAxes = { width:Float, height:Float, format:flight.esm.types.render_contract.Types.RenderTargetFormat, colorAttachments:Float, colorFormats:Array<flight.esm.types.render_contract.Types.RenderTargetFormat>, sampleCount:Float, depth:flight.esm.types.render_contract.Types.RenderTargetDepth, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef RenderTargetAxisDifference = { axis:String, effective:Dynamic, requested:Dynamic };

typedef RenderTargetClear = { ?color:Null<Array<Float>>, ?colors:Null<Array<Null<Array<Float>>>>, ?depth:Null<Float>, ?stencil:Null<Float> };

typedef RenderTargetColorSpace = String;

typedef RenderTargetDepth = String;

typedef RenderTargetDescriptor = { width:Float, height:Float, ?format:Null<String>, ?colorAttachments:Null<Float>, ?colorFormats:Null<Array<flight.esm.types.render_contract.Types.RenderTargetFormat>>, ?sampleCount:Null<Float>, ?depth:Null<String>, ?colorSpace:Null<String> };

typedef RenderTargetDimensions = { height:Float, width:Float };

typedef RenderTargetExplanation = { differences:Array<flight.esm.types.render_contract.Types.RenderTargetAxisDifference>, effective:flight.esm.types.render_contract.Types.RenderTargetAxes, requested:flight.esm.types.render_contract.Types.RenderTargetAxes };

typedef RenderTargetFormat = String;

typedef RenderTargetFormatPolicy = String;

typedef RenderTexture = { source:flight.esm.types.render_contract.Types.RenderTarget, dimension:String, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2 };

typedef RenderView<State, Target> = flight.esm.types.render.Types.RenderView<State, Target>;

typedef RenderViewResize<State, Target> = flight.esm.types.render.Types.RenderViewResize<State, Target>;

typedef RenderViewTargetOptions = flight.esm.types.render.Types.RenderViewTargetOptions;

typedef ResolvedRenderTargetDescriptor = { width:Float, height:Float, format:flight.esm.types.render_contract.Types.RenderTargetFormat, colorAttachments:Float, colorFormats:Array<flight.esm.types.render_contract.Types.RenderTargetFormat>, sampleCount:Float, depth:flight.esm.types.render_contract.Types.RenderTargetDepth, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef SatisfiedSceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef Scene2DClipHooks = { finalize:((state:flight.esm.types.render_contract.Types.RenderState) -> Void), popClip:((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy2D, source:flight.esm.types.scene2d_contract.Types.Node2D) -> Void), pushClip:((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy2D, source:flight.esm.types.scene2d_contract.Types.Node2D) -> Void) };

typedef Scene2DPipelineCoverageExplanation = { registeredKinds:Array<String>, uncoveredKinds:Array<String>, unusedRegistrations:Array<String>, usedKinds:Array<String> };

typedef Scene2DRenderBlankReason = String;

typedef Scene2DRenderExplanation = { kind:String, hasRenderer:Bool, prepared:Bool, visible:Bool, effectiveAlpha:Float, reason:flight.esm.types.render_contract.Types.Scene2DRenderBlankReason };

typedef Scene2DRenderer = { createData:((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.scene2d_contract.Types.Node2D) -> Null<flight.esm.types.node.Types.RendererData>), submit:((state:flight.esm.types.render_contract.Types.RenderState, node:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void), ?format:Null<Float>, ?destroyData:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.node.Types.RendererData) -> Void)>, ?isDirty:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:Null<flight.esm.types.node.Types.RendererData>) -> Bool)> };

typedef Scene3DGraphSyncPolicy = String;

typedef Scene3DPipelineCoverageExplanation = { registeredKinds:Array<String>, registeredMaterialKinds:Array<String>, uncoveredKinds:Array<String>, uncoveredMaterialKinds:Array<String>, unusedMaterialRegistrations:Array<String>, unusedRegistrations:Array<String>, usedKinds:Array<String>, usedMaterialKinds:Array<String> };

typedef Scene3DRenderList = { instancedMeshCount:Float, lights:flight.esm.types.lighting_contract.Types.Scene3DLightBlock, meshCount:Float, viewProjection:flight.esm.types.geometry.Types.Matrix4, visibleInstancedMeshes:Array<flight.esm.types.meshgeometry.Types.InstancedMesh>, visibleMeshes:Array<flight.esm.types.meshgeometry.Types.Mesh> };

typedef Scene3DRenderProxy = { ?alpha:Null<Float>, ?colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias>, ?colorMatrix:Null<js.lib.Float32Array>, ?instanceCount:Null<Float>, ?instanceMatrices:Null<js.lib.Float32Array>, ?instanceColors:Null<js.lib.Float32Array>, ?jointMatrices:Null<js.lib.Float32Array>, ?normalMatrices:Null<js.lib.Float32Array>, material:flight.esm.types.materials_contract.Types.Material3D, normalMatrix:flight.esm.types.geometry.Types.Matrix3, subset:flight.esm.types.meshgeometry.Types.MeshSubset, worldMatrix:flight.esm.types.geometry.Types.Matrix4 };

typedef SceneCoverage = String;

typedef SceneCoverageCatalog = Array<flight.esm.types.render_contract.Types.CatalogEntry>;

typedef SceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef ShapeRasterizer = ((context:js.html.CanvasRenderingContext2D, commands:Array<flight.esm.types.shape.Types.ShapeCommandToken>, state:flight.esm.types.render_contract.Types.RenderState) -> Void);

typedef SpriteRenderer = flight.esm.types.render.Types.SpriteRenderer;

typedef StrokeTessellator = ((path:flight.esm.types.path_contract.Types.PathRaw, style:flight.esm.types.path.Types.StrokeStyle, ?tolerance:Null<Float>) -> Null<flight.esm.types.path.Types.PathMesh>);

typedef UnavailableSceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable };

typedef UnregisteredSceneCoverageEntry = { coverage:String, facet:flight.esm.types.requirement.Types.RequirementFacet, kind:String, registry:flight.esm.types.render_contract.Types.RenderRegistryTable, module:String, registrar:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
