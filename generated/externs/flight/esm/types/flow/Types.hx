package flight.esm.types.flow;

#if (js && flight_esm)
typedef FlowGuardContext = { logState:flight.esm.types.log.Types.LogState, clock:(() -> Float) };

typedef FlowGuardKind = String;

typedef FlowGuardState = { enabled:Bool, transitionDepth:Float, context:Null<flight.esm.types.flow.Types.FlowGuardContext> };

@:jsRequire("@flighthq/flow", "FlowStack")
extern class FlowStack {
  public function new(?raw:flight.esm.types.flow.Types.FlowStackRaw);
  public final raw:flight.esm.types.flow.Types.FlowStackRaw;
  public final states:Array<flight.esm.types.flow.Types.FlowState>;
  public function activeState():Null<flight.esm.types.flow.Types.FlowState>;
  public function clearStack():Void;
  public function popState():Null<flight.esm.types.flow.Types.FlowState>;
  public function pushState(state:flight.esm.types.flow.Types.FlowState, guards:flight.esm.types.flow.Types.FlowGuardState):Void;
  public function replaceState(state:flight.esm.types.flow.Types.FlowState, guards:flight.esm.types.flow.Types.FlowGuardState):Void;
  public function stackDepth():Float;
  public function updateStack(deltaTime:Float):Void;
  public function visibleStates(out:Array<flight.esm.types.flow.Types.FlowState>):Void;
  public static function create():flight.esm.types.flow.Types.FlowStack;
  public static function from(raw:flight.esm.types.flow.Types.FlowStackRaw):flight.esm.types.flow.Types.FlowStack;
}

typedef FlowStackRaw = { states:Array<flight.esm.types.flow.Types.FlowState> };

typedef FlowState = { ?name:Null<String>, ?onEnter:Null<flight.esm.types.flow_contract.Types.FlowCallback>, ?onExit:Null<flight.esm.types.flow_contract.Types.FlowCallback>, ?onPause:Null<flight.esm.types.flow_contract.Types.FlowCallback>, ?onResume:Null<flight.esm.types.flow_contract.Types.FlowCallback>, ?onUpdate:Null<flight.esm.types.flow_contract.Types.FlowUpdateCallback>, ?renderBelow:Null<Bool>, ?updateBelow:Null<Bool> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
