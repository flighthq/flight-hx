package flight.esm.statechart;

#if (js && flight_esm)
@:jsRequire("@flighthq/statechart/contract")
extern class Contract {
  public static final Statechart:Dynamic;
  public static final StatechartAtomicStateKind:String;
  public static final StatechartComparison:{ Equal:String, GreaterThan:String, GreaterThanOrEqual:String, LessThan:String, LessThanOrEqual:String, NotEqual:String };
  public static final StatechartInputKind:{ Boolean:String, Number:String, Trigger:String };
  public static final StatechartInstance:Dynamic;
  public static final StatechartNestedStateKind:String;
  public static final StatechartTransitionStatus:{ ConditionsUnmet:String, ExitTimePending:String, InvalidRegion:String, MissingRegionDuration:String, NoTransitions:String, Ready:String, Transitioning:String };
  public static function advanceStatechartInstance(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, deltaTime:Float):Float;
  public static function areStatechartGuardsEnabled(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw):Bool;
  public static function createStatechartInstance(chart:flight.esm.types.statechart.Types.StatechartRaw):flight.esm.types.statechart.Types.StatechartInstanceRaw;
  public static function disableStatechartGuards(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw):Void;
  public static function enableStatechartGuards(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function enableStatechartSignals(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw):flight.esm.types.statechart.Types.StatechartSignals;
  public static function explainStatechartTransition(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, regionIndex:Float):flight.esm.types.statechart.Types.StatechartTransitionExplanation;
  public static function fireStatechartTrigger(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, inputIndex:Float):Void;
  public static function getStatechartInputIndex(chart:flight.esm.types.statechart.Types.StatechartRaw, name:String):Float;
  public static function getStatechartRegionBlend(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, regionIndex:Float):Float;
  public static function getStatechartRegionState(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, regionIndex:Float):Float;
  public static function getStatechartSignals(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw):Null<flight.esm.types.statechart.Types.StatechartSignals>;
  public static function initializeStatechartInstance(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.statechart.Types.StatechartInstanceRaw>, chart:flight.esm.types.statechart.Types.StatechartRaw):Void;
  public static function initializeStatechartSignals(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.statechart.Types.StatechartSignals>):Void;
  public static function setStatechartBooleanInput(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, inputIndex:Float, value:Bool):Void;
  public static function setStatechartNumberInput(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, inputIndex:Float, value:Float):Void;
  public static function setStatechartRegionDuration(instance:flight.esm.types.statechart.Types.StatechartInstanceRaw, regionIndex:Float, duration:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
