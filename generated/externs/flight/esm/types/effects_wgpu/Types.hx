package flight.esm.types.effects_wgpu;

#if (js && flight_esm)
typedef WgpuColorLutTextureCache = { texture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture>, size:Float, lut:Null<flight.esm.types.adjustments_contract.Types.ColorLut> };

typedef WgpuDualSourceEffectPipeline = flight.esm.types.effects_wgpu.Types.WgpuEffectPipeline;

typedef WgpuEffectApplicationExplanation = { registeredCount:Float, requestedCount:Float, status:flight.esm.types.effects_wgpu.Types.WgpuEffectApplicationStatus, unregisteredKinds:Array<String>, unresolvedIndexes:Array<Float> };

typedef WgpuEffectApplicationGuard = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, explanation:flight.esm.types.effects_wgpu.Types.WgpuEffectApplicationExplanation) -> Void);

typedef WgpuEffectApplicationStatus = String;

typedef WgpuEffectBlendMode = String;

typedef WgpuEffectPipeline = { raw:Dynamic, pipeline:Dynamic, blendMode:flight.esm.types.effects_wgpu.Types.WgpuEffectBlendMode, ?compileForFormat:Null<((format:flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat) -> Dynamic)>, ?variants:Null<js.lib.Map<flight.esm.types.render_wgpu_contract.Types.WgpuTextureFormat, Dynamic>> };

typedef WgpuEffectState = { options:flight.esm.types.effects.Types.EffectStateOptions, sceneTarget:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTextureRenderTarget>, pool:flight.esm.types.render_wgpu_contract.Types.WgpuRenderTargetPool, lutCache:flight.esm.types.adjustments_contract.Types.ColorLutCache, lutTexture:flight.esm.types.effects_wgpu.Types.WgpuColorLutTextureCache, velocityTexture:Null<flight.esm.types.render_wgpu_contract.Types.WgpuTexture> };

typedef WgpuEffectStateSampleCountGuard = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, requestedSampleCount:Float, appliedSampleCount:Float) -> Void);

typedef WgpuEffectStateSkipGuard = ((state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String) -> Void);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
