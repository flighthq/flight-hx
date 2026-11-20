package flight.esm.types.effects_gl;

#if (js && flight_esm)
typedef EffectStateOptions = flight.esm.types.effects.Types.EffectStateOptions;

typedef GlColorLutTextureCache = { texture:Dynamic, lut:Null<flight.esm.types.adjustments_contract.Types.ColorLut> };

typedef GlCustomShaderSourceGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, shaderKey:String, previousSource:String, nextSource:String) -> Void);

typedef GlEffectApplicationExplanation = { registeredCount:Float, requestedCount:Float, status:flight.esm.types.effects_gl.Types.GlEffectApplicationStatus, unregisteredKinds:Array<String>, unresolvedIndexes:Array<Float> };

typedef GlEffectApplicationGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, explanation:flight.esm.types.effects_gl.Types.GlEffectApplicationExplanation) -> Void);

typedef GlEffectApplicationStatus = String;

typedef GlEffectContext = flight.esm.types.render_gl.Types.GlEffectContext;

typedef GlEffectRegistration = flight.esm.types.render_gl.Types.GlEffectRegistration;

typedef GlEffectResolver = flight.esm.types.render_gl.Types.GlEffectResolver;

typedef GlEffectRunner = flight.esm.types.render_gl.Types.GlEffectRunner;

typedef GlEffectState = { options:flight.esm.types.effects.Types.EffectStateOptions, sceneTarget:Null<flight.esm.types.render_gl.Types.GlTextureRenderTarget>, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, lutCache:flight.esm.types.adjustments_contract.Types.ColorLutCache, lutTexture:flight.esm.types.effects_gl.Types.GlColorLutTextureCache, velocityTexture:Dynamic };

typedef GlEffectStateSkipGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, kind:String) -> Void);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
