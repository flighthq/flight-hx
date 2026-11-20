package flight.esm.types.sdk_effects_gl;

#if (js && flight_esm)
typedef EffectStateOptions = flight.esm.types.effects.Types.EffectStateOptions;

typedef GlColorLutTextureCache = flight.esm.types.effects_gl.Types.GlColorLutTextureCache;

typedef GlCustomShaderSourceGuard = flight.esm.types.effects_gl.Types.GlCustomShaderSourceGuard;

typedef GlEffectApplicationExplanation = flight.esm.types.effects_gl.Types.GlEffectApplicationExplanation;

typedef GlEffectApplicationGuard = flight.esm.types.effects_gl.Types.GlEffectApplicationGuard;

typedef GlEffectApplicationStatus = flight.esm.types.effects_gl.Types.GlEffectApplicationStatus;

typedef GlEffectContext = flight.esm.types.render_gl.Types.GlEffectContext;

typedef GlEffectRegistration = flight.esm.types.render_gl.Types.GlEffectRegistration;

typedef GlEffectResolver = flight.esm.types.render_gl.Types.GlEffectResolver;

typedef GlEffectRunner = flight.esm.types.render_gl.Types.GlEffectRunner;

typedef GlEffectState = flight.esm.types.effects_gl.Types.GlEffectState;

typedef GlEffectStateSkipGuard = flight.esm.types.effects_gl.Types.GlEffectStateSkipGuard;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
