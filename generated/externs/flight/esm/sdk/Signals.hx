package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/signals")
extern class Signals {
  public static function advanceSignalTimers(state:flight.esm.types.signals_contract.Types.SignalTimerStateRaw, nowMs:Float):Void;
  public static function cancelSignal<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>):Void;
  public static function clearSignal<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>):Void;
  public static function clearSignalTimeout(state:flight.esm.types.signals_contract.Types.SignalTimerStateRaw, id:flight.esm.types.signals.Types.TimerId):Void;
  public static function connectSignal<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, slot:flight.esm.types.signals_contract.Types.SignalSlot<T>, ?options:Null<flight.esm.types.signals.Types.SignalConnectOptions>):flight.esm.types.signals_contract.Types.SlotId;
  public static function connectSignalAtFrameRate(source:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.signals.Types.FrameTick>, fps:Float, slot:((arg0:Float) -> Void)):(() -> Void);
  public static function connectSignalDebounced<T>(source:flight.esm.types.signals_contract.Types.SignalRaw<T>, delayMs:Float, slot:flight.esm.types.signals_contract.Types.SignalSlot<T>, options:Null<flight.esm.types.signals.Types.SignalThrottleOptions>, state:flight.esm.types.signals_contract.Types.SignalTimerStateRaw):(() -> Void);
  public static function connectSignalThrottled<T>(source:flight.esm.types.signals_contract.Types.SignalRaw<T>, intervalMs:Float, slot:flight.esm.types.signals_contract.Types.SignalSlot<T>, options:Null<flight.esm.types.signals.Types.SignalThrottleOptions>, state:flight.esm.types.signals_contract.Types.SignalTimerStateRaw):(() -> Void);
  public static function connectSignalTracked<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, slot:flight.esm.types.signals_contract.Types.SignalSlot<T>, ?options:Null<flight.esm.types.signals.Types.SignalTrackedConnectOptions>):flight.esm.types.signals.Types.SignalConnection;
  public static function createSignal<T>():flight.esm.types.signals_contract.Types.SignalRaw<T>;
  public static function createSignalScope():flight.esm.types.signals_contract.Types.SignalScopeRaw;
  public static function createSignalTimerState():flight.esm.types.signals_contract.Types.SignalTimerStateRaw;
  public static function disconnectSignal<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, id:flight.esm.types.signals_contract.Types.SlotId):Void;
  public static function disconnectSignalConnection(connection:flight.esm.types.signals.Types.SignalConnection):Void;
  public static function disconnectSignalScope(scope:flight.esm.types.signals_contract.Types.SignalScopeRaw):Void;
  public static function emitSignal<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, args:T):Void;
  public static function emitSignalSafe<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, args:T):Void;
  public static function hasSignalSlots<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>):Bool;
  public static function isSlotConnected<T>(signal:flight.esm.types.signals_contract.Types.SignalRaw<T>, id:flight.esm.types.signals_contract.Types.SlotId):Bool;
  public static function pauseSignalConnection(connection:flight.esm.types.signals.Types.SignalConnection):Void;
  public static function resumeSignalConnection(connection:flight.esm.types.signals.Types.SignalConnection):Void;
  public static function setSignalTimeout(state:flight.esm.types.signals_contract.Types.SignalTimerStateRaw, delayMs:Float, callback_:(() -> Void)):flight.esm.types.signals.Types.TimerId;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
