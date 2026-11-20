package flight.esm.flow;

#if (js && flight_esm)
@:jsRequire("@flighthq/flow/contract")
extern class Contract {
  public static final FlowStack:Dynamic;
  public static function clearFlowStack(stack:flight.esm.types.flow.Types.FlowStackRaw):Void;
  public static function createFlowStack():flight.esm.types.flow.Types.FlowStackRaw;
  public static function disableFlowGuards(state:flight.esm.types.flow.Types.FlowGuardState):Void;
  public static function enableFlowGuards(state:flight.esm.types.flow.Types.FlowGuardState, logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function getActiveFlowState(stack:flight.esm.types.flow.Types.FlowStackRaw):Null<flight.esm.types.flow.Types.FlowState>;
  public static function getFlowGuardKindString(value:flight.esm.types.flow.Types.FlowGuardKind):String;
  public static function getFlowStackDepth(stack:flight.esm.types.flow.Types.FlowStackRaw):Float;
  public static function getFlowStackVisibleStates(out:Array<flight.esm.types.flow.Types.FlowState>, stack:flight.esm.types.flow.Types.FlowStackRaw):Void;
  public static function initializeFlowStack(out:flight.esm.types.flow.Types.FlowStackRaw):Void;
  public static function parseFlowGuardKind(value:String):Null<String>;
  public static function popFlowState(stack:flight.esm.types.flow.Types.FlowStackRaw):Null<flight.esm.types.flow.Types.FlowState>;
  public static function pushFlowState(stack:flight.esm.types.flow.Types.FlowStackRaw, state:flight.esm.types.flow.Types.FlowState, guards:flight.esm.types.flow.Types.FlowGuardState):Void;
  public static function replaceFlowState(stack:flight.esm.types.flow.Types.FlowStackRaw, state:flight.esm.types.flow.Types.FlowState, guards:flight.esm.types.flow.Types.FlowGuardState):Void;
  public static function reportFlowGuard(state:flight.esm.types.flow.Types.FlowGuardState, kind:flight.esm.types.flow.Types.FlowGuardKind):Void;
  public static function updateFlowStack(stack:flight.esm.types.flow.Types.FlowStackRaw, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
