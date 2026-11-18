package flight._hl._fn;

extern class Command {
	@:hlNative("flight", "flight_create_add_node_child_command")
	public static function createAddNodeChildCommand(parent:hl.Bytes, child:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_composite_command")
	public static function createCompositeCommand(children:hl.Bytes, childrenLen:Int):hl.Bytes;
	@:hlNative("flight", "flight_create_remove_node_child_command")
	public static function createRemoveNodeChildCommand(parent:hl.Bytes, child:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_reorder_node_child_command")
	public static function createReorderNodeChildCommand(parent:hl.Bytes, child:hl.Bytes, toIndex:Int):hl.Bytes;
	@:hlNative("flight", "flight_create_command_binding_table")
	public static function createCommandBindingTable():flight._hl.CommandBindingTable;
	@:hlNative("flight", "flight_get_command_binding")
	public static function getCommandBinding(history:hl.Bytes, kind:hl.Bytes):flight._hl.CommandBindingRef;
	@:hlNative("flight", "flight_has_command_binding")
	public static function hasCommandBinding(history:hl.Bytes, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_register_command_binding")
	public static function registerCommandBinding(history:hl.Bytes, kind:hl.Bytes, binding:flight._hl.CommandBindingRef):Void;
	@:hlNative("flight", "flight_register_default_command_bindings")
	public static function registerDefaultCommandBindings(history:hl.Bytes, access:flight._hl.CommandPropertyAccessRef):Void;
	@:hlNative("flight", "flight_create_command_history")
	public static function createCommandHistory():hl.Bytes;
	@:hlNative("flight", "flight_can_redo_command")
	public static function canRedoCommand(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_can_undo_command")
	public static function canUndoCommand(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_clear_command_history")
	public static function clearCommandHistory(history:hl.Bytes):Void;
	@:hlNative("flight", "flight_execute_command")
	public static function executeCommand(history:hl.Bytes, command:flight._hl.CommandRef):Bool;
	@:hlNative("flight", "flight_get_command_history_entries")
	public static function getCommandHistoryEntries(out:hl.Bytes, history:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_command_history_index")
	public static function getCommandHistoryIndex(history:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_command_history_redo_label")
	public static function getCommandHistoryRedoLabel(history:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_command_history_undo_label")
	public static function getCommandHistoryUndoLabel(history:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_redo_command")
	public static function redoCommand(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_undo_command")
	public static function undoCommand(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_enable_command_history_signals")
	public static function enableCommandHistorySignals(history:hl.Bytes):flight._hl.UnitSignal;
	@:hlNative("flight", "flight_get_command_history_signals")
	public static function getCommandHistorySignals(history:hl.Bytes):flight._hl.UnitSignal;
	@:hlNative("flight", "flight_abort_command_transaction")
	public static function abortCommandTransaction(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_begin_command_transaction")
	public static function beginCommandTransaction(history:hl.Bytes, label:hl.Bytes):Void;
	@:hlNative("flight", "flight_end_command_transaction")
	public static function endCommandTransaction(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_command_transaction_open")
	public static function isCommandTransactionOpen(history:hl.Bytes):Bool;
	@:hlNative("flight", "flight_explain_command_dispatch")
	public static function explainCommandDispatch(history:hl.Bytes, command:flight._hl.CommandRef):flight._hl.CommandDispatchExplanation;
	@:hlNative("flight", "flight_free_command_binding_table")
	public static function freeCommandBindingTable(ptr:flight._hl.CommandBindingTable):Void;
	@:hlNative("flight", "flight_free_command_binding_ref")
	public static function freeCommandBindingRef(ptr:flight._hl.CommandBindingRef):Void;
	@:hlNative("flight", "flight_free_unit_signal")
	public static function freeUnitSignal(ptr:flight._hl.UnitSignal):Void;
	@:hlNative("flight", "flight_free_command_dispatch_explanation")
	public static function freeCommandDispatchExplanation(ptr:flight._hl.CommandDispatchExplanation):Void;
}
