package flight.esm.types.effects;

#if (js && flight_esm)
typedef AdvancedBlendMode = String;

typedef BlendEffect = { kind:String, mode:String, ?backdropKey:Null<String>, ?opacity:Null<Float> };

typedef CompositeOperator = String;

typedef Effect = { kind:String };

typedef EffectCaptureGeometry = { bounds:flight.esm.types.geometry.Types.RectangleLike, captureTransform:flight.esm.types.geometry.Types.MatrixLike, padding:flight.esm.types.render.Types.EffectPadding, targetHeight:Float, targetWidth:Float };

typedef EffectPaddingExplanation = { missingKinds:Array<String>, padding:flight.esm.types.render.Types.EffectPadding, status:flight.esm.types.effects.Types.EffectPaddingStatus };

typedef EffectPaddingStatus = String;

typedef EffectStateOptions = { ?depth:Null<String>, ?format:Null<String>, ?sampleCount:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
