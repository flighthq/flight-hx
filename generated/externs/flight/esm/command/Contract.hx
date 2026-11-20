package flight.esm.command;

#if (js && flight_esm)
@:jsRequire("@flighthq/command/contract")
extern class Contract {
  public static final AddNodeChildCommandKind:String;
  public static final CompositeCommandKind:String;
  public static final RemoveNodeChildCommandKind:String;
  public static final ReorderNodeChildCommandKind:String;
  public static final SetNodePropertyCommandKind:String;
  public static function abortCommandTransaction(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function beginCommandTransaction(history:flight.esm.types.command.Types.CommandHistory, label:String):Void;
  public static function canRedoCommand(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function canUndoCommand(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function clearCommandHistory(history:flight.esm.types.command.Types.CommandHistory):Void;
  public static function createAddNodeChildCommand(label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny, ?index:Float):flight.esm.types.command.Types.AddNodeChildCommand;
  public static function createCommandBindingTable():flight.esm.types.command.Types.CommandBindingTable;
  public static function createCommandHistory(?maxSize:Float):flight.esm.types.command.Types.CommandHistory;
  public static function createCompositeCommand(label:String, children:Array<flight.esm.types.command.Types.Command>):flight.esm.types.command.Types.CompositeCommand;
  public static function createRemoveNodeChildCommand(label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny):flight.esm.types.command.Types.RemoveNodeChildCommand;
  public static function createReorderNodeChildCommand(label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny, toIndex:Float):flight.esm.types.command.Types.ReorderNodeChildCommand;
  public static function createSetNodePropertyCommand(label:String, target:flight.esm.types.node.Types.NodeAny, property:String, value:Dynamic, ?mergeWindow:Float, ?time:Float):flight.esm.types.command.Types.SetNodePropertyCommand;
  public static function createSetNodePropertyCommandBatch(label:String, entries:Array<Dynamic>, ?mergeWindow:Float, ?time:Float):flight.esm.types.command.Types.SetNodePropertyCommand;
  public static function enableCommandHistorySignals(history:flight.esm.types.command.Types.CommandHistory):flight.esm.types.signals.Types.Signal<Void>;
  public static function endCommandTransaction(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function executeCommand(history:flight.esm.types.command.Types.CommandHistory, command:flight.esm.types.command.Types.Command):Bool;
  public static function explainCommandDispatch(history:flight.esm.types.command.Types.CommandHistory, command:flight.esm.types.command.Types.Command):flight.esm.types.command.Types.CommandDispatchExplanation;
  public static function getCommandBinding(history:flight.esm.types.command.Types.CommandHistory, kind:String):Null<flight.esm.types.command.Types.CommandBinding>;
  public static function getCommandHistoryEntries(history:flight.esm.types.command.Types.CommandHistory):Array<flight.esm.types.command.Types.Command>;
  public static function getCommandHistoryIndex(history:flight.esm.types.command.Types.CommandHistory):Float;
  public static function getCommandHistoryRedoLabel(history:flight.esm.types.command.Types.CommandHistory):Null<String>;
  public static function getCommandHistorySignals(history:flight.esm.types.command.Types.CommandHistory):Null<flight.esm.types.signals.Types.Signal<Void>>;
  public static function getCommandHistoryUndoLabel(history:flight.esm.types.command.Types.CommandHistory):Null<String>;
  public static function hasCommandBinding(history:flight.esm.types.command.Types.CommandHistory, kind:String):Bool;
  public static function initializeAddNodeChildCommand(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.AddNodeChildCommand>, label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny, index:Float):Void;
  public static function initializeCommandHistory(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.CommandHistory>, ?maxSize:Float):Void;
  public static function initializeCompositeCommand(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.CompositeCommand>, label:String, children:Array<flight.esm.types.command.Types.Command>):Void;
  public static function initializeRemoveNodeChildCommand(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.RemoveNodeChildCommand>, label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny):Void;
  public static function initializeReorderNodeChildCommand(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.ReorderNodeChildCommand>, label:String, parent:flight.esm.types.node.Types.NodeAny, child:flight.esm.types.node.Types.NodeAny, toIndex:Float):Void;
  public static function initializeSetNodePropertyCommand(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.command.Types.SetNodePropertyCommand>, entries:Array<flight.esm.types.command.Types.CommandPropertyEntry>, kind:String, label:String, mergeWindow:Float, time:Float):Void;
  public static function isCommandTransactionOpen(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function notifyCommandHistoryChanged(history:flight.esm.types.command.Types.CommandHistory):Void;
  public static function redoCommand(history:flight.esm.types.command.Types.CommandHistory):Bool;
  public static function registerCommandBinding(history:flight.esm.types.command.Types.CommandHistory, kind:String, binding:flight.esm.types.command.Types.CommandBinding):Void;
  public static function registerDefaultCommandBindings(history:flight.esm.types.command.Types.CommandHistory):Void;
  public static function undoCommand(history:flight.esm.types.command.Types.CommandHistory):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
