package flight._cpp._fn;

extern class Command {
	@:native("flight_create_add_node_child_command")
	public static function createAddNodeChildCommand(parent:flight._cpp.FlightNode, child:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_create_composite_command")
	public static function createCompositeCommand(children:cpp.Star<cpp.Void>, childrenLen:Int):cpp.Star<cpp.Void>;
	@:native("flight_create_remove_node_child_command")
	public static function createRemoveNodeChildCommand(parent:flight._cpp.FlightNode, child:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_create_reorder_node_child_command")
	public static function createReorderNodeChildCommand(parent:flight._cpp.FlightNode, child:flight._cpp.FlightNode, toIndex:Int):cpp.Star<cpp.Void>;
	@:native("flight_create_command_binding_table")
	public static function createCommandBindingTable():flight._cpp.CommandBindingTable;
	@:native("flight_get_command_binding")
	public static function getCommandBinding(history:cpp.Star<cpp.Void>, kind:cpp.ConstCharStar):flight._cpp.CommandBindingRef;
	@:native("flight_has_command_binding")
	public static function hasCommandBinding(history:cpp.Star<cpp.Void>, kind:cpp.ConstCharStar):Bool;
	@:native("flight_register_command_binding")
	public static function registerCommandBinding(history:cpp.Star<cpp.Void>, kind:cpp.ConstCharStar, binding:flight._cpp.CommandBindingRef):Void;
	@:native("flight_register_default_command_bindings")
	public static function registerDefaultCommandBindings(history:cpp.Star<cpp.Void>, access:flight._cpp.CommandPropertyAccessRef):Void;
	@:native("flight_create_command_history")
	public static function createCommandHistory():cpp.Star<cpp.Void>;
	@:native("flight_can_redo_command")
	public static function canRedoCommand(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_can_undo_command")
	public static function canUndoCommand(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_clear_command_history")
	public static function clearCommandHistory(history:cpp.Star<cpp.Void>):Void;
	@:native("flight_execute_command")
	public static function executeCommand(history:cpp.Star<cpp.Void>, command:flight._cpp.CommandRef):Bool;
	@:native("flight_get_command_history_entries")
	public static function getCommandHistoryEntries(out:cpp.Star<cpp.Void>, history:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_command_history_index")
	public static function getCommandHistoryIndex(history:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_command_history_redo_label")
	public static function getCommandHistoryRedoLabel(history:cpp.Star<cpp.Void>):cpp.ConstCharStar;
	@:native("flight_get_command_history_undo_label")
	public static function getCommandHistoryUndoLabel(history:cpp.Star<cpp.Void>):cpp.ConstCharStar;
	@:native("flight_redo_command")
	public static function redoCommand(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_undo_command")
	public static function undoCommand(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_enable_command_history_signals")
	public static function enableCommandHistorySignals(history:cpp.Star<cpp.Void>):flight._cpp.UnitSignal;
	@:native("flight_get_command_history_signals")
	public static function getCommandHistorySignals(history:cpp.Star<cpp.Void>):flight._cpp.UnitSignal;
	@:native("flight_abort_command_transaction")
	public static function abortCommandTransaction(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_begin_command_transaction")
	public static function beginCommandTransaction(history:cpp.Star<cpp.Void>, label:cpp.ConstCharStar):Void;
	@:native("flight_end_command_transaction")
	public static function endCommandTransaction(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_command_transaction_open")
	public static function isCommandTransactionOpen(history:cpp.Star<cpp.Void>):Bool;
	@:native("flight_explain_command_dispatch")
	public static function explainCommandDispatch(history:cpp.Star<cpp.Void>, command:flight._cpp.CommandRef):flight._cpp.CommandDispatchExplanation;
	@:native("flight_free_add_node_child_command_ref")
	public static function freeAddNodeChildCommandRef(ptr:flight._cpp.AddNodeChildCommand):Void;
	@:native("flight_free_composite_command_ref")
	public static function freeCompositeCommandRef(ptr:flight._cpp.CompositeCommand):Void;
	@:native("flight_free_remove_node_child_command_ref")
	public static function freeRemoveNodeChildCommandRef(ptr:flight._cpp.RemoveNodeChildCommand):Void;
	@:native("flight_free_reorder_node_child_command_ref")
	public static function freeReorderNodeChildCommandRef(ptr:flight._cpp.ReorderNodeChildCommand):Void;
	@:native("flight_free_command_binding_table")
	public static function freeCommandBindingTable(ptr:flight._cpp.CommandBindingTable):Void;
	@:native("flight_free_command_binding_ref")
	public static function freeCommandBindingRef(ptr:flight._cpp.CommandBinding):Void;
	@:native("flight_free_command_history_ref")
	public static function freeCommandHistoryRef(ptr:flight._cpp.CommandHistory):Void;
	@:native("flight_free_unit_signal")
	public static function freeUnitSignal(ptr:flight._cpp.UnitSignal):Void;
	@:native("flight_free_command_dispatch_explanation")
	public static function freeCommandDispatchExplanation(ptr:flight._cpp.CommandDispatchExplanation):Void;
}
