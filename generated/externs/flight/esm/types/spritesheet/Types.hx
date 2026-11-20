package flight.esm.types.spritesheet;

#if (js && flight_esm)
typedef Spritesheet = { animations:Dynamic, atlas:Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>, frames:Array<flight.esm.types.spritesheet.Types.SpritesheetFrame>, raw:Dynamic };

typedef SpritesheetAnimation = { direction:flight.esm.types.spritesheet.Types.SpritesheetAnimationDirection, frameDuration:Float, frameDurations:Null<Array<Float>>, frames:Array<Float>, originX:Float, originY:Float, repeatCount:Float, raw:Dynamic };

typedef SpritesheetAnimationData = { direction:flight.esm.types.spritesheet.Types.SpritesheetAnimationDirection, frameDuration:Float, frameDurations:Null<Array<Float>>, frameNames:Array<String>, name:String, originX:Float, originY:Float, repeatCount:Float, raw:Dynamic };

typedef SpritesheetAnimationDirection = String;

typedef SpritesheetData = { animations:Array<flight.esm.types.spritesheet.Types.SpritesheetAnimationData>, frames:Array<flight.esm.types.spritesheet.Types.SpritesheetFrameData>, imageFile:String, imageHeight:Float, imageWidth:Float, scale:Float, raw:Dynamic };

typedef SpritesheetFrame = { id:Float, offsetX:Float, offsetY:Float, pivotX:Null<Float>, pivotY:Null<Float>, rotated:Bool, raw:Dynamic };

typedef SpritesheetFrameData = { height:Float, name:String, offsetX:Float, offsetY:Float, pivotX:Null<Float>, pivotY:Null<Float>, rotated:Bool, sourceHeight:Float, sourceWidth:Float, width:Float, x:Float, y:Float, raw:Dynamic };

typedef SpritesheetPlayer = { animation:Null<flight.esm.types.spritesheet.Types.SpritesheetAnimation>, complete:Bool, elapsed:Float, frameIndex:Float, onComplete:flight.esm.types.signals.Types.Signal<Void>, onLoop:flight.esm.types.signals.Types.Signal<Void>, paused:Bool, queue:Array<flight.esm.types.spritesheet.Types.SpritesheetAnimation>, speed:Float, raw:Dynamic };

typedef SpritesheetValidationDiagnostic = { animationName:Null<String>, frameIndex:Null<Float>, message:String, severity:flight.esm.types.spritesheet.Types.SpritesheetValidationSeverity };

typedef SpritesheetValidationSeverity = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
