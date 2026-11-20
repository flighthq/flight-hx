package flight.esm.types.render_gl;

#if (js && flight_esm)
typedef GlAppRenderView = { renderState:flight.esm.types.render_gl.Types.GlRenderState, renderTarget:flight.esm.types.render_gl.Types.GlTextureRenderTarget, viewport:flight.esm.types.node.Types.Viewport };

typedef GlAppRenderViewOptions = { ?context:Null<flight.esm.types.render_gl.Types.GlContextOptions>, ?render:Null<flight.esm.types.render_gl.Types.GlRenderStateOptions>, ?target:Dynamic };

typedef GlBitmapShader = { program:Dynamic, bind:((gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void), locations:flight.esm.types.render_gl.Types.GlShaderLocations };

typedef GlBlendEquation = String;

typedef GlBlendFactor = String;

typedef GlBlendRealization = { src:flight.esm.types.render_gl.Types.GlBlendFactor, dst:flight.esm.types.render_gl.Types.GlBlendFactor, ?equation:Null<String> };

typedef GlBlendSignature = { dst:Float, equation:Float, src:Float };

typedef GlBoundShader = { locations:Null<flight.esm.types.render_gl.Types.GlShaderLocations>, program:Dynamic };

typedef GlCapabilities = { maxTextureSize:Float, maxTextureUnits:Float, maxSamples:Float, maxDrawBuffers:Float, maxColorAttachments:Float, maxRenderbufferSize:Float, supportsColorBufferFloat:Bool, supportsFloatLinear:Bool, supportsSrgb:Bool, maxAnisotropy:Float };

typedef GlColorAdjustmentMaterialFeature = { fragmentShaderChunk:String, matrixFragmentShaderChunk:String, drawShapeMeshes:((state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D, meshes:Array<flight.esm.types.render_gl.Types.GlShapeMesh>) -> Void), flush:((state:flight.esm.types.render_gl.Types.GlRenderState, count:Float) -> Bool), record:((runtime:flight.esm.types.render_gl.Types.GlRenderStateRuntime, colorScaleBias:Dynamic, instanceIndex:Float) -> Void) };

typedef GlColorAdjustmentMaterialFeatureGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, colorScaleBias:Dynamic) -> Void);

typedef GlColorAdjustmentResources = { matrixInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, scaleBiasInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, tintInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, uniformScaleBiasShader:flight.esm.types.render_gl.Types.GlUniformColorScaleBiasShader };

typedef GlColorScaleBiasInstancedShader = { program:Dynamic, locCorner:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlCompressedTextureDecoder = ((format:flight.esm.types.texture_formats.Types.TextureContainerFormat, width:Float, height:Float, data:js.lib.Uint8Array) -> Null<js.lib.Uint8Array>);

typedef GlCompressedTextureSupport = { astc:Bool, bptc:Bool, etc:Bool, pvrtc:Bool, rgtc:Bool, s3tc:Bool };

typedef GlCompressedTextureUploader = ((gl:flight.esm.types.render_gl.Types.GlContext, image:flight.esm.types.image_contract.Types.CompressedImageResource, decode:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, ?colorSpace:Null<String>) -> Bool);

typedef GlContext = Dynamic;

typedef GlContextLossSignals = { onGlContextLost:flight.esm.types.signals.Types.Signal<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, onGlContextRestored:flight.esm.types.signals.Types.Signal<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)> };

typedef GlContextOptions = { ?antialias:Null<Bool>, ?contextAttributes:Dynamic, ?powerPreference:Null<String> };

typedef GlContextRuntime = { gl:flight.esm.types.render_gl.Types.GlContext, references:Float, teardowns:Array<((gl:flight.esm.types.render_gl.Types.GlContext) -> Void)>, currentBlendSignature:Null<flight.esm.types.render_gl.Types.GlBlendSignature>, currentShader:Null<flight.esm.types.render_gl.Types.GlBoundShader>, currentTextureRealization:Null<flight.esm.types.render_gl.Types.GlTextureRealization>, quadIndexBuffer:Dynamic, quadVertexBuffer:Dynamic, textureCache:Dynamic, textureSourcePremultipliedTextureCache:Dynamic, textureSourcePremultipliedSrgbTextureCache:Dynamic, textureSourceStraightTextureCache:Dynamic, textureSourceStraightSrgbTextureCache:Dynamic, ?glExternalTextureCache:Dynamic, ?glRenderTextureCache:Dynamic, ?videoTextureCache:Dynamic, ?videoSrgbTextureCache:Dynamic, ?mipmappedTextures:Dynamic, ?anisotropyExt:Dynamic, ?maxAnisotropy:Null<Float>, ?sceneMeshUploadCache:Dynamic, colorAdjustmentResources:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentResources>, particleResources:Null<flight.esm.types.render_gl.Types.GlParticleResources>, quadBatchResources:Null<flight.esm.types.render_gl.Types.GlQuadBatchResources>, shapeMeshResources:Null<flight.esm.types.render_gl.Types.GlShapeMeshResources>, binding:Dynamic, ?uid:Null<String> };

typedef GlContextState = { gl:flight.esm.types.render_gl.Types.GlContext };

typedef GlCubeRenderTarget = { gl:flight.esm.types.render_gl.Types.GlContext, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, depthStencilRenderbuffer:Dynamic, framebuffer:Dynamic, height:Float, size:Float, texture:Dynamic, textures:Array<Dynamic>, width:Float };

typedef GlCubeRenderTargetOptions = { ?depth:Null<Bool> };

typedef GlCullFaceKind = String;

typedef GlCustomMaterialShaderSource = { fragment:String, vertex:String };

typedef GlDepthFuncKind = String;

typedef GlEffectContext = { state:flight.esm.types.render_gl.Types.GlRenderState, source:flight.esm.types.render_gl.Types.GlTextureRenderTarget, dest:flight.esm.types.render_gl.Types.GlTextureRenderTarget, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, sceneDepthTexture:Dynamic, sceneVelocityTexture:Dynamic };

typedef GlEffectRegistration = { ?isResolvable:Null<flight.esm.types.render_gl.Types.GlEffectResolver>, runner:flight.esm.types.render_gl.Types.GlEffectRunner };

typedef GlEffectResolver = ((state:flight.esm.types.render_gl.Types.GlRenderState, effect:flight.esm.types.effects.Types.Effect) -> Bool);

typedef GlEffectRunner = ((context:flight.esm.types.render_gl.Types.GlEffectContext, effect:flight.esm.types.effects.Types.Effect) -> Void);

typedef GlFramebufferStatusKind = String;

typedef GlFullscreenProgram = { program:Dynamic, locPosition:Float, locTexCoord:Float, texture:Dynamic, textures:Array<Dynamic> };

typedef GlMeshMaterialRenderer = { bind:((state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>, lights:flight.esm.types.lighting_contract.Types.Scene3DLightBlock, camera:flight.esm.types.camera.Types.Camera3D) -> Void), draw:((state:flight.esm.types.render_gl.Types.GlRenderState, proxy:flight.esm.types.render_contract.Types.Scene3DRenderProxy, geometry:flight.esm.types.meshgeometry.Types.MeshGeometry) -> Void) };

typedef GlModifierBindContext = { acquireModifierTextureUnit:(() -> Float), index:Float, program:Dynamic, state:flight.esm.types.render_gl.Types.GlRenderState };

typedef GlModifierSnippet = { ?bind:Null<((modifier:flight.esm.types.shading.Types.Modifier, context:flight.esm.types.render_gl.Types.GlModifierBindContext) -> Void)>, contribution:((modifier:flight.esm.types.shading.Types.Modifier, index:Float) -> String), ?declarations:Null<((modifier:flight.esm.types.shading.Types.Modifier, index:Float) -> String)>, kind:String, slot:String, ?getDefineSignature:Null<((modifier:flight.esm.types.shading.Types.Modifier) -> String)> };

typedef GlParticleResources = { cornerBuffer:Dynamic, instanceBuffer:Dynamic, shader:flight.esm.types.render_gl.Types.GlParticleShader };

typedef GlParticleShader = { program:Dynamic, locCorner:Float, locPos:Float, locCosScale:Float, locSinScale:Float, locColor:Float, locUvRect:Float, locSize:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlPbrExtensionBindContext = { bindTransmissionSceneColor:((samplerUniform:String, maxLodUniform:String) -> Bool), bindTexture:((samplerUniform:String, uvSetUniform:String, uvTransformUniform:String, texture:Dynamic, uvSet:flight.esm.types.materials_contract.Types.PbrUvSet) -> Bool), setLinearColor:((uniform:String, color:Float) -> Void), setFloat:((uniform:String, value:Float) -> Void) };

typedef GlPbrExtensionRegistration = { bind:((context:flight.esm.types.render_gl.Types.GlPbrExtensionBindContext, extension:flight.esm.types.materials_contract.Types.PbrExtension) -> Void), createShaderContribution:((context:flight.esm.types.render_gl.Types.GlPbrExtensionShaderContext, extension:flight.esm.types.materials_contract.Types.PbrExtension) -> flight.esm.types.render_gl.Types.GlPbrExtensionShaderContribution), isSupported:((extension:flight.esm.types.materials_contract.Types.PbrExtension) -> Bool) };

typedef GlPbrExtensionShaderContext = { hasTransmissionSceneColor:(() -> Bool), isTextureReady:((texture:Dynamic) -> Bool) };

typedef GlPbrExtensionShaderContribution = { applySurface:String, contributeIbl:String, contributePunctual:String, finalize:String, fragmentDeclarations:String, fragmentFunctions:String, key:String, ?samplesTransmissionSceneColor:Null<Bool>, textureCount:Float };

typedef GlQuadBatchResources = { cornerBuffer:Dynamic, shader:flight.esm.types.render_gl.Types.GlQuadBatchShader, writerColorScaleBiasBuffer:Dynamic, writerInstanceBuffer:Dynamic, writerMaterialBuffer:Dynamic };

typedef GlQuadBatchShader = { program:Dynamic, locCorner:Float, locMatAB:Float, locMatCD:Float, locMatTXTY:Float, locUvOriginAxisU:Float, locUvAxisV:Float, locAlpha:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlQuadMaterialRenderer = { instanceFloatCount:Float, bind:((state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>) -> Void), ?packInstance:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, out:js.lib.Float32Array, offset:Float) -> Void)> };

typedef GlRenderOptions = { ?allowSmoothing:Null<Bool>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef GlRenderPass = { gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlRenderTarget };

typedef GlRenderRegistries = { blendRealizations:js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>, ?colorAdjustmentFeature:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeatureGuard>, compressedTextureDecoder:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, compressedTextureUpload:Null<flight.esm.types.render_gl.Types.GlCompressedTextureUploader>, customEffectShaders:js.lib.Map<String, String>, customMaterialShaders:js.lib.Map<String, flight.esm.types.render_gl.Types.GlCustomMaterialShaderSource>, materialRenderers:js.lib.Map<String, Dynamic>, modifierSnippets:js.lib.Map<String, flight.esm.types.render_gl.Types.GlModifierSnippet>, pbrExtensions:js.lib.Map<String, flight.esm.types.render_gl.Types.GlPbrExtensionRegistration>, effects:js.lib.Map<String, flight.esm.types.render_gl.Types.GlEffectRegistration>, passes:Null<Array<flight.esm.types.render_gl.Types.GlScene3DPass>>, shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, textureResolvers:js.lib.Map<String, flight.esm.types.render_gl.Types.GlTextureResolver>, velocityWriters:js.lib.Map<String, flight.esm.types.render_gl.Types.GlVelocityWriter>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef GlRenderState = { applyBlendMode:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, blendMode:Null<String>) -> Void)>, contextState:flight.esm.types.render_gl.Types.GlContextState, gl:flight.esm.types.render_gl.Types.GlContext, registries:flight.esm.types.render_gl.Types.GlRenderRegistries, allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef GlRenderStateOptions = { ?blendRealizations:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>>, ?colorAdjustmentFeature:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeatureGuard>, ?compressedTextureDecoder:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, ?compressedTextureUpload:Null<flight.esm.types.render_gl.Types.GlCompressedTextureUploader>, ?customEffectShaders:Null<js.lib.Map<String, String>>, ?customMaterialShaders:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlCustomMaterialShaderSource>>, ?effects:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlEffectRegistration>>, ?materialRenderers:Null<js.lib.Map<String, Dynamic>>, ?modifierSnippets:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlModifierSnippet>>, ?passes:Null<Array<flight.esm.types.render_gl.Types.GlScene3DPass>>, ?pbrExtensions:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlPbrExtensionRegistration>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlTextureResolver>>, ?velocityWriters:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlVelocityWriter>>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?allowSmoothing:Null<Bool>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef GlRenderStateRuntime = { context:flight.esm.types.render_gl.Types.GlContextRuntime, registries:flight.esm.types.render_gl.Types.GlRenderRegistries, modifierSnippetRevision:Float, pbrExtensionRevision:Float, teardowns:Array<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, bindingCacheGuard:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, expectedProgram:Dynamic) -> Void)>, ?flushPendingDraws:Null<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, defaultBitmapShader:Null<flight.esm.types.render_gl.Types.GlBitmapShader>, ?particleInstanceData:Null<js.lib.Float32Array>, ?materialBitmapShaderMap:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlBitmapShader>>, ?webglShaderBindingResolver:Null<((renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<flight.esm.types.render_gl.Types.GlBitmapShader>)>, quadBatchWriterBlendMode:Null<String>, quadBatchWriterMaterial:Null<flight.esm.types.materials_contract.Types.Material>, quadBatchWriterMaterialRenderer:Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>, quadBatchWriterMaterialFloats:Float, quadBatchWriterMaterialData:js.lib.Float32Array, quadBatchWriterCount:Float, quadBatchWriterInstanceData:js.lib.Float32Array, quadBatchWriterTexture:Dynamic, quadBatchWriterSampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, quadBatchWriterStraightAlpha:Bool, quadBatchWriterSmoothing:Null<Bool>, ?quadBatchWriterColorScaleBiasMode:Null<Float>, ?quadBatchWriterUniformColorScaleBias:Dynamic, ?quadBatchWriterColorScaleBiasData:Null<js.lib.Float32Array>, ?quadBatchWriterColorMatrixData:Null<js.lib.Float32Array>, ?quadBatchWriterColorTintData:Null<js.lib.Uint32Array>, clipForms:Array<String>, ?currentMaskDepth:Null<Float>, ?currentScissorRect:Null<flight.esm.types.render_gl.Types.GlScissorRect>, currentFramebuffer:Dynamic, currentPass:Null<flight.esm.types.render_gl.Types.GlRenderPass>, ?currentRenderTarget:Dynamic, renderTargetViewport:Null<flight.esm.types.render_gl.Types.GlViewportRect>, ?glRenderTextureGuard:Null<flight.esm.types.render_gl.Types.GlRenderTextureGuard>, quadVertexData:js.lib.Float32Array, matrixArray:js.lib.Float32Array, ?scissorStack:Null<Array<flight.esm.types.render_gl.Types.GlScissorRect>>, currentFrameId:Float, renderAdaptHook:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>, renderProxyAdapterMap:Dynamic, renderProxyMap:Dynamic, renderProxySources:js.lib.Set<flight.esm.types.node.Types.NodeAny>, registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)>, rendererMapId:Float, tempStack:Array<flight.esm.types.node.Types.NodeAny>, binding:Dynamic, ?uid:Null<String> };

typedef GlRenderStats = { drawCalls:Float, triangles:Float, textureBinds:Float, programSwitches:Float, framebufferBinds:Float, uniformUploads:Float };

typedef GlRenderTarget = { gl:flight.esm.types.render_gl.Types.GlContext, framebuffer:Dynamic, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlRenderTextureEntry = { status:flight.esm.types.render_gl.Types.GlRenderTextureStatus, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget };

typedef GlRenderTextureExplanation = { height:Float, status:flight.esm.types.render_gl.Types.GlRenderTextureStatus, width:Float };

typedef GlRenderTextureGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, explanation:flight.esm.types.render_gl.Types.GlRenderTextureExplanation) -> Void);

typedef GlRenderTexturePool = { context:Null<flight.esm.types.render_gl.Types.GlContext>, destroyed:Bool, effectTargets:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, free:Array<flight.esm.types.render_contract.Types.RenderTexture>, leased:js.lib.Set<flight.esm.types.render_contract.Types.RenderTexture> };

typedef GlRenderTextureStatus = String;

typedef GlRenderViewResources = { renderState:flight.esm.types.render_gl.Types.GlRenderState, renderTarget:flight.esm.types.render_gl.Types.GlTextureRenderTarget, viewport:flight.esm.types.node.Types.Viewport };

typedef GlScene3DPass = ((state:flight.esm.types.render_gl.Types.GlRenderState, scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike) -> Void);

typedef GlScissorRect = { height:Float, width:Float, x:Float, y:Float };

typedef GlScreenRenderTarget = { framebuffer:Dynamic, gl:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlShader = { program:Dynamic, bind:((gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void) };

typedef GlShaderLocations = { program:Dynamic, locPosition:Float, locTexCoord:Float, locMatrix:Dynamic, locAlpha:Dynamic, ?locColorScale:Dynamic, ?locColorBias:Dynamic, ?locHasColorScaleBias:Dynamic, locTexture:Dynamic };

typedef GlShapeMesh = { vertices:js.lib.Float32Array, indices:js.lib.Uint16Array, color:Float, alpha:Float };

typedef GlShapeMeshBinding = { program:Dynamic, vertexBuffer:Dynamic, indexBuffer:Dynamic, positionLocation:Float, matrixLocation:Dynamic, colorLocation:Dynamic };

typedef GlShapeMeshColorScaleBiasShader = { program:Dynamic, positionLocation:Float, matrixLocation:Dynamic, colorLocation:Dynamic, colorScaleLocation:Dynamic, colorBiasLocation:Dynamic, ?colorMatrixLocations:Null<Array<Dynamic>> };

typedef GlShapeMeshResources = { binding:flight.esm.types.render_gl.Types.GlShapeMeshBinding, colorMatrixShader:Null<flight.esm.types.render_gl.Types.GlShapeMeshColorScaleBiasShader>, colorScaleBiasShader:Null<flight.esm.types.render_gl.Types.GlShapeMeshColorScaleBiasShader> };

typedef GlSkinPaletteTexture = { jointCapacity:Float, texture:Dynamic };

typedef GlSurface = { __brand:String, context:flight.esm.types.render_gl.Types.GlContext };

typedef GlTextureDescriptor = { ?wrapS:Null<String>, ?wrapT:Null<String>, ?minFilter:Null<String>, ?magFilter:Null<String>, ?mipmaps:Null<Bool>, ?anisotropy:Null<Float>, ?premultiplyAlpha:Null<Bool>, ?format:Null<String> };

typedef GlTextureFilterKind = String;

typedef GlTextureInternalFormat = String;

typedef GlTextureRealization = { straightAlpha:Bool, texture:Dynamic };

typedef GlTextureRenderTarget = { framebuffer:Dynamic, requestedAxes:flight.esm.types.render_contract.Types.RenderTargetAxes, format:flight.esm.types.render_contract.Types.RenderTargetFormat, colorFormats:Array<flight.esm.types.render_contract.Types.RenderTargetFormat>, depth:flight.esm.types.render_contract.Types.RenderTargetDepth, sampleCount:Float, resolveFramebuffer:Dynamic, textures:Array<Dynamic>, texture:Dynamic, depthTexture:Dynamic, colorRenderbuffers:Array<Dynamic>, depthStencilRenderbuffer:Dynamic, gl:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlTextureRenderTargetPool = { free:Array<flight.esm.types.render_gl.Types.GlTextureRenderTarget> };

typedef GlTextureResolver = ((state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, premultiply:Bool, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace) -> Null<flight.esm.types.render_gl.Types.GlTextureRealization>);

typedef GlTextureWrapKind = String;

typedef GlUniformColorScaleBiasShader = { program:Dynamic, locCorner:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic, locColorScale:Dynamic, locColorBias:Dynamic };

typedef GlVelocityContext = { state:flight.esm.types.render_gl.Types.GlRenderState, field:flight.esm.types.velocity.Types.VelocityField, width:Float, height:Float, pixelRatio:Float };

typedef GlVelocityWriter = ((context:flight.esm.types.render_gl.Types.GlVelocityContext, node:Dynamic) -> Void);

typedef GlViewportRect = { height:Float, width:Float, x:Float, y:Float };

typedef HostGlCapabilities = { ?context:Null<flight.esm.types.render_gl.Types.HostGlCapability> };

typedef HostGlCapability = { subscribe:((surface:flight.esm.types.surface.Types.Surface, onLost:Dynamic, onRestored:Dynamic) -> Dynamic), acquire:((surface:flight.esm.types.surface.Types.Surface, ?options:Null<flight.esm.types.render_gl.Types.GlContextOptions>) -> Null<flight.esm.types.render_gl.Types.GlContext>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Null<flight.esm.types.render_gl.Types.GlContextOptions>) -> Dynamic), release:((surface:flight.esm.types.surface.Types.Surface) -> Void) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
