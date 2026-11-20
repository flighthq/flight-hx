package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/debug")
extern class Debug {
  public static function beginDebugSpan(state:flight.esm.types.debug.Types.DebugState, nowMs:Float, name:String, ?channel:Null<String>):Null<flight.esm.types.log.Types.LogTimer>;
  public static function createDebugState():flight.esm.types.debug.Types.DebugState;
  public static function disableDebug(state:flight.esm.types.debug.Types.DebugState, logState:flight.esm.types.log.Types.LogState):Void;
  public static function enableDebug(state:flight.esm.types.debug.Types.DebugState, logState:flight.esm.types.log.Types.LogState, ?options:flight.esm.types.debug.Types.DebugOptions):Void;
  public static function enableFlightDiagnostics(debugState:flight.esm.types.debug.Types.DebugState, logState:flight.esm.types.log.Types.LogState, state:flight.esm.types.render_contract.Types.RenderState):Void;
  public static function endDebugSpan(logState:flight.esm.types.log.Types.LogState, nowMs:Float, timer:Null<flight.esm.types.log.Types.LogTimer>):Float;
  public static function isDebugEnabled(state:flight.esm.types.debug.Types.DebugState):Bool;
  public static function markDebugFrame(state:flight.esm.types.debug.Types.DebugState, logState:flight.esm.types.log.Types.LogState, nowMs:Float, ?label:Null<String>, ?channel:Null<String>):Void;
  public static function measureDebugSpan<T>(state:flight.esm.types.debug.Types.DebugState, logState:flight.esm.types.log.Types.LogState, clock:(() -> Float), name:String, fn:(() -> T), ?channel:Null<String>):T;
  public static function registerDebugSubsystem(state:flight.esm.types.debug.Types.DebugState, name:flight.esm.types.debug.Types.DebugSubsystemName, hooks:flight.esm.types.debug.Types.DebugSubsystemHooks):Void;
  public static function unregisterDebugSubsystem(state:flight.esm.types.debug.Types.DebugState, name:flight.esm.types.debug.Types.DebugSubsystemName):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
