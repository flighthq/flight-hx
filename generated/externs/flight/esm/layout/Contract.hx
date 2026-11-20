package flight.esm.layout;

#if (js && flight_esm)
@:jsRequire("@flighthq/layout/contract")
extern class Contract {
  public static final AnchorLayoutKind:String;
  public static final FlexLayoutKind:String;
  public static final GridLayoutKind:String;
  public static final LayoutResolutionFailureKind:Dynamic;
  public static function createLayoutState():flight.esm.types.layout.Types.LayoutState;
  public static function enableLayoutGuards(state:flight.esm.types.layout.Types.LayoutState, warningSink:flight.esm.types.layout.Types.LayoutResolutionGuard):Void;
  public static function explainLayoutResolution(state:flight.esm.types.layout.Types.LayoutState, tree:flight.esm.types.layout.Types.LayoutTree, nodeIndex:Float):Null<flight.esm.types.layout.Types.LayoutResolutionExplanation>;
  public static function initializeLayoutState(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.layout.Types.LayoutState>):Void;
  public static function registerAnchorLayoutResolver(state:flight.esm.types.layout.Types.LayoutState):Void;
  public static function registerFlexLayoutResolver(state:flight.esm.types.layout.Types.LayoutState):Void;
  public static function registerGridLayoutResolver(state:flight.esm.types.layout.Types.LayoutState):Void;
  public static function registerLayoutResolver(state:flight.esm.types.layout.Types.LayoutState, kind:String, resolver:Null<flight.esm.types.layout.Types.LayoutResolver>):Void;
  public static function resolveLayoutTree(out:js.lib.Float32Array, state:flight.esm.types.layout.Types.LayoutState, tree:flight.esm.types.layout.Types.LayoutTree, intrinsicSizes:Dynamic, availableWidth:Float, availableHeight:Float):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
