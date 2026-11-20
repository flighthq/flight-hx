package flight.esm.types.sdk_signals;

#if (js && flight_esm)
typedef FrameTick = flight.esm.types.signals.Types.FrameTick;

typedef Signal<T> = flight.esm.types.signals.Types.Signal<T>;

typedef SignalConnectOptions = flight.esm.types.signals.Types.SignalConnectOptions;

typedef SignalConnection = flight.esm.types.signals.Types.SignalConnection;

typedef SignalData<T> = flight.esm.types.signals.Types.SignalData<T>;

typedef SignalScope = flight.esm.types.signals.Types.SignalScope;

typedef SignalThrottleOptions = flight.esm.types.signals.Types.SignalThrottleOptions;

typedef SignalTimerState = flight.esm.types.signals.Types.SignalTimerState;

typedef SignalTrackedConnectOptions = flight.esm.types.signals.Types.SignalTrackedConnectOptions;

typedef TimerId = flight.esm.types.signals.Types.TimerId;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
