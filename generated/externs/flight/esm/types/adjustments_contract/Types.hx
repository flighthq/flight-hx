package flight.esm.types.adjustments_contract;

#if (js && flight_esm)
typedef Adjustment = { kind:String };

typedef AdjustmentKind = String;

typedef BrightnessContrastAdjustment = { kind:String, ?brightness:Null<Float>, ?contrast:Null<Float>, colorMatrix:js.lib.Float32Array };

typedef ChannelMixerAdjustment = { kind:String, matrix:Array<Float>, colorMatrix:js.lib.Float32Array };

typedef ColorAdjustmentRuntime = { colorAdjustments:Null<Array<flight.esm.types.adjustments_contract.Types.Adjustment>>, colorAdjustmentsUnsupported:Bool, resolvedColorMatrix:Null<js.lib.Float32Array>, resolvedColorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias> };

typedef ColorBlindSimulationAdjustment = { kind:String, ?type:Null<String>, colorMatrix:js.lib.Float32Array };

typedef ColorBlindType = String;

typedef ColorGradeAdjustment = { kind:String, ?exposure:Null<Float>, ?brightness:Null<Float>, ?contrast:Null<Float>, ?saturation:Null<Float>, ?temperature:Null<Float>, ?tint:Null<Float>, ?lift:Null<Float>, ?gamma:Null<Float>, ?gain:Null<Float>, transform:flight.esm.types.adjustments_contract.Types.ColorTransformFunction };

typedef ColorLut = { size:Float, samples:Array<Float> };

typedef ColorLutAdjustment = { transform:flight.esm.types.adjustments_contract.Types.ColorTransformFunction, kind:String };

typedef ColorLutCache = { signature:Null<String>, lut:Null<flight.esm.types.adjustments_contract.Types.ColorLut> };

typedef ColorMatrixAdjustment = { colorMatrix:js.lib.Float32Array, kind:String };

typedef ColorScaleBias = { alphaScale:Float, alphaBias:Float, blueScale:Float, blueBias:Float, greenScale:Float, greenBias:Float, redScale:Float, redBias:Float };

typedef ColorScaleBiasAdjustment = { colorScaleBias:flight.esm.types.adjustments_contract.Types.ColorScaleBiasLike, kind:String, colorMatrix:js.lib.Float32Array };

typedef ColorScaleBiasLike = { alphaScale:Float, alphaBias:Float, blueScale:Float, blueBias:Float, greenScale:Float, greenBias:Float, redScale:Float, redBias:Float };

typedef ColorTransformFunction = ((out:Array<Float>, r:Float, g:Float, b:Float) -> Void);

typedef ExposureAdjustment = { kind:String, ?exposure:Null<Float>, colorMatrix:js.lib.Float32Array };

typedef GrayscaleAdjustment = { kind:String, ?intensity:Null<Float>, colorMatrix:js.lib.Float32Array };

typedef HueSaturationAdjustment = { kind:String, ?hue:Null<Float>, ?saturation:Null<Float>, ?lightness:Null<Float>, transform:flight.esm.types.adjustments_contract.Types.ColorTransformFunction };

typedef InvertAdjustment = { kind:String, ?intensity:Null<Float>, colorMatrix:js.lib.Float32Array };

typedef LiftGammaGainAdjustment = { kind:String, ?lift:Null<Float>, ?gamma:Null<Float>, ?gain:Null<Float>, transform:flight.esm.types.adjustments_contract.Types.ColorTransformFunction };

typedef LookupTableGradeAdjustment = { kind:String, ?lut:Null<flight.esm.types.adjustments_contract.Types.ColorLut>, ?strength:Null<Float>, transform:flight.esm.types.adjustments_contract.Types.ColorTransformFunction };

typedef SepiaAdjustment = { kind:String, ?intensity:Null<Float>, colorMatrix:js.lib.Float32Array };

typedef TintAdjustment = { kind:String, colorMatrix:js.lib.Float32Array };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
