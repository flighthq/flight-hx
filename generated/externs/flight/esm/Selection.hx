package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/selection")
extern class Selection {
  public static function addLassoSelectionPoint(selection:flight.esm.types.selection.Types.LassoSelection, x:Float, y:Float):Void;
  public static function addNodeToSelection<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, node:NodeType):Void;
  public static function applyPointerSelectionPolicy<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, hit:Null<NodeType>, modifiers:flight.esm.types.selection.Types.SelectionModifierState):Void;
  public static function applyPointerUpSelectionPolicy<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, hit:Null<NodeType>, modifiers:flight.esm.types.selection.Types.SelectionModifierState, didDrag:Bool):Void;
  public static function beginLassoSelection(selection:flight.esm.types.selection.Types.LassoSelection, startX:Float, startY:Float):Void;
  public static function beginMarqueeSelection(selection:flight.esm.types.selection.Types.MarqueeSelection, startX:Float, startY:Float):Void;
  public static function clearSelection<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):Void;
  public static function createLassoSelection():flight.esm.types.selection.Types.LassoSelection;
  public static function createMarqueeSelection():flight.esm.types.selection.Types.MarqueeSelection;
  public static function createSelectionState<NodeType>():flight.esm.types.selection.Types.SelectionState<NodeType>;
  public static function endLassoSelection(selection:flight.esm.types.selection.Types.LassoSelection):flight.esm.types.path_contract.Types.PathRaw;
  public static function endMarqueeSelection(selection:flight.esm.types.selection.Types.MarqueeSelection):flight.esm.types.geometry.Types.Rectangle;
  public static function findNodesInLassoSelection<NodeType>(selection:flight.esm.types.selection.Types.LassoSelection, candidates:Array<NodeType>):Array<NodeType>;
  public static function findNodesInMarqueeSelection<NodeType>(selection:flight.esm.types.selection.Types.MarqueeSelection, candidates:Array<NodeType>, ?mode:flight.esm.types.selection.Types.MarqueeSelectionMode):Array<NodeType>;
  public static function getActiveNode<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):Null<NodeType>;
  public static function getLassoSelectionPath(selection:flight.esm.types.selection.Types.LassoSelection):flight.esm.types.path_contract.Types.PathRaw;
  public static function getMarqueeRectangle(selection:flight.esm.types.selection.Types.MarqueeSelection):flight.esm.types.geometry.Types.Rectangle;
  public static function getSelectedNodes<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):Array<NodeType>;
  public static function getSelectionCount<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):Float;
  public static function getSelectionSignals<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):flight.esm.types.selection.Types.SelectionSignals<NodeType>;
  public static function hasSelection<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>):Bool;
  public static function isNodeSelected<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, node:NodeType):Bool;
  public static function removeNodeFromSelection<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, node:NodeType):Void;
  public static function selectAllNodes<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, candidates:Array<NodeType>):Void;
  public static function selectNode<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, node:NodeType):Void;
  public static function toggleNodeSelection<NodeType>(state:flight.esm.types.selection.Types.SelectionState<NodeType>, node:NodeType):Void;
  public static function updateMarqueeSelection(selection:flight.esm.types.selection.Types.MarqueeSelection, currentX:Float, currentY:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
