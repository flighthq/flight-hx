package flight.esm.types.signals;

#if (js && flight_esm)
typedef FrameTick = { deltaTime:Float };

typedef Signal<T> = { emit:((arg0:T) -> Void), data:Null<flight.esm.types.signals.Types.SignalData<T>> };

typedef SignalConnectOptions = { ?priority:Null<Float>, ?once:Null<Bool> };

typedef SignalConnection = { disconnect:(() -> Void), setPaused:((arg0:Bool) -> Void), isConnected:(() -> Bool), paused:Bool };

typedef SignalData<T> = { slots:Array<Null<flight.esm.types.signals_contract.Types.SignalSlot<T>>>, ids:Array<flight.esm.types.signals_contract.Types.SlotId>, priorities:Array<Float>, repeat:Array<Bool>, paused:Array<Bool>, cancelled:Bool, depth:Float };

typedef SignalScope = flight.esm.types.signals_contract.Types.SignalScopeRaw;

typedef SignalThrottleOptions = { ?leading:Null<Bool>, ?trailing:Null<Bool> };

typedef SignalTimerState = flight.esm.types.signals_contract.Types.SignalTimerStateRaw;

typedef SignalTrackedConnectOptions = { ?priority:Null<Float>, ?once:Null<Bool>, ?scope:Null<flight.esm.types.signals_contract.Types.SignalScopeRaw> };

typedef TimerId = { value:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
