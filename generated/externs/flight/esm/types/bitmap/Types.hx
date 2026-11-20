package flight.esm.types.bitmap;

#if (js && flight_esm)
typedef Bitmap = { data:js.lib.Uint8Array, format:flight.esm.types.texture_contract.Types.PixelFormat, kind:String, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, version:Float, width:Float };

typedef BitmapBevelOptions = { ?angle:Null<Float>, ?distance:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float>, ?highlightColor:Null<Float>, ?shadowColor:Null<Float>, ?intensity:Null<Float>, ?type:Null<String> };

typedef BitmapBevelType = String;

typedef BitmapBoxBlurOptions = { ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapCompositeMode = String;

typedef BitmapConvolutionOptions = { ?bias:Null<Float>, ?edge:Null<String>, ?divisor:Null<Float>, matrix:Array<Float>, matrixX:Float, matrixY:Float, ?preserveAlpha:Null<Bool> };

typedef BitmapDisplacementMapMode = String;

typedef BitmapDisplacementMapOptions = { map:flight.esm.types.bitmap.Types.BitmapRegion, ?componentX:Null<Float>, ?componentY:Null<Float>, ?scaleX:Null<Float>, ?scaleY:Null<Float>, ?mode:Null<String>, ?edgeMode:Null<String>, ?fillColor:Null<Float> };

typedef BitmapDropShadowOptions = { ?color:Null<Float>, ?intensity:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapEdgeMode = String;

typedef BitmapEncodeFailureExplanation = { format:flight.esm.types.bitmap.Types.ImageFormat, reason:String };

typedef BitmapEncodeOperation = String;

typedef BitmapFingerprint = { gridSize:Float, cells:Array<Float> };

typedef BitmapGlowOptions = { ?color:Null<Float>, ?intensity:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapGradientBevelOptions = { ?angle:Null<Float>, ?distance:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float>, ?intensity:Null<Float>, ?type:Null<String> };

typedef BitmapGradientGlowOptions = { ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float>, ?intensity:Null<Float> };

typedef BitmapHistogram = { alpha:Array<Float>, blue:Array<Float>, green:Array<Float>, red:Array<Float> };

typedef BitmapInnerGlowOptions = { ?color:Null<Float>, ?intensity:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapInnerShadowOptions = { ?color:Null<Float>, ?intensity:Null<Float>, ?offsetX:Null<Float>, ?offsetY:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapMismatch = { mismatchedPixels:Float, totalPixels:Float, fraction:Float, maxChannelDelta:Float };

typedef BitmapReadbackBackendReason = String;

typedef BitmapReadbackBlockReason = String;

typedef BitmapReadbackExplanation = { readable:Bool, reason:flight.esm.types.bitmap.Types.BitmapReadbackBlockReason };

typedef BitmapReadbackMode = String;

typedef BitmapReadbackOutcome = { bitmap:Null<flight.esm.types.bitmap.Types.Bitmap>, reason:flight.esm.types.bitmap.Types.BitmapReadbackBackendReason };

typedef BitmapRegion = { height:Float, bitmap:flight.esm.types.bitmap.Types.Bitmap, width:Float, x:Float, y:Float };

typedef BitmapResizeMode = String;

typedef BitmapResizeOptions = { ?mode:Null<String>, ?edgeMode:Null<String>, ?premultiplied:Null<Bool> };

typedef BitmapShadowBlurOptions = { ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef BitmapSharpenOptions = { ?amount:Null<Float>, ?radiusX:Null<Float>, ?radiusY:Null<Float>, ?passes:Null<Float> };

typedef GradientSpread = String;

typedef HostBitmapEncodeCapability = { encodeBitmap:((source:flight.esm.types.bitmap.Types.Bitmap, format:flight.esm.types.bitmap.Types.ImageFormat, quality:Float) -> js.lib.Uint8Array), supportedFormats:Array<flight.esm.types.bitmap.Types.ImageFormat> };

typedef HostBitmapReadbackCapability = { readBitmap:((source:Dynamic, width:Float, height:Float, mode:flight.esm.types.bitmap.Types.BitmapReadbackMode) -> flight.esm.types.bitmap.Types.BitmapReadbackOutcome) };

typedef ImageChannel = Float;

typedef ImageFormat = String;

typedef PixelOrder = String;

typedef ThresholdOperation = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
