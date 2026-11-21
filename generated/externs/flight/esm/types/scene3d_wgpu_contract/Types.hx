package flight.esm.types.scene3d_wgpu_contract;

#if (js && flight_esm)
typedef FakeWgpu = { calls:Array<Dynamic> };

typedef WgpuClassicDefineKey = { alphaMaskEnabled:Bool, doubleSided:Bool, ?hasColorAdjustment:Null<Bool>, ?hasColorMatrix:Null<Bool>, ?hasAlphaMap:Null<Bool>, hasDiffuseMap:Bool, hasNormalMap:Bool, hasSpecularMap:Bool, lightingModel:flight.esm.types.scene3d_wgpu_contract.Types.WgpuClassicLightingModel };

typedef WgpuClassicLightingModel = String;

typedef WgpuClassicPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuDebugDefineKey = { hasNormalMap:Bool, mode:String };

typedef WgpuDebugPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuMatcapDefineKey = { alphaMaskEnabled:Bool, doubleSided:Bool, hasMatcap:Bool };

typedef WgpuMatcapPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuMaterialBinding = { bindGroup:Dynamic, buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, ?samplers:Null<Array<Dynamic>>, ?sampler:Dynamic, ?views:Null<Array<Dynamic>> };

typedef WgpuMeshPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuMeshUpload = { indexBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, indexCount:Float, indexFormat:Null<String>, ?skinBindUploaded:Null<Bool>, version:Float, vertexBuffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer };

typedef WgpuPbrDefineKey = { alphaMaskEnabled:Bool, anisotropyEnabled:Bool, clearcoatEnabled:Bool, doubleSided:Bool, hasAlphaMap:Bool, hasBaseColorMap:Bool, ?hasColorAdjustment:Null<Bool>, ?hasColorMatrix:Null<Bool>, hasEmissiveMap:Bool, hasMetallicRoughnessMap:Bool, hasNormalMap:Bool, hasOcclusionMap:Bool, iridescenceEnabled:Bool, sheenEnabled:Bool, specularEnabled:Bool, subsurfaceEnabled:Bool, transmissionEnabled:Bool };

typedef WgpuPbrPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuScene3DDrawEntry = { alpha:Float, colorMatrix:Dynamic, colorScaleBias:Dynamic, depth:Float, lightBlock:Dynamic, material:Dynamic, mesh:Dynamic, renderer:Dynamic, sortKey:Float, subset:Dynamic, worldMatrix:Dynamic };

typedef WgpuScene3DForwardLightList = { meshCount:Float, meshLightBlocks:Array<flight.esm.types.lighting_contract.Types.Scene3DLightBlock> };

typedef WgpuScene3DFrameBinding = { bindGroup:Dynamic, buffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer };

typedef WgpuScene3DIbl = { brdfLut:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, brdfLutView:Dynamic, intensity:Float, irradianceCube:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, irradianceCubeView:Dynamic, prefilteredCube:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, prefilteredCubeView:Dynamic, prefilteredMipCount:Float };

typedef WgpuScene3DLayouts = { drawBindGroupLayout:Dynamic, frameBindGroupLayout:Dynamic };

typedef WgpuScene3DRuntime = { activeBlendMode:Null<String>, activeBlendedRun:Bool, activeColorAdjustmentRun:Bool, activeColorMatrixRun:Bool, activeMirroredRun:Bool, activeSkinnedRun:Bool, activeMeshPipeline:Null<flight.esm.types.scene3d_wgpu_contract.Types.WgpuMeshPipeline>, blendedDrawList:Array<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DDrawEntry>, blendedPool:Array<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DDrawEntry>, drawBindGroup:Dynamic, drawBindGroupLayout:Dynamic, frameBindGroup:Dynamic, frameBindGroupLayout:Dynamic, frameBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, frameBindings:Dynamic, ?customShaderGuard:Null<((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, shaderKey:String, source:String, material:flight.esm.types.materials_contract.Types.CustomShaderMaterial) -> Void)>, ?forwardLightSelectionGuard:Null<((lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike) -> Void)>, environmentSourceCube:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, environmentSourceCubeView:Dynamic, ibl:Null<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DIbl>, iblDummyCubeTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, iblDummyCubeView:Dynamic, iblDummyLutTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, iblDummyLutView:Dynamic, iblSampleBindGroup:Dynamic, iblSampleCubeView:Dynamic, iblSampleLayout:Dynamic, iblSampler:Dynamic, iblUniformBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, materialBindGroups:Dynamic, pbrSampleBindGroup:Dynamic, pbrSampleIblCubeView:Dynamic, pbrSampleLayout:Dynamic, pbrSampleShadowView:Dynamic, opaqueDrawList:Array<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DDrawEntry>, opaquePool:Array<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DDrawEntry>, pendingDrawOffset:Float, pendingUvTransform:js.lib.Float32Array, pipelineCache:js.lib.Map<String, flight.esm.types.scene3d_wgpu_contract.Types.WgpuMeshPipeline>, placeholderView:Dynamic, shadow:Null<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DShadow>, shadowComparisonSampler:Dynamic, shadowDepthPipeline:Dynamic, shadowDepthSkinnedPipeline:Dynamic, shadowDepthInstancedPipeline:Dynamic, shadowDummyTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, shadowDummyView:Dynamic, shadowSampleBindGroup:Dynamic, shadowSampleLayout:Dynamic, shadowSampleView:Dynamic, shadowUniformBuffer:Null<flight.esm.types.render_wgpu_contract.Types.WgpuBuffer>, shadedMaterialBindingCache:Dynamic, shadedMaterialPlanCache:Dynamic, skinDrawBindGroup:Dynamic, skinDrawBindGroupLayout:Dynamic, skinMeshDrawBindGroup:Dynamic, skinMeshDrawBindGroupLayout:Dynamic, skinArenaFrame:Null<flight.esm.types.render_wgpu_contract.Types.WgpuCommandEncoder>, skinNormalPaletteArenaBases:Null<js.lib.Map<js.lib.Float32Array, Float>>, skinNormalPaletteArenaCursor:Float, skinNormalPaletteArenaRows:Float, skinNormalPaletteTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, skinNormalPaletteView:Dynamic, skinPaletteArenaBases:Null<js.lib.Map<js.lib.Float32Array, Float>>, skinPaletteArenaCursor:Float, skinPaletteArenaRows:Float, skinPaletteTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, skinPaletteView:Dynamic, pendingSkinNormalPaletteBase:Float, pendingSkinPaletteBase:Float, skinningAdapter:Dynamic, uploadCache:Dynamic };

typedef WgpuScene3DShadow = { depthTexture:flight.esm.types.render_wgpu_contract.Types.WgpuTexture, depthView:Dynamic, enabled:Bool, mapHeight:Float, mapWidth:Float, matrix:flight.esm.types.geometry.Types.Matrix4, normalBiasWorld:Float, pcfRadius:Float, shadowBias:Float };

typedef WgpuToonDefineKey = { alphaMaskEnabled:Bool, doubleSided:Bool, hasBaseColorMap:Bool, hasRamp:Bool };

typedef WgpuToonPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuUnlitDefineKey = { alphaMaskEnabled:Bool, doubleSided:Bool, hasColorMap:Bool };

typedef WgpuUnlitPipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuWireframePipeline = { hasIblGroup:Bool, hasPbrSampleGroup:Bool, hasShadowGroup:Bool, materialBindGroupLayout:Dynamic, pipeline:Dynamic, skinned:Bool };

typedef WgpuWireframeUpload = { indexFormat:flight.esm.types.render_wgpu_contract.Types.WgpuIndexFormat, lineIndexBuffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer, version:Float, vertexBuffer:flight.esm.types.render_wgpu_contract.Types.WgpuBuffer };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
