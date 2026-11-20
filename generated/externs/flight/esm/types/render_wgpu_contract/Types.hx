package flight.esm.types.render_wgpu_contract;

#if (js && flight_esm)
typedef HostWgpuCapabilities = { ?context:Null<flight.esm.types.render_wgpu_contract.Types.HostWgpuCapability> };

typedef HostWgpuCapability = { acquire:((surface:flight.esm.types.surface.Types.Surface, options:flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisitionOptions) -> js.lib.Promise<flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisition>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float) -> Dynamic), attachSurface:((surface:flight.esm.types.surface.Types.Surface, attachment:flight.esm.types.render_wgpu_contract.Types.WgpuSurfaceAttachment) -> Null<flight.esm.types.render_wgpu_contract.Types.WgpuSurfaceAttachResult>), isSupported:(() -> Bool), release:((acquisition:flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisition) -> Void) };

typedef WgpuAdapter = { features:flight.esm.types.render_wgpu_contract.Types.WgpuSupportedFeatures, limits:flight.esm.types.render_wgpu_contract.Types.WgpuSupportedLimits, requestDevice:((?descriptor:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceDescriptor>) -> js.lib.Promise<flight.esm.types.render_wgpu_contract.Types.WgpuDevice>) };

typedef WgpuAdapterCapabilities = { supportsFloat32Filterable:Bool, supportsTimestampQuery:Bool, maxSampleCount:Float, maxTextureDimension2D:Float };

typedef WgpuAddressMode = String;

typedef WgpuBindGroup = Dynamic;

typedef WgpuBindGroupDescriptor = { entries:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBindGroupEntry>, ?label:Null<String>, layout:Dynamic };

typedef WgpuBindGroupEntry = { binding:Float, resource:Dynamic };

typedef WgpuBindGroupLayout = Dynamic;

typedef WgpuBindGroupLayoutDescriptor = { entries:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBindGroupLayoutEntry>, ?label:Null<String> };

typedef WgpuBindGroupLayoutEntry = { binding:Float, ?buffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBufferBindingLayout>, ?externalTexture:Dynamic, ?sampler:Null<flight.esm.types.render_wgpu_contract.Types.WgpuSamplerBindingLayout>, ?storageTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuStorageTextureBindingLayout>, ?texture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindingLayout>, visibility:Float };

typedef WgpuBindGroupLayouts = { textureBindGroupLayout:Dynamic, uniformBindGroupLayout:Dynamic };

typedef WgpuBindingResource = Dynamic;

typedef WgpuBitmapShader = { pipeline:Dynamic, bind:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderProxy:Dynamic) -> Void) };

typedef WgpuBlendComponent = { ?dstFactor:Null<String>, ?operation:Null<String>, ?srcFactor:Null<String> };

typedef WgpuBlendFactor = String;

typedef WgpuBlendOperation = String;

typedef WgpuBlendState = { alpha:flight.esm.types.render_wgpu_contract.Types.WgpuBlendComponent, color:flight.esm.types.render_wgpu_contract.Types.WgpuBlendComponent };

typedef WgpuBuffer = { ?mapState:Null<String>, size:Float, usage:Float, destroy:(() -> Void), getMappedRange:((?offset:Null<Float>, ?size:Null<Float>) -> js.lib.ArrayBuffer), mapAsync:((mode:Float, ?offset:Null<Float>, ?size:Null<Float>) -> js.lib.Promise<Void>), unmap:(() -> Void) };

typedef WgpuBufferBinding = { buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, ?offset:Null<Float>, ?size:Null<Float> };

typedef WgpuBufferBindingLayout = { ?hasDynamicOffset:Null<Bool>, ?minBindingSize:Null<Float>, ?type:Null<String> };

typedef WgpuBufferBindingType = String;

typedef WgpuBufferDescriptor = { ?label:Null<String>, ?mappedAtCreation:Null<Bool>, size:Float, usage:Float };

typedef WgpuBufferMapState = String;

typedef WgpuBufferSource = Dynamic;

typedef WgpuCanvasAlphaMode = String;

typedef WgpuCanvasConfiguration = { ?alphaMode:Null<String>, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?usage:Null<Float>, ?viewFormats:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat>> };

typedef WgpuCanvasContext = { configure:((configuration:flight.esm.types.render_wgpu_contract.Types.WgpuCanvasConfiguration) -> Void), getCurrentTexture:(() -> flight.esm.types.render_wgpu_contract.Types.WgpuTexture), unconfigure:(() -> Void) };

typedef WgpuClipContourEntry = { vertexBuffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, vertexCount:Float, uniformBuffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, bindGroup:Dynamic, depth:Float };

typedef WgpuClipContourPipelines = { write:Dynamic, erase:Dynamic, bindGroupLayout:Dynamic };

typedef WgpuColor = Dynamic;

typedef WgpuColorAdjustmentFlush = { data:Dynamic, floats:Float, module:Dynamic };

typedef WgpuColorAdjustmentMaterialFeature = { fragmentShaderChunk:String, matrixFragmentShaderChunk:String, ?drawShapeMeshes:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D, meshes:Array<flight.esm.types.render_wgpu_contract.Types.WgpuShapeMesh>, buffers:flight.esm.types.render_wgpu_contract.Types.WgpuShapeMeshBuffers) -> Void)>, record:((runtime:flight.esm.types.render_wgpu_contract.Types.WgpuRenderStateRuntime, colorScaleBias:Dynamic, instanceIndex:Float) -> Void), resolveFlush:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, count:Float) -> Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentFlush>) };

typedef WgpuColorAdjustmentMaterialFeatureGuard = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, colorScaleBias:Dynamic) -> Void);

typedef WgpuColorDict = { a:Float, b:Float, g:Float, r:Float };

typedef WgpuColorTargetState = { ?blend:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBlendState>, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?writeMask:Null<Float> };

typedef WgpuCommandBuffer = Dynamic;

typedef WgpuCommandBufferDescriptor = { ?label:Null<String> };

typedef WgpuCommandEncoder = { beginRenderPass:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassDescriptor) -> flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassEncoder), copyTextureToBuffer:((source:flight.esm.types.render_wgpu_contract.Types.WgpuTexelCopyTextureInfo, destination:flight.esm.types.render_wgpu_contract.Types.WgpuTexelCopyBufferInfo, copySize:flight.esm.types.render_wgpu_contract.Types.WgpuExtent3D) -> Void), finish:((?descriptor:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCommandBufferDescriptor>) -> Dynamic) };

typedef WgpuCommandEncoderDescriptor = { ?label:Null<String> };

typedef WgpuCompareFunction = String;

typedef WgpuCompressedTextureDecoder = flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder;

typedef WgpuCompressedTextureSupport = { astc:Bool, bc:Bool, etc2:Bool };

typedef WgpuCompressedTextureUploader = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, image:flight.esm.types.image_contract.Types.CompressedImageResource, decode:Null<flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder>, ?colorSpace:Null<String>) -> Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureEntry>);

typedef WgpuCopyExternalImageDestInfo = { ?colorSpace:Null<String>, ?premultipliedAlpha:Null<Bool>, ?aspect:Null<String>, ?mipLevel:Null<Float>, ?origin:Dynamic, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture };

typedef WgpuCopyExternalImageSourceInfo = { ?flipY:Null<Bool>, ?origin:Dynamic, source:Dynamic };

typedef WgpuCullMode = String;

typedef WgpuCustomMaterialShaderSource = String;

typedef WgpuDepthStencilState = { ?depthBias:Null<Float>, ?depthBiasClamp:Null<Float>, ?depthBiasSlopeScale:Null<Float>, ?depthCompare:Null<String>, ?depthWriteEnabled:Null<Bool>, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?stencilBack:Null<flight.esm.types.render_wgpu_contract.Types.WgpuStencilFaceState>, ?stencilFront:Null<flight.esm.types.render_wgpu_contract.Types.WgpuStencilFaceState>, ?stencilReadMask:Null<Float>, ?stencilWriteMask:Null<Float> };

typedef WgpuDevice = { features:flight.esm.types.render_wgpu_contract.Types.WgpuSupportedFeatures, limits:flight.esm.types.render_wgpu_contract.Types.WgpuSupportedLimits, lost:js.lib.Promise<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceLostInfo>, queue:flight.esm.types.render_wgpu_contract.Types.WgpuQueue, createBindGroup:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuBindGroupDescriptor) -> Dynamic), createBindGroupLayout:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuBindGroupLayoutDescriptor) -> Dynamic), createBuffer:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuBufferDescriptor) -> flight.esm.types.render_wgpu_contract.Types.WgpuBuffer), createCommandEncoder:((?descriptor:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCommandEncoderDescriptor>) -> flight.esm.types.render_wgpu_contract.Types.WgpuCommandEncoder), createPipelineLayout:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuPipelineLayoutDescriptor) -> Dynamic), createRenderPipeline:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPipelineDescriptor) -> Dynamic), createSampler:((?descriptor:Null<flight.esm.types.render_wgpu_contract.Types.WgpuSamplerDescriptor>) -> Dynamic), createShaderModule:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuShaderModuleDescriptor) -> Dynamic), createTexture:((descriptor:flight.esm.types.render_wgpu_contract.Types.WgpuTextureDescriptor) -> flight.esm.types.render_wgpu_contract.Types.WgpuTexture), destroy:(() -> Void) };

typedef WgpuDeviceDescriptor = { ?defaultQueue:Null<flight.esm.types.render_wgpu_contract.Types.WgpuQueueDescriptor>, ?label:Null<String>, ?requiredFeatures:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuFeatureName>>, ?requiredLimits:Dynamic };

typedef WgpuDeviceLostInfo = { message:String, reason:flight.esm.types.render_wgpu_contract.Types.WgpuDeviceLostReason };

typedef WgpuDeviceLostReason = String;

typedef WgpuDeviceRuntime = { device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, references:Float, teardowns:Array<((device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice) -> Void)>, lost:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceLostInfo>, signals:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceSignals>, resources:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceRuntimeResources>, pipelineCache:js.lib.Map<String, Dynamic>, samplerCache:js.lib.Map<Float, Dynamic>, mipmapPipelineCache:js.lib.Map<flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, Dynamic>, textureCache:Dynamic, textureSourcePremultipliedTextureCache:Dynamic, textureSourcePremultipliedSrgbTextureCache:Dynamic, textureSourceStraightTextureCache:Dynamic, textureSourceStraightSrgbTextureCache:Dynamic, ?videoTextureCache:Dynamic, ?videoSrgbTextureCache:Dynamic, ?wgpuExternalTextureCache:Dynamic, ?wgpuRenderTextureCache:Dynamic, ?sceneMeshUploadCache:Dynamic, ?standardMaterialModule:Dynamic, ?colorScaleBiasModule:Dynamic, ?packedTintModule:Dynamic, ?colorMatrixModule:Dynamic, ?shapeMeshColorScaleBiasPipelines:Null<js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuShapeMeshPipeline>>, ?particleResources:Null<flight.esm.types.render_wgpu_contract.Types.WgpuParticleResources>, ?quadBatchResources:Null<flight.esm.types.render_wgpu_contract.Types.WgpuQuadBatchResources>, binding:Dynamic, ?uid:Null<String> };

typedef WgpuDeviceRuntimeResources = { linearSampler:Dynamic, nearestSampler:Dynamic, textureBindGroupLayout:Dynamic, uniformBindGroupLayout:Dynamic };

typedef WgpuDeviceSignals = { onDeviceLost:flight.esm.types.signals.Types.Signal<flight.esm.types.render_wgpu_contract.Types.WgpuDeviceLostInfo> };

typedef WgpuDeviceState = { device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice };

typedef WgpuEffectContext = { state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, source:flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget, dest:flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTargetPool, sceneDepthTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, sceneVelocityTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture> };

typedef WgpuEffectRegistration = { ?isResolvable:Null<flight.esm.types.render_wgpu_contract.Types.WgpuEffectResolver>, runner:flight.esm.types.render_wgpu_contract.Types.WgpuEffectRunner };

typedef WgpuEffectResolver = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, effect:flight.esm.types.effects.Types.Effect) -> Bool);

typedef WgpuEffectRunner = ((ctx:flight.esm.types.render_wgpu_contract.Types.WgpuEffectContext, effect:flight.esm.types.effects.Types.Effect) -> Void);

typedef WgpuExtent3D = Dynamic;

typedef WgpuExtent3DDict = { ?depthOrArrayLayers:Null<Float>, ?height:Null<Float>, width:Float };

typedef WgpuExternalImageSource = Dynamic;

typedef WgpuExternalTexture = Dynamic;

typedef WgpuExternalTextureBindingLayout = Dynamic;

typedef WgpuFeatureName = String;

typedef WgpuFilterMode = String;

typedef WgpuFragmentState = { targets:Array<Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorTargetState>>, ?constants:Dynamic, ?entryPoint:Null<String>, module:Dynamic };

typedef WgpuFrontFace = String;

typedef WgpuFullscreenPipeline = { pipeline:Dynamic, pipelineLayout:Dynamic, uniformBindGroupLayout:Dynamic, textureBindGroupLayouts:Array<Dynamic>, emptyUniformBindGroup:Dynamic };

typedef WgpuGpu = { getPreferredCanvasFormat:(() -> flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat), requestAdapter:((?options:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRequestAdapterOptions>) -> js.lib.Promise<Null<flight.esm.types.render_wgpu_contract.Types.WgpuAdapter>>) };

typedef WgpuHostAcquisition = { context:flight.esm.types.render_wgpu_contract.Types.WgpuCanvasContext, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ownership:String, surface:flight.esm.types.surface.Types.WgpuPresentationSurface };

typedef WgpuHostAcquisitionOptions = { ?format:Null<String>, ?powerPreference:Null<String> };

typedef WgpuIndexFormat = String;

typedef WgpuLoadOp = String;

typedef WgpuMeshInstanceBufferSlot = { buffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, capacity:Float };

typedef WgpuMeshMaterialRenderer = { bind:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>, lights:flight.esm.types.lighting_contract.Types.Scene3DLightBlock, camera:flight.esm.types.camera.Types.Camera3D) -> Void), draw:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, proxy:flight.esm.types.render_contract.Types.Scene3DRenderProxy, geometry:flight.esm.types.meshgeometry.Types.MeshGeometry) -> Void) };

typedef WgpuMipmapFilterMode = String;

typedef WgpuModifierCompileContext = { acquireTexture:((texture:flight.esm.types.texture_contract.Types.Texture) -> Float), uniformBase:Float };

typedef WgpuModifierContribution = { ?declarations:Null<String>, source:String };

typedef WgpuModifierSnippet = { ?bind:Null<((modifier:flight.esm.types.shading.Types.Modifier, out:js.lib.Float32Array, offset:Float) -> Void)>, contribution:((modifier:flight.esm.types.shading.Types.Modifier, index:Float, context:flight.esm.types.render_wgpu_contract.Types.WgpuModifierCompileContext) -> flight.esm.types.render_wgpu_contract.Types.WgpuModifierContribution), ?textures:Null<((modifier:flight.esm.types.shading.Types.Modifier, out:Array<Dynamic>, offset:Float) -> Float)>, kind:String, slot:String, ?getDefineSignature:Null<((modifier:flight.esm.types.shading.Types.Modifier) -> String)> };

typedef WgpuMultisampleState = { ?alphaToCoverageEnabled:Null<Bool>, ?count:Null<Float>, ?mask:Null<Float> };

typedef WgpuOffscreenRenderStateResult = Dynamic;

typedef WgpuOrigin2D = Dynamic;

typedef WgpuOrigin2DDict = { ?x:Null<Float>, ?y:Null<Float> };

typedef WgpuOrigin3D = Dynamic;

typedef WgpuOrigin3DDict = { ?x:Null<Float>, ?y:Null<Float>, ?z:Null<Float> };

typedef WgpuParticleResources = { instanceBindGroupLayout:Dynamic, module:Dynamic, pipelineLayout:Dynamic, pipelines:js.lib.Map<flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, Dynamic> };

typedef WgpuPipelineLayout = Dynamic;

typedef WgpuPipelineLayoutDescriptor = { bindGroupLayouts:Array<Dynamic>, ?immediateSize:Null<Float>, ?label:Null<String> };

typedef WgpuPowerPreference = String;

typedef WgpuPresentationSurface = flight.esm.types.surface.Types.WgpuPresentationSurface;

typedef WgpuPrimitiveState = { ?cullMode:Null<String>, ?frontFace:Null<String>, ?stripIndexFormat:Null<String>, ?topology:Null<String>, ?unclippedDepth:Null<Bool> };

typedef WgpuPrimitiveTopology = String;

typedef WgpuProgrammableStage = { ?constants:Dynamic, ?entryPoint:Null<String>, module:Dynamic };

typedef WgpuQuadBatchResources = { instanceBindGroupLayout:Dynamic, materialBindGroupLayout:Dynamic, basePipelineLayout:Dynamic, materialPipelineLayout:Dynamic, pipelines:Dynamic };

typedef WgpuQuadBatchWriterBufferSlot = { instanceBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, instanceCapacity:Float, materialBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, materialCapacity:Float };

typedef WgpuQuadMaterialRenderer = { instanceFloatCount:Float, getShaderModule:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState) -> Dynamic), ?packInstance:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, material:Dynamic, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, out:js.lib.Float32Array, offset:Float) -> Void)> };

typedef WgpuQueue = { copyExternalImageToTexture:((source:flight.esm.types.render_wgpu_contract.Types.WgpuCopyExternalImageSourceInfo, destination:flight.esm.types.render_wgpu_contract.Types.WgpuCopyExternalImageDestInfo, copySize:flight.esm.types.render_wgpu_contract.Types.WgpuExtent3D) -> Void), onSubmittedWorkDone:(() -> js.lib.Promise<Void>), submit:((commandBuffers:Array<Dynamic>) -> Void), writeBuffer:((buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, bufferOffset:Float, data:flight.esm.types.render_wgpu_contract.Types.WgpuBufferSource, ?dataOffset:Null<Float>, ?size:Null<Float>) -> Void), writeTexture:((destination:flight.esm.types.render_wgpu_contract.Types.WgpuTexelCopyTextureInfo, data:flight.esm.types.render_wgpu_contract.Types.WgpuBufferSource, dataLayout:flight.esm.types.render_wgpu_contract.Types.WgpuTexelCopyBufferLayout, size:flight.esm.types.render_wgpu_contract.Types.WgpuExtent3D) -> Void) };

typedef WgpuQueueDescriptor = { ?label:Null<String> };

typedef WgpuRenderOptions = { ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?format:Null<String>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef WgpuRenderPass = { colorView:Dynamic, encoder:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassEncoder>, ownsFrame:Bool, saved:flight.esm.types.render_wgpu_contract.Types.WgpuSavedPassState, state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, target:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTarget, viewport:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassViewport };

typedef WgpuRenderPassColorAttachment = { ?clearValue:Dynamic, ?depthSlice:Null<Float>, loadOp:flight.esm.types.render_wgpu_contract.Types.WgpuLoadOp, ?resolveTarget:Dynamic, storeOp:flight.esm.types.render_wgpu_contract.Types.WgpuStoreOp, view:Dynamic };

typedef WgpuRenderPassDepthStencilAttachment = { ?depthClearValue:Null<Float>, ?depthLoadOp:Null<String>, ?depthReadOnly:Null<Bool>, ?depthStoreOp:Null<String>, ?stencilClearValue:Null<Float>, ?stencilLoadOp:Null<String>, ?stencilReadOnly:Null<Bool>, ?stencilStoreOp:Null<String>, view:Dynamic };

typedef WgpuRenderPassDescriptor = { colorAttachments:Array<Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassColorAttachment>>, ?depthStencilAttachment:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassDepthStencilAttachment>, ?label:Null<String>, ?maxDrawCount:Null<Float> };

typedef WgpuRenderPassEncoder = { draw:((vertexCount:Float, ?instanceCount:Null<Float>, ?firstVertex:Null<Float>, ?firstInstance:Null<Float>) -> Void), drawIndexed:((indexCount:Float, ?instanceCount:Null<Float>, ?firstIndex:Null<Float>, ?baseVertex:Null<Float>, ?firstInstance:Null<Float>) -> Void), end:(() -> Void), setBindGroup:((index:Float, bindGroup:Dynamic, ?dynamicOffsets:Dynamic) -> Void), setIndexBuffer:((buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, indexFormat:flight.esm.types.render_wgpu_contract.Types.WgpuIndexFormat, ?offset:Null<Float>, ?size:Null<Float>) -> Void), setPipeline:((pipeline:Dynamic) -> Void), setScissorRect:((x:Float, y:Float, width:Float, height:Float) -> Void), setStencilReference:((reference:Float) -> Void), setVertexBuffer:((slot:Float, buffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, ?offset:Null<Float>, ?size:Null<Float>) -> Void), setViewport:((x:Float, y:Float, width:Float, height:Float, minDepth:Float, maxDepth:Float) -> Void) };

typedef WgpuRenderPassViewport = { height:Float, width:Float };

typedef WgpuRenderPipeline = Dynamic;

typedef WgpuRenderPipelineDescriptor = { ?depthStencil:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDepthStencilState>, ?fragment:Null<flight.esm.types.render_wgpu_contract.Types.WgpuFragmentState>, ?label:Null<String>, layout:Dynamic, ?multisample:Null<flight.esm.types.render_wgpu_contract.Types.WgpuMultisampleState>, ?primitive:Null<flight.esm.types.render_wgpu_contract.Types.WgpuPrimitiveState>, vertex:flight.esm.types.render_wgpu_contract.Types.WgpuVertexState };

typedef WgpuRenderRegistries = { ?colorAdjustmentFeature:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeatureGuard>, compressedTextureDecoder:Null<flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder>, compressedTextureUpload:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCompressedTextureUploader>, customMaterialShaders:js.lib.Map<String, String>, gpuSkinning:Null<flight.esm.types.render_wgpu_contract.Types.WgpuSkinningAdapter>, materialRenderers:js.lib.Map<String, Dynamic>, modifierSnippets:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet>, effects:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuEffectRegistration>, passes:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuScene3DPass>>, shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, textureResolvers:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuTextureResolver>, velocityWriters:js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuVelocityWriter>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef WgpuRenderState = { applyBlendMode:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, blendMode:Null<String>) -> Void)>, deviceState:flight.esm.types.render_wgpu_contract.Types.WgpuDeviceState, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, registries:flight.esm.types.render_wgpu_contract.Types.WgpuRenderRegistries, allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef WgpuRenderStateOptions = { ?colorAdjustmentFeature:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_wgpu_contract.Types.WgpuColorAdjustmentMaterialFeatureGuard>, ?compressedTextureDecoder:Null<flight.esm.types.render_wgpu_compressed_texture_decoder_contract.Types.WgpuCompressedTextureDecoder>, ?compressedTextureUpload:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCompressedTextureUploader>, ?customMaterialShaders:Null<js.lib.Map<String, String>>, ?effects:Null<js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuEffectRegistration>>, ?gpuSkinning:Null<flight.esm.types.render_wgpu_contract.Types.WgpuSkinningAdapter>, ?materialRenderers:Null<js.lib.Map<String, Dynamic>>, ?modifierSnippets:Null<js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet>>, ?passes:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuScene3DPass>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuTextureResolver>>, ?velocityWriters:Null<js.lib.Map<String, flight.esm.types.render_wgpu_contract.Types.WgpuVelocityWriter>>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?format:Null<String>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef WgpuRenderStateRuntime = Dynamic;

typedef WgpuRenderTarget = { colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, context:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCanvasContext>, depthStencilTexture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, depthStencilView:Dynamic, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, height:Float, sampleCount:Float, width:Float };

typedef WgpuRenderTargetPool = { free:Array<flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget> };

typedef WgpuRenderTextureEntry = { status:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTextureStatus, target:flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget };

typedef WgpuRenderTextureExplanation = { height:Float, status:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTextureStatus, width:Float };

typedef WgpuRenderTextureGuard = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, explanation:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTextureExplanation) -> Void);

typedef WgpuRenderTexturePool = { device:Null<flight.esm.types.render_wgpu_contract.Types.WgpuDevice>, destroyed:Bool, effectTargets:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTargetPool, free:Array<flight.esm.types.render_contract.Types.RenderTexture>, leased:js.lib.Set<flight.esm.types.render_contract.Types.RenderTexture> };

typedef WgpuRenderTextureStatus = String;

typedef WgpuRequestAdapterOptions = { ?featureLevel:Null<String>, ?forceFallbackAdapter:Null<Bool>, ?powerPreference:Null<String>, ?xrCompatible:Null<Bool> };

typedef WgpuSampler = Dynamic;

typedef WgpuSamplerBindingLayout = { ?type:Null<String> };

typedef WgpuSamplerBindingType = String;

typedef WgpuSamplerDescriptor = { ?addressModeU:Null<String>, ?addressModeV:Null<String>, ?addressModeW:Null<String>, ?compare:Null<String>, ?label:Null<String>, ?lodMaxClamp:Null<Float>, ?lodMinClamp:Null<Float>, ?magFilter:Null<String>, ?maxAnisotropy:Null<Float>, ?minFilter:Null<String>, ?mipmapFilter:Null<String> };

typedef WgpuSavedPassState = { clipForms:Array<String>, colorFormat:Null<String>, currentMaskDepth:Float, currentScissorRect:Null<flight.esm.types.render_wgpu_contract.Types.WgpuScissorRect>, maskWriteMode:Bool, renderTarget:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderTarget>, renderTargetViewport:Null<flight.esm.types.render_wgpu_contract.Types.WgpuRenderPassViewport>, scissorStack:Array<flight.esm.types.render_wgpu_contract.Types.WgpuScissorRect> };

typedef WgpuScene3DPass = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike) -> Void);

typedef WgpuScissorRect = { height:Float, width:Float, x:Float, y:Float };

typedef WgpuScreenRenderTarget = { antialias:Bool, antialiasResolveBindGroup:Dynamic, antialiasTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, antialiasView:Dynamic, acquireAntialiasView:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget) -> Dynamic)>, encodeAntialiasResolve:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget, encoder:flight.esm.types.render_wgpu_contract.Types.WgpuCommandEncoder) -> Void)>, captureBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, captureBytesPerRow:Float, captureEnabled:Bool, captureHeight:Float, captureTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, captureWidth:Float, acquireCaptureTexture:Null<((target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget) -> flight.esm.types.render_wgpu_contract.Types.WgpuTexture)>, encodeCapture:Null<((target:flight.esm.types.render_wgpu_contract.Types.WgpuScreenRenderTarget, encoder:flight.esm.types.render_wgpu_contract.Types.WgpuCommandEncoder) -> Void)>, context:flight.esm.types.render_wgpu_contract.Types.WgpuCanvasContext, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, presentationView:Dynamic, surface:flight.esm.types.surface.Types.WgpuPresentationSurface, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, depthStencilTexture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, depthStencilView:Dynamic, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, height:Float, sampleCount:Float, width:Float };

typedef WgpuScreenRenderTargetOptions = { ?alphaMode:Null<String>, ?colorSpace:Null<String>, ?format:Null<String> };

typedef WgpuShaderModule = Dynamic;

typedef WgpuShaderModuleDescriptor = { code:String, ?label:Null<String> };

typedef WgpuShapeMesh = { vertices:js.lib.Float32Array, indices:js.lib.Uint16Array, color:Float, alpha:Float };

typedef WgpuShapeMeshBuffers = { vertexBuffers:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, vertexCapacities:Array<Float>, indexBuffers:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, indexCapacities:Array<Float>, uniformBuffers:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, bindGroups:Array<Dynamic>, colorScaleBiasUniformBuffers:Array<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, colorScaleBiasBindGroups:Array<Dynamic> };

typedef WgpuShapeMeshPipeline = { pipeline:Dynamic, bindGroupLayout:Dynamic };

typedef WgpuSkinningAdapter = { extendMeshPrelude:((rigidPrelude:String) -> String), extendShadowDepthPrelude:((rigidPrelude:String) -> String), getDrawBindGroup:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, jointMatrices:js.lib.Float32Array) -> Dynamic), getDrawLayout:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState) -> Dynamic), getMeshDrawBindGroup:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, jointMatrices:js.lib.Float32Array, normalMatrices:js.lib.Float32Array) -> Dynamic), getMeshDrawLayout:((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState) -> Dynamic), getUploadVertices:((geometry:flight.esm.types.meshgeometry.Types.MeshGeometry) -> Null<js.lib.Float32Array>), hasBindPose:((geometry:flight.esm.types.meshgeometry.Types.MeshGeometry) -> Bool), isGpuSkinned:((mesh:flight.esm.types.meshgeometry.Types.Mesh) -> Bool), vertexBufferLayouts:Array<flight.esm.types.render_wgpu_contract.Types.WgpuVertexBufferLayout> };

typedef WgpuStencilFaceState = { ?compare:Null<String>, ?depthFailOp:Null<String>, ?failOp:Null<String>, ?passOp:Null<String> };

typedef WgpuStencilOperation = String;

typedef WgpuStorageTextureAccess = String;

typedef WgpuStorageTextureBindingLayout = { ?access:Null<String>, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?viewDimension:Null<String> };

typedef WgpuStoreOp = String;

typedef WgpuSupportedFeatures = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), has:((value:String) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef WgpuSupportedLimits = { maxBindGroups:Float, maxBindGroupsPlusVertexBuffers:Float, maxBindingsPerBindGroup:Float, maxBufferSize:Float, maxColorAttachmentBytesPerSample:Float, maxColorAttachments:Float, maxComputeInvocationsPerWorkgroup:Float, maxComputeWorkgroupSizeX:Float, maxComputeWorkgroupSizeY:Float, maxComputeWorkgroupSizeZ:Float, maxComputeWorkgroupStorageSize:Float, maxComputeWorkgroupsPerDimension:Float, maxDynamicStorageBuffersPerPipelineLayout:Float, maxDynamicUniformBuffersPerPipelineLayout:Float, maxInterStageShaderVariables:Float, maxSampledTexturesPerShaderStage:Float, maxSamplersPerShaderStage:Float, maxStorageBufferBindingSize:Float, maxStorageBuffersPerShaderStage:Float, maxStorageTexturesPerShaderStage:Float, maxTextureArrayLayers:Float, maxTextureDimension1D:Float, maxTextureDimension2D:Float, maxTextureDimension3D:Float, maxUniformBufferBindingSize:Float, maxUniformBuffersPerShaderStage:Float, maxVertexAttributes:Float, maxVertexBufferArrayStride:Float, maxVertexBuffers:Float, minStorageBufferOffsetAlignment:Float, minUniformBufferOffsetAlignment:Float };

typedef WgpuSurface = { __brand:String, acquisition:flight.esm.types.render_wgpu_contract.Types.WgpuHostAcquisition };

typedef WgpuSurfaceAttachResult = { context:flight.esm.types.render_wgpu_contract.Types.WgpuCanvasContext, surface:flight.esm.types.surface.Types.WgpuPresentationSurface };

typedef WgpuSurfaceAttachment = { alphaMode:flight.esm.types.render_wgpu_contract.Types.WgpuCanvasAlphaMode, device:flight.esm.types.render_wgpu_contract.Types.WgpuDevice, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat };

typedef WgpuTexelCopyBufferInfo = { buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, ?bytesPerRow:Null<Float>, ?offset:Null<Float>, ?rowsPerImage:Null<Float> };

typedef WgpuTexelCopyBufferLayout = { ?bytesPerRow:Null<Float>, ?offset:Null<Float>, ?rowsPerImage:Null<Float> };

typedef WgpuTexelCopyTextureInfo = { ?aspect:Null<String>, ?mipLevel:Null<Float>, ?origin:Dynamic, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture };

typedef WgpuTexture = { dimension:flight.esm.types.render_wgpu_contract.Types.WgpuTextureDimension, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, height:Float, width:Float, createView:((?descriptor:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureViewDescriptor>) -> Dynamic), destroy:(() -> Void) };

typedef WgpuTextureAspect = String;

typedef WgpuTextureBindingLayout = { ?multisampled:Null<Bool>, ?sampleType:Null<String>, ?viewDimension:Null<String> };

typedef WgpuTextureBindings = { clear:(() -> Void), delete:((key:Dynamic) -> Bool), forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:Dynamic) -> Dynamic), has:((key:Dynamic) -> Bool), set:((key:Dynamic, value:Dynamic) -> flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindings), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef WgpuTextureDescriptor = { ?dimension:Null<String>, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, ?label:Null<String>, ?mipLevelCount:Null<Float>, ?sampleCount:Null<Float>, size:flight.esm.types.render_wgpu_contract.Types.WgpuExtent3D, ?textureBindingViewDimension:Null<String>, usage:Float, ?viewFormats:Null<Array<flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat>> };

typedef WgpuTextureDimension = String;

typedef WgpuTextureEntry = { bindings:flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindings, ?sampler:Dynamic, mipLevelCount:Float, ?straightAlpha:Null<Bool>, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, view:Dynamic };

typedef WgpuTextureFormat = String;

typedef WgpuTextureRenderTarget = { bindings:flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindings, context:Dynamic, mipLevelCount:Float, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, view:Dynamic, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, depthStencilTexture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, depthStencilView:Dynamic, format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, height:Float, sampleCount:Float, width:Float };

typedef WgpuTextureResolver = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, premultiply:Bool, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace) -> Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureEntry>);

typedef WgpuTextureResource = { mipLevelCount:Float, ?straightAlpha:Null<Bool>, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, view:Dynamic };

typedef WgpuTextureSampleType = String;

typedef WgpuTextureSourceTextureEntry = { version:Float, bindings:flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindings, ?sampler:Dynamic, mipLevelCount:Float, ?straightAlpha:Null<Bool>, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, view:Dynamic };

typedef WgpuTextureView = Dynamic;

typedef WgpuTextureViewDescriptor = { ?arrayLayerCount:Null<Float>, ?aspect:Null<String>, ?baseArrayLayer:Null<Float>, ?baseMipLevel:Null<Float>, ?dimension:Null<String>, ?format:Null<String>, ?label:Null<String>, ?mipLevelCount:Null<Float>, ?usage:Null<Float> };

typedef WgpuTextureViewDimension = String;

typedef WgpuUniformEndiannessExplanation = { endianness:flight.esm.types.platform.Types.PlatformEndianness, status:flight.esm.types.render_wgpu_contract.Types.WgpuUniformEndiannessStatus };

typedef WgpuUniformEndiannessStatus = String;

typedef WgpuVelocityContext = { state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, field:flight.esm.types.velocity.Types.VelocityField, width:Float, height:Float, pixelRatio:Float };

typedef WgpuVelocityWriter = ((ctx:flight.esm.types.render_wgpu_contract.Types.WgpuVelocityContext, node:Dynamic) -> Void);

typedef WgpuVertexAttribute = { format:flight.esm.types.render_wgpu_contract.Types.WgpuVertexFormat, offset:Float, shaderLocation:Float };

typedef WgpuVertexBufferLayout = { arrayStride:Float, attributes:Array<flight.esm.types.render_wgpu_contract.Types.WgpuVertexAttribute>, ?stepMode:Null<String> };

typedef WgpuVertexFormat = String;

typedef WgpuVertexState = { ?buffers:Null<Array<Null<flight.esm.types.render_wgpu_contract.Types.WgpuVertexBufferLayout>>>, ?constants:Dynamic, ?entryPoint:Null<String>, module:Dynamic };

typedef WgpuVertexStepMode = String;

typedef WgpuVideoTextureEntry = { height:Float, sampler:Dynamic, uploadedVersion:Float, width:Float, bindings:flight.esm.types.render_wgpu_contract.Types.WgpuTextureBindings, mipLevelCount:Float, ?straightAlpha:Null<Bool>, texture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, view:Dynamic };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
