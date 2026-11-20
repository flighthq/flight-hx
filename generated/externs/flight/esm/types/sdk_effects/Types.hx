package flight.esm.types.sdk_effects;

#if (js && flight_esm)
typedef AdvancedBlendMode = flight.esm.types.effects.Types.AdvancedBlendMode;

typedef BlendEffect = flight.esm.types.effects.Types.BlendEffect;

typedef CompositeOperator = flight.esm.types.effects.Types.CompositeOperator;

typedef Effect = flight.esm.types.effects.Types.Effect;

typedef EffectCaptureGeometry = flight.esm.types.effects.Types.EffectCaptureGeometry;

typedef EffectPaddingExplanation = flight.esm.types.effects.Types.EffectPaddingExplanation;

typedef EffectPaddingStatus = flight.esm.types.effects.Types.EffectPaddingStatus;

typedef EffectStateOptions = flight.esm.types.effects.Types.EffectStateOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
