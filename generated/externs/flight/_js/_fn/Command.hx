package flight._js._fn;

@:jsRequire("@flighthq/command")
extern class Command {
	@:native("createAddNodeChildCommand")
	public static function createAddNodeChildCommand(parent:Dynamic, child:Dynamic):Dynamic;
	@:native("createCompositeCommand")
	public static function createCompositeCommand(children:Dynamic):Dynamic;
	@:native("createRemoveNodeChildCommand")
	public static function createRemoveNodeChildCommand(parent:Dynamic, child:Dynamic):Dynamic;
	@:native("createReorderNodeChildCommand")
	public static function createReorderNodeChildCommand(parent:Dynamic, child:Dynamic, toIndex:Int):Dynamic;
	@:native("createCommandBindingTable")
	public static function createCommandBindingTable():flight._js.CommandBindingTable;
	@:native("getCommandBinding")
	public static function getCommandBinding(history:Dynamic, kind:String):Null<flight._js.CommandBindingRef>;
	@:native("hasCommandBinding")
	public static function hasCommandBinding(history:Dynamic, kind:String):Bool;
	@:native("registerCommandBinding")
	public static function registerCommandBinding(history:Dynamic, kind:String, binding:flight._js.CommandBindingRef):Void;
	@:native("registerDefaultCommandBindings")
	public static function registerDefaultCommandBindings(history:Dynamic, access:flight._js.CommandPropertyAccessRef):Void;
	@:native("createCommandHistory")
	public static function createCommandHistory():Dynamic;
	@:native("canRedoCommand")
	public static function canRedoCommand(history:Dynamic):Bool;
	@:native("canUndoCommand")
	public static function canUndoCommand(history:Dynamic):Bool;
	@:native("clearCommandHistory")
	public static function clearCommandHistory(history:Dynamic):Void;
	@:native("executeCommand")
	public static function executeCommand(history:Dynamic, command:flight._js.CommandRef):Bool;
	@:native("getCommandHistoryEntries")
	public static function getCommandHistoryEntries(out:Dynamic, history:Dynamic):Void;
	@:native("getCommandHistoryIndex")
	public static function getCommandHistoryIndex(history:Dynamic):Int;
	@:native("getCommandHistoryRedoLabel")
	public static function getCommandHistoryRedoLabel(history:Dynamic):Null<String>;
	@:native("getCommandHistoryUndoLabel")
	public static function getCommandHistoryUndoLabel(history:Dynamic):Null<String>;
	@:native("redoCommand")
	public static function redoCommand(history:Dynamic):Bool;
	@:native("undoCommand")
	public static function undoCommand(history:Dynamic):Bool;
	@:native("enableCommandHistorySignals")
	public static function enableCommandHistorySignals(history:Dynamic):flight._js.UnitSignal;
	@:native("getCommandHistorySignals")
	public static function getCommandHistorySignals(history:Dynamic):Null<flight._js.UnitSignal>;
	@:native("abortCommandTransaction")
	public static function abortCommandTransaction(history:Dynamic):Bool;
	@:native("beginCommandTransaction")
	public static function beginCommandTransaction(history:Dynamic, label:String):Void;
	@:native("endCommandTransaction")
	public static function endCommandTransaction(history:Dynamic):Bool;
	@:native("isCommandTransactionOpen")
	public static function isCommandTransactionOpen(history:Dynamic):Bool;
	@:native("explainCommandDispatch")
	public static function explainCommandDispatch(history:Dynamic, command:flight._js.CommandRef):flight._js.CommandDispatchExplanation;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAddNodeChildCommandRef(ptr:flight._js.AddNodeChildCommand):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCompositeCommandRef(ptr:flight._js.CompositeCommand):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRemoveNodeChildCommandRef(ptr:flight._js.RemoveNodeChildCommand):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeReorderNodeChildCommandRef(ptr:flight._js.ReorderNodeChildCommand):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCommandBindingTable(ptr:flight._js.CommandBindingTable):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCommandBindingRef(ptr:flight._js.CommandBinding):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCommandHistoryRef(ptr:flight._js.CommandHistory):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeUnitSignal(ptr:flight._js.UnitSignal):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCommandDispatchExplanation(ptr:flight._js.CommandDispatchExplanation):Void {}
}
