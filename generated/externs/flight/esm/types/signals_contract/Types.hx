package flight.esm.types.signals_contract;

#if (js && flight_esm)
typedef FrameTick = flight.esm.types.signals.Types.FrameTick;

typedef Signal<T> = flight.esm.types.signals.Types.Signal<T>;

typedef SignalConnectOptions = flight.esm.types.signals.Types.SignalConnectOptions;

typedef SignalConnection = flight.esm.types.signals.Types.SignalConnection;

typedef SignalData<T> = flight.esm.types.signals.Types.SignalData<T>;

typedef SignalRaw<T> = { emit:((arg0:T) -> Void), data:Null<flight.esm.types.signals.Types.SignalData<T>> };

typedef SignalScope = flight.esm.types.signals.Types.SignalScope;

typedef SignalScopeRaw = { connections:Array<flight.esm.types.signals.Types.SignalConnection> };

typedef SignalSlot<T> = ((arg0:T) -> Void);

typedef SignalThrottleOptions = flight.esm.types.signals.Types.SignalThrottleOptions;

typedef SignalTimer = { id:flight.esm.types.signals.Types.TimerId, fireAtMs:Float };

typedef SignalTimerState = flight.esm.types.signals.Types.SignalTimerState;

typedef SignalTimerStateRaw = { nowMs:Float, timers:Array<flight.esm.types.signals_contract.Types.SignalTimer>, nextId:Float };

typedef SignalTrackedConnectOptions = flight.esm.types.signals.Types.SignalTrackedConnectOptions;

typedef SlotId = { value:Float };

typedef TimerId = flight.esm.types.signals.Types.TimerId;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
