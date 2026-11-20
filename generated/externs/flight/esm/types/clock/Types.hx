package flight.esm.types.clock;

#if (js && flight_esm)
typedef Clock = { scale:Float, paused:Bool, deltaTime:Float, elapsed:Float, parent:Null<flight.esm.types.clock.Types.Clock>, children:Array<flight.esm.types.clock.Types.Clock>, onTick:Null<flight.esm.types.signals.Types.Signal<Float>> };

typedef ClockOptions = { ?scale:Null<Float>, ?paused:Null<Bool> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
