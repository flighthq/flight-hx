package flight.esm.types.tween_contract;

#if (js && flight_esm)
typedef NumericProps<T> = Dynamic;

typedef StopTweenOptions = { ?complete:Null<Bool>, ?sendEvent:Null<Bool> };

typedef Tween<T> = { complete:Bool, delay:Float, duration:Float, ease:flight.esm.types.easing.Types.EasingFunction, elapsed:Float, initialized:Bool, onComplete:flight.esm.types.signals.Types.Signal<Void>, onRepeat:flight.esm.types.signals.Types.Signal<Void>, onUpdate:flight.esm.types.signals.Types.Signal<Void>, onYoyo:flight.esm.types.signals.Types.Signal<Void>, paused:Bool, properties:Array<flight.esm.types.tween_contract.Types.TweenPropertyDetail>, propertyMap:flight.esm.types.tween_contract.Types.NumericProps<T>, reflect:Bool, repeat:Float, reverse:Bool, smartRotation:Bool, snapping:Bool, target:T };

typedef TweenManager = { __brand:String, defaultEase:flight.esm.types.easing.Types.EasingFunction, tweens:js.lib.Map<Dynamic, Array<flight.esm.types.tween_contract.Types.Tween<Dynamic>>> };

typedef TweenManagerOptions = { ?defaultEase:Null<flight.esm.types.easing.Types.EasingFunction> };

typedef TweenOptions = { ?delay:Null<Float>, ?ease:Null<flight.esm.types.easing.Types.EasingFunction>, ?overwrite:Null<Bool>, ?reflect:Null<Bool>, ?repeat:Null<Float>, ?reverse:Null<Bool>, ?smartRotation:Null<Bool>, ?snapping:Null<Bool> };

typedef TweenPropertyDetail = { change:Float, key:String, start:Float };

typedef TweenStaggerOptions = { ?each:Null<Float>, ?from:Dynamic, ?staggerEase:Null<flight.esm.types.easing.Types.EasingFunction> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
