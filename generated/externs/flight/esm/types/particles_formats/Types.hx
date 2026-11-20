package flight.esm.types.particles_formats;

#if (js && flight_esm)
typedef LibgdxActiveRangeValue = { active:Bool, lowMin:Float, lowMax:Float, highMin:Float, highMax:Float, relative:Bool, scaling:Array<Float>, timeline:Array<Float> };

typedef LibgdxParseOptions = { ?textureSize:Null<Float> };

typedef LibgdxParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, document:flight.esm.types.particles_formats.Types.LibgdxParticleDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef LibgdxParticleDocument = { name:String, minParticleCount:Float, maxParticleCount:Float, additive:Bool, premultipliedAlpha:Bool, delay:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, duration:flight.esm.types.particles_formats.Types.LibgdxRangeValue, emission:flight.esm.types.particles_formats.Types.LibgdxRangeValue, life:flight.esm.types.particles_formats.Types.LibgdxRangeValue, lifeOffset:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, xOffset:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, yOffset:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, spawnShape:Dynamic, spawnWidth:flight.esm.types.particles_formats.Types.LibgdxRangeValue, spawnHeight:flight.esm.types.particles_formats.Types.LibgdxRangeValue, scale:flight.esm.types.particles_formats.Types.LibgdxRangeValue, velocity:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, angle:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, rotation:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, wind:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, gravity:flight.esm.types.particles_formats.Types.LibgdxActiveRangeValue, tint:Dynamic, transparency:flight.esm.types.particles_formats.Types.LibgdxRangeValue, imageCount:Float, imagePath:String };

typedef LibgdxRangeValue = { lowMin:Float, lowMax:Float, highMin:Float, highMax:Float, relative:Bool, scaling:Array<Float>, timeline:Array<Float> };

typedef LibgdxSerializeOptions = { ?textureSize:Null<Float> };

typedef ParseParticleConfigOptions = { ?textureSize:Null<Float>, ?pixelsPerUnit:Null<Float> };

typedef ParticleConfigIssue = flight.esm.types.particles.Types.ParticleConfigIssue;

typedef ParticleConfigParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>, format:Null<String> };

typedef ParticleDesignerDocument = { maxParticles:Float, emitterType:flight.esm.types.particles_formats.Types.ParticleDesignerEmitterType, duration:Float, particleLifespan:Float, particleLifespanVariance:Float, speed:Float, speedVariance:Float, angle:Float, angleVariance:Float, gravityx:Float, gravityy:Float, sourcePositionVariancex:Float, sourcePositionVariancey:Float, startParticleSize:Float, startParticleSizeVariance:Float, finishParticleSize:Float, finishParticleSizeVariance:Float, startColorRed:Float, startColorGreen:Float, startColorBlue:Float, startColorAlpha:Float, startColorVarianceRed:Float, startColorVarianceGreen:Float, startColorVarianceBlue:Float, startColorVarianceAlpha:Float, finishColorRed:Float, finishColorGreen:Float, finishColorBlue:Float, finishColorAlpha:Float, finishColorVarianceRed:Float, finishColorVarianceGreen:Float, finishColorVarianceBlue:Float, finishColorVarianceAlpha:Float, rotationStart:Float, rotationStartVariance:Float, rotationEnd:Float, rotationEndVariance:Float, maxRadius:Float, maxRadiusVariance:Float, minRadius:Float, minRadiusVariance:Float, rotatePerSecond:Float, rotatePerSecondVariance:Float, blendFuncSource:Float, blendFuncDestination:Float, textureFileName:String };

typedef ParticleDesignerEmitterType = Float;

typedef ParticleDesignerParseOptions = { ?textureSize:Null<Float> };

typedef ParticleDesignerParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, document:flight.esm.types.particles_formats.Types.ParticleDesignerDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef ParticleDesignerRawDict = Dynamic;

typedef ParticleDesignerSerializeOptions = { ?textureSize:Null<Float> };

typedef ParticleFormatCodec = { detect:((text:String) -> Bool), parseToConfig:((text:String, ?options:Null<flight.esm.types.particles_formats.Types.ParseParticleConfigOptions>) -> flight.esm.types.particles.Types.ParticleEmitterConfig), parseToDocument:((text:String, ?options:Null<flight.esm.types.particles_formats.Types.ParseParticleConfigOptions>) -> Dynamic), ?serialize:Null<((config:flight.esm.types.particles.Types.ParticleEmitterConfig) -> flight.esm.types.particles_formats.Types.ParticleSerializeResult)> };

typedef ParticleFormatDescriptor = { codec:flight.esm.types.particles_formats.Types.ParticleFormatCodec, kind:flight.esm.types.particles_formats.Types.ParticleFormatKind };

typedef ParticleFormatKind = Dynamic;

typedef ParticleFormatWarning = { format:flight.esm.types.particles_formats.Types.ParticleFormatKind, code:String, message:String };

typedef ParticleImportOptions = { ?formats:Null<Array<flight.esm.types.particles_formats.Types.ParticleFormatDescriptor>> };

typedef ParticleSerializeResult = { text:String, warnings:Array<String> };

typedef PixiParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef PixiParsed = flight.esm.types.particles_formats.Types.PixiParseResult;

typedef SpineAlphaKeyframe = { time:Float, alpha:Float };

typedef SpineBlendMode = String;

typedef SpineParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, document:flight.esm.types.particles_formats.Types.SpineParticleDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef SpineParticleDocument = { name:String, maxParticles:Float, continuous:Bool, duration:Float, emission:flight.esm.types.particles_formats.Types.SpineRangeValue, life:flight.esm.types.particles_formats.Types.SpineRangeValue, lifeOffset:flight.esm.types.particles_formats.Types.SpineRangeValue, x:flight.esm.types.particles_formats.Types.SpineRangeValue, y:flight.esm.types.particles_formats.Types.SpineRangeValue, spawnShape:String, spawnWidth:flight.esm.types.particles_formats.Types.SpineRangeValue, spawnHeight:flight.esm.types.particles_formats.Types.SpineRangeValue, velocity:flight.esm.types.particles_formats.Types.SpineRangeValue, angle:flight.esm.types.particles_formats.Types.SpineRangeValue, rotation:flight.esm.types.particles_formats.Types.SpineRangeValue, wind:flight.esm.types.particles_formats.Types.SpineRangeValue, gravity:flight.esm.types.particles_formats.Types.SpineRangeValue, scale:flight.esm.types.particles_formats.Types.SpineRangeValue, scaleEnd:flight.esm.types.particles_formats.Types.SpineRangeValue, tint:Array<flight.esm.types.particles_formats.Types.SpineTintKeyframe>, alpha:Array<flight.esm.types.particles_formats.Types.SpineAlphaKeyframe>, blendMode:flight.esm.types.particles_formats.Types.SpineBlendMode, premultiplied:Bool, images:Array<String> };

typedef SpineRangeValue = { low:Float, high:Float };

typedef SpineTintKeyframe = { time:Float, color:String };

typedef StarlingPexColor = { red:Float, green:Float, blue:Float, alpha:Float };

typedef StarlingPexDocument = { maxParticles:Float, emitterType:Float, duration:Float, particleLifespan:Float, particleLifespanVariance:Float, speed:Float, speedVariance:Float, angle:Float, angleVariance:Float, gravityx:Float, gravityy:Float, sourcePositionVariancex:Float, sourcePositionVariancey:Float, startParticleSize:Float, startParticleSizeVariance:Float, finishParticleSize:Float, finishParticleSizeVariance:Float, startColor:flight.esm.types.particles_formats.Types.StarlingPexColor, startColorVariance:flight.esm.types.particles_formats.Types.StarlingPexColor, finishColor:flight.esm.types.particles_formats.Types.StarlingPexColor, finishColorVariance:flight.esm.types.particles_formats.Types.StarlingPexColor, rotationStart:Float, rotationStartVariance:Float, rotationEnd:Float, rotationEndVariance:Float, maxRadius:Float, maxRadiusVariance:Float, minRadius:Float, minRadiusVariance:Float, rotatePerSecond:Float, rotatePerSecondVariance:Float, radialAcceleration:Float, radialAccelVariance:Float, tangentialAcceleration:Float, tangentialAccelVariance:Float, blendFuncSource:Float, blendFuncDestination:Float, textureFileName:String };

typedef StarlingPexParseOptions = { ?textureSize:Null<Float> };

typedef StarlingPexParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, document:flight.esm.types.particles_formats.Types.StarlingPexDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef StarlingPexParsed = flight.esm.types.particles_formats.Types.StarlingPexParseResult;

typedef StarlingPexSerializeOptions = { ?textureSize:Null<Float> };

typedef UnityAnimationCurve = { keys:Array<flight.esm.types.particles_formats.Types.UnityCurveKey> };

typedef UnityBurst = { time:Float, count:Float, cycleCount:Float, repeatInterval:Float };

typedef UnityColor = { r:Float, g:Float, b:Float, a:Float };

typedef UnityColorOverLifetime = { enabled:Bool, colorStart:flight.esm.types.particles_formats.Types.UnityColor, colorEnd:flight.esm.types.particles_formats.Types.UnityColor, ?gradient:Null<flight.esm.types.particles_formats.Types.UnityGradient> };

typedef UnityCurveKey = { time:Float, value:Float };

typedef UnityEmission = { rateOverTime:flight.esm.types.particles_formats.Types.UnityMinMaxValue, bursts:Array<flight.esm.types.particles_formats.Types.UnityBurst> };

typedef UnityGradient = { colorKeys:Array<flight.esm.types.particles_formats.Types.UnityGradientColorKey>, alphaKeys:Array<flight.esm.types.particles_formats.Types.UnityGradientAlphaKey> };

typedef UnityGradientAlphaKey = { time:Float, alpha:Float };

typedef UnityGradientColorKey = { time:Float, color:Dynamic };

typedef UnityMinMaxValue = { mode:String, ?constant:Null<Float>, ?constantMin:Null<Float>, ?constantMax:Null<Float> };

typedef UnityParseOptions = { ?pixelsPerUnit:Null<Float> };

typedef UnityParseResult = { config:flight.esm.types.particles.Types.ParticleEmitterConfig, document:flight.esm.types.particles_formats.Types.UnityParticleDocument, diagnostics:Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic> };

typedef UnityParsed = flight.esm.types.particles_formats.Types.UnityParseResult;

typedef UnityParticleDocument = { name:String, duration:Float, looping:Bool, prewarm:Bool, maxParticles:Float, startLifetime:flight.esm.types.particles_formats.Types.UnityMinMaxValue, startSpeed:flight.esm.types.particles_formats.Types.UnityMinMaxValue, startSize:flight.esm.types.particles_formats.Types.UnityMinMaxValue, startRotation:flight.esm.types.particles_formats.Types.UnityMinMaxValue, startColor:flight.esm.types.particles_formats.Types.UnityColor, gravityModifier:Float, physicsGravity:Float, emission:flight.esm.types.particles_formats.Types.UnityEmission, shape:flight.esm.types.particles_formats.Types.UnityShape, colorOverLifetime:flight.esm.types.particles_formats.Types.UnityColorOverLifetime, sizeOverLifetime:flight.esm.types.particles_formats.Types.UnitySizeOverLifetime, rotationOverLifetime:flight.esm.types.particles_formats.Types.UnityRotationOverLifetime };

typedef UnityParticleShapeType = String;

typedef UnityRotationOverLifetime = { enabled:Bool, angularVelocity:flight.esm.types.particles_formats.Types.UnityMinMaxValue };

typedef UnitySerializeOptions = { ?pixelsPerUnit:Null<Float> };

typedef UnityShape = { enabled:Bool, shapeType:flight.esm.types.particles_formats.Types.UnityParticleShapeType, radius:Float, angle:Float, scale:Dynamic };

typedef UnitySizeOverLifetime = { enabled:Bool, sizeStart:Float, sizeEnd:Float, ?curve:Null<flight.esm.types.particles_formats.Types.UnityAnimationCurve> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
