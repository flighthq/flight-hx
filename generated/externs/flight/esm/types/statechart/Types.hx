package flight.esm.types.statechart;

#if (js && flight_esm)
@:jsRequire("@flighthq/statechart", "Statechart")
extern class Statechart {
  public function new(?raw:flight.esm.types.statechart.Types.StatechartRaw);
  public final raw:flight.esm.types.statechart.Types.StatechartRaw;
  public final inputs:Array<flight.esm.types.statechart.Types.StatechartInput>;
  public final name:Null<String>;
  public final regions:Array<flight.esm.types.statechart.Types.StatechartRegion>;
  public function getInputIndex(name:String):Float;
  public static function create():flight.esm.types.statechart.Types.Statechart;
  public static function from(raw:flight.esm.types.statechart.Types.StatechartRaw):flight.esm.types.statechart.Types.Statechart;
}

typedef StatechartComparison = String;

typedef StatechartCondition = { comparison:flight.esm.types.statechart.Types.StatechartComparison, inputIndex:Float, value:Float };

typedef StatechartDurationGuard = ((instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, explanation:flight.esm.types.statechart.Types.StatechartTransitionExplanation) -> Void);

typedef StatechartInput = { initialValue:Float, kind:flight.esm.types.statechart.Types.StatechartInputKind, ?name:Null<String> };

typedef StatechartInputKind = String;

@:jsRequire("@flighthq/statechart", "StatechartInstance")
extern class StatechartInstance {
  public function new(?chart:Dynamic);
  public final raw:flight.esm.types.statechart.Types.StatechartInstanceRaw;
  public final chart:flight.esm.types.statechart.Types.StatechartRaw;
  public final durationGuard:Null<flight.esm.types.statechart.Types.StatechartDurationGuard>;
  public final inputValues:js.lib.Float64Array;
  public final regionBlendValues:js.lib.Float32Array;
  public final regionDuration:js.lib.Float64Array;
  public final regionElapsed:js.lib.Float64Array;
  public final regionStates:js.lib.Int32Array;
  public final regionTransitions:js.lib.Int32Array;
  public final signals:Null<flight.esm.types.statechart.Types.StatechartSignals>;
  public function advance(deltaTime:Float):Float;
  public function disableGuards():Void;
  public function enableGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public function enableSignals():flight.esm.types.statechart.Types.StatechartSignals;
  public function explainTransition(regionIndex:Float):flight.esm.types.statechart.Types.StatechartTransitionExplanation;
  public function fireTrigger(inputIndex:Float):Void;
  public function getSignals():Null<flight.esm.types.statechart.Types.StatechartSignals>;
  public function guardsEnabled():Bool;
  public function regionBlend(regionIndex:Float):Float;
  public function regionState(regionIndex:Float):Float;
  public function setBooleanInput(inputIndex:Float, value:Bool):Void;
  public function setNumberInput(inputIndex:Float, value:Float):Void;
  public function setRegionDuration(regionIndex:Float, duration:Float):Void;
  public static function create(?chart:Dynamic):flight.esm.types.statechart.Types.StatechartInstance;
  public static function from(raw:flight.esm.types.statechart.Types.StatechartInstanceRaw):flight.esm.types.statechart.Types.StatechartInstance;
}

typedef StatechartInstanceRaw = { chart:flight.esm.types.statechart.Types.StatechartRaw, durationGuard:Null<flight.esm.types.statechart.Types.StatechartDurationGuard>, inputValues:js.lib.Float64Array, regionBlend:js.lib.Float32Array, regionDuration:js.lib.Float64Array, regionElapsed:js.lib.Float64Array, regionStates:js.lib.Int32Array, regionTransitions:js.lib.Int32Array, signals:Null<flight.esm.types.statechart.Types.StatechartSignals> };

typedef StatechartRaw = { inputs:Array<flight.esm.types.statechart.Types.StatechartInput>, ?name:Null<String>, regions:Array<flight.esm.types.statechart.Types.StatechartRegion> };

typedef StatechartRegion = { initialStateIndex:Float, ?name:Null<String>, states:Array<flight.esm.types.statechart.Types.StatechartState> };

typedef StatechartSignals = { onStateChange:flight.esm.types.signals.Types.Signal<Array<Float>> };

typedef StatechartState = { kind:String, ?name:Null<String>, transitions:Array<flight.esm.types.statechart.Types.StatechartTransition> };

typedef StatechartTransition = { conditions:Array<flight.esm.types.statechart.Types.StatechartCondition>, durationMs:Float, exitTimeRatio:Float, targetStateIndex:Float };

typedef StatechartTransitionExplanation = { blend:Float, conditionIndex:Float, regionIndex:Float, sourceStateIndex:Float, status:flight.esm.types.statechart.Types.StatechartTransitionStatus, targetStateIndex:Float, transitionIndex:Float };

typedef StatechartTransitionStatus = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
