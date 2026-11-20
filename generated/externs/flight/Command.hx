package flight;

#if (js && flight_esm)
extern inline function createAddNodeChildCommand(parent:Dynamic, child:Dynamic):Dynamic {
	return flight._js._fn.Command.createAddNodeChildCommand(parent, child);
}
#else
extern inline function createAddNodeChildCommand(parent:flight.FlightNode, child:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Command.createAddNodeChildCommand(parent, child);
#elseif cpp
	return flight._cpp._fn.Command.createAddNodeChildCommand(parent, child);
#elseif (js && flight_esm)
	return flight._js._fn.Command.createAddNodeChildCommand(parent, child);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCompositeCommand(children:Dynamic):Dynamic {
	return flight._js._fn.Command.createCompositeCommand(children);
}
#else
extern inline function createCompositeCommand(children:Dynamic, childrenLen:Int):Dynamic {
#if hl
	return flight._hl._fn.Command.createCompositeCommand(children, childrenLen);
#elseif cpp
	return flight._cpp._fn.Command.createCompositeCommand(children, childrenLen);
#elseif (js && flight_esm)
	return flight._js._fn.Command.createCompositeCommand(children, childrenLen);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRemoveNodeChildCommand(parent:Dynamic, child:Dynamic):Dynamic {
	return flight._js._fn.Command.createRemoveNodeChildCommand(parent, child);
}
#else
extern inline function createRemoveNodeChildCommand(parent:flight.FlightNode, child:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Command.createRemoveNodeChildCommand(parent, child);
#elseif cpp
	return flight._cpp._fn.Command.createRemoveNodeChildCommand(parent, child);
#elseif (js && flight_esm)
	return flight._js._fn.Command.createRemoveNodeChildCommand(parent, child);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createReorderNodeChildCommand(parent:Dynamic, child:Dynamic, toIndex:Int):Dynamic {
	return flight._js._fn.Command.createReorderNodeChildCommand(parent, child, toIndex);
}
#else
extern inline function createReorderNodeChildCommand(parent:flight.FlightNode, child:flight.FlightNode, toIndex:Int):Dynamic {
#if hl
	return flight._hl._fn.Command.createReorderNodeChildCommand(parent, child, toIndex);
#elseif cpp
	return flight._cpp._fn.Command.createReorderNodeChildCommand(parent, child, toIndex);
#elseif (js && flight_esm)
	return flight._js._fn.Command.createReorderNodeChildCommand(parent, child, toIndex);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCommandBindingTable():CommandBindingTable {
	return flight._js._fn.Command.createCommandBindingTable();
}
#else
extern inline function createCommandBindingTable():CommandBindingTable {
#if hl
	return flight._hl._fn.Command.createCommandBindingTable();
#elseif cpp
	return flight._cpp._fn.Command.createCommandBindingTable();
#elseif (js && flight_esm)
	return flight._js._fn.Command.createCommandBindingTable();
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandBinding(history:Dynamic, kind:String):Null<CommandBindingRef> {
	return flight._js._fn.Command.getCommandBinding(history, kind);
}
#else
extern inline function getCommandBinding(history:Dynamic, kind:String):CommandBindingRef {
#if hl
	return flight._hl._fn.Command.getCommandBinding(history, cast kind);
#elseif cpp
	return flight._cpp._fn.Command.getCommandBinding(history, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Command.getCommandBinding(history, kind);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasCommandBinding(history:Dynamic, kind:String):Bool {
	return flight._js._fn.Command.hasCommandBinding(history, kind);
}
#else
extern inline function hasCommandBinding(history:Dynamic, kind:String):Bool {
#if hl
	return flight._hl._fn.Command.hasCommandBinding(history, cast kind);
#elseif cpp
	return flight._cpp._fn.Command.hasCommandBinding(history, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Command.hasCommandBinding(history, kind);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerCommandBinding(history:Dynamic, kind:String, binding:CommandBindingRef):Void {
	flight._js._fn.Command.registerCommandBinding(history, kind, binding);
}
#else
extern inline function registerCommandBinding(history:Dynamic, kind:String, binding:CommandBindingRef):Void {
#if hl
	flight._hl._fn.Command.registerCommandBinding(history, cast kind, binding);
#elseif cpp
	flight._cpp._fn.Command.registerCommandBinding(history, cast kind, binding);
#elseif (js && flight_esm)
	flight._js._fn.Command.registerCommandBinding(history, kind, binding);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerDefaultCommandBindings(history:Dynamic, access:CommandPropertyAccessRef):Void {
	flight._js._fn.Command.registerDefaultCommandBindings(history, access);
}
#else
extern inline function registerDefaultCommandBindings(history:Dynamic, access:CommandPropertyAccessRef):Void {
#if hl
	flight._hl._fn.Command.registerDefaultCommandBindings(history, access);
#elseif cpp
	flight._cpp._fn.Command.registerDefaultCommandBindings(history, access);
#elseif (js && flight_esm)
	flight._js._fn.Command.registerDefaultCommandBindings(history, access);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createCommandHistory():Dynamic {
	return flight._js._fn.Command.createCommandHistory();
}
#else
extern inline function createCommandHistory():Dynamic {
#if hl
	return flight._hl._fn.Command.createCommandHistory();
#elseif cpp
	return flight._cpp._fn.Command.createCommandHistory();
#elseif (js && flight_esm)
	return flight._js._fn.Command.createCommandHistory();
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function canRedoCommand(history:Dynamic):Bool {
	return flight._js._fn.Command.canRedoCommand(history);
}
#else
extern inline function canRedoCommand(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.canRedoCommand(history);
#elseif cpp
	return flight._cpp._fn.Command.canRedoCommand(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.canRedoCommand(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function canUndoCommand(history:Dynamic):Bool {
	return flight._js._fn.Command.canUndoCommand(history);
}
#else
extern inline function canUndoCommand(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.canUndoCommand(history);
#elseif cpp
	return flight._cpp._fn.Command.canUndoCommand(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.canUndoCommand(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearCommandHistory(history:Dynamic):Void {
	flight._js._fn.Command.clearCommandHistory(history);
}
#else
extern inline function clearCommandHistory(history:Dynamic):Void {
#if hl
	flight._hl._fn.Command.clearCommandHistory(history);
#elseif cpp
	flight._cpp._fn.Command.clearCommandHistory(history);
#elseif (js && flight_esm)
	flight._js._fn.Command.clearCommandHistory(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function executeCommand(history:Dynamic, command:CommandRef):Bool {
	return flight._js._fn.Command.executeCommand(history, command);
}
#else
extern inline function executeCommand(history:Dynamic, command:CommandRef):Bool {
#if hl
	return flight._hl._fn.Command.executeCommand(history, command);
#elseif cpp
	return flight._cpp._fn.Command.executeCommand(history, command);
#elseif (js && flight_esm)
	return flight._js._fn.Command.executeCommand(history, command);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandHistoryEntries(out:Dynamic, history:Dynamic):Void {
	flight._js._fn.Command.getCommandHistoryEntries(out, history);
}
#else
extern inline function getCommandHistoryEntries(out:Dynamic, history:Dynamic):Void {
#if hl
	flight._hl._fn.Command.getCommandHistoryEntries(out, history);
#elseif cpp
	flight._cpp._fn.Command.getCommandHistoryEntries(out, history);
#elseif (js && flight_esm)
	flight._js._fn.Command.getCommandHistoryEntries(out, history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandHistoryIndex(history:Dynamic):Int {
	return flight._js._fn.Command.getCommandHistoryIndex(history);
}
#else
extern inline function getCommandHistoryIndex(history:Dynamic):Int {
#if hl
	return flight._hl._fn.Command.getCommandHistoryIndex(history);
#elseif cpp
	return flight._cpp._fn.Command.getCommandHistoryIndex(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.getCommandHistoryIndex(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandHistoryRedoLabel(history:Dynamic):Null<String> {
	return flight._js._fn.Command.getCommandHistoryRedoLabel(history);
}
#else
extern inline function getCommandHistoryRedoLabel(history:Dynamic):String {
#if hl
	return cast flight._hl._fn.Command.getCommandHistoryRedoLabel(history);
#elseif cpp
	return cast flight._cpp._fn.Command.getCommandHistoryRedoLabel(history);
#elseif (js && flight_esm)
	return cast flight._js._fn.Command.getCommandHistoryRedoLabel(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandHistoryUndoLabel(history:Dynamic):Null<String> {
	return flight._js._fn.Command.getCommandHistoryUndoLabel(history);
}
#else
extern inline function getCommandHistoryUndoLabel(history:Dynamic):String {
#if hl
	return cast flight._hl._fn.Command.getCommandHistoryUndoLabel(history);
#elseif cpp
	return cast flight._cpp._fn.Command.getCommandHistoryUndoLabel(history);
#elseif (js && flight_esm)
	return cast flight._js._fn.Command.getCommandHistoryUndoLabel(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function redoCommand(history:Dynamic):Bool {
	return flight._js._fn.Command.redoCommand(history);
}
#else
extern inline function redoCommand(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.redoCommand(history);
#elseif cpp
	return flight._cpp._fn.Command.redoCommand(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.redoCommand(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function undoCommand(history:Dynamic):Bool {
	return flight._js._fn.Command.undoCommand(history);
}
#else
extern inline function undoCommand(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.undoCommand(history);
#elseif cpp
	return flight._cpp._fn.Command.undoCommand(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.undoCommand(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableCommandHistorySignals(history:Dynamic):UnitSignal {
	return flight._js._fn.Command.enableCommandHistorySignals(history);
}
#else
extern inline function enableCommandHistorySignals(history:Dynamic):UnitSignal {
#if hl
	return flight._hl._fn.Command.enableCommandHistorySignals(history);
#elseif cpp
	return flight._cpp._fn.Command.enableCommandHistorySignals(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.enableCommandHistorySignals(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCommandHistorySignals(history:Dynamic):Null<UnitSignal> {
	return flight._js._fn.Command.getCommandHistorySignals(history);
}
#else
extern inline function getCommandHistorySignals(history:Dynamic):UnitSignal {
#if hl
	return flight._hl._fn.Command.getCommandHistorySignals(history);
#elseif cpp
	return flight._cpp._fn.Command.getCommandHistorySignals(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.getCommandHistorySignals(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function abortCommandTransaction(history:Dynamic):Bool {
	return flight._js._fn.Command.abortCommandTransaction(history);
}
#else
extern inline function abortCommandTransaction(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.abortCommandTransaction(history);
#elseif cpp
	return flight._cpp._fn.Command.abortCommandTransaction(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.abortCommandTransaction(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function beginCommandTransaction(history:Dynamic, label:String):Void {
	flight._js._fn.Command.beginCommandTransaction(history, label);
}
#else
extern inline function beginCommandTransaction(history:Dynamic, label:String):Void {
#if hl
	flight._hl._fn.Command.beginCommandTransaction(history, cast label);
#elseif cpp
	flight._cpp._fn.Command.beginCommandTransaction(history, cast label);
#elseif (js && flight_esm)
	flight._js._fn.Command.beginCommandTransaction(history, label);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function endCommandTransaction(history:Dynamic):Bool {
	return flight._js._fn.Command.endCommandTransaction(history);
}
#else
extern inline function endCommandTransaction(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.endCommandTransaction(history);
#elseif cpp
	return flight._cpp._fn.Command.endCommandTransaction(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.endCommandTransaction(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isCommandTransactionOpen(history:Dynamic):Bool {
	return flight._js._fn.Command.isCommandTransactionOpen(history);
}
#else
extern inline function isCommandTransactionOpen(history:Dynamic):Bool {
#if hl
	return flight._hl._fn.Command.isCommandTransactionOpen(history);
#elseif cpp
	return flight._cpp._fn.Command.isCommandTransactionOpen(history);
#elseif (js && flight_esm)
	return flight._js._fn.Command.isCommandTransactionOpen(history);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainCommandDispatch(history:Dynamic, command:CommandRef):CommandDispatchExplanation {
	return flight._js._fn.Command.explainCommandDispatch(history, command);
}
#else
extern inline function explainCommandDispatch(history:Dynamic, command:CommandRef):CommandDispatchExplanation {
#if hl
	return flight._hl._fn.Command.explainCommandDispatch(history, command);
#elseif cpp
	return flight._cpp._fn.Command.explainCommandDispatch(history, command);
#elseif (js && flight_esm)
	return flight._js._fn.Command.explainCommandDispatch(history, command);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAddNodeChildCommandRef(ptr:AddNodeChildCommand):Void {
	flight._js._fn.Command.freeAddNodeChildCommandRef(ptr);
}
#else
extern inline function freeAddNodeChildCommandRef(ptr:AddNodeChildCommand):Void {
#if hl
	flight._hl._fn.Command.freeAddNodeChildCommandRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeAddNodeChildCommandRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeAddNodeChildCommandRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCompositeCommandRef(ptr:CompositeCommand):Void {
	flight._js._fn.Command.freeCompositeCommandRef(ptr);
}
#else
extern inline function freeCompositeCommandRef(ptr:CompositeCommand):Void {
#if hl
	flight._hl._fn.Command.freeCompositeCommandRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeCompositeCommandRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeCompositeCommandRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRemoveNodeChildCommandRef(ptr:RemoveNodeChildCommand):Void {
	flight._js._fn.Command.freeRemoveNodeChildCommandRef(ptr);
}
#else
extern inline function freeRemoveNodeChildCommandRef(ptr:RemoveNodeChildCommand):Void {
#if hl
	flight._hl._fn.Command.freeRemoveNodeChildCommandRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeRemoveNodeChildCommandRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeRemoveNodeChildCommandRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeReorderNodeChildCommandRef(ptr:ReorderNodeChildCommand):Void {
	flight._js._fn.Command.freeReorderNodeChildCommandRef(ptr);
}
#else
extern inline function freeReorderNodeChildCommandRef(ptr:ReorderNodeChildCommand):Void {
#if hl
	flight._hl._fn.Command.freeReorderNodeChildCommandRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeReorderNodeChildCommandRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeReorderNodeChildCommandRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCommandBindingTable(ptr:CommandBindingTable):Void {
	flight._js._fn.Command.freeCommandBindingTable(ptr);
}
#else
extern inline function freeCommandBindingTable(ptr:CommandBindingTable):Void {
#if hl
	flight._hl._fn.Command.freeCommandBindingTable(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeCommandBindingTable(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeCommandBindingTable(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCommandBindingRef(ptr:CommandBinding):Void {
	flight._js._fn.Command.freeCommandBindingRef(ptr);
}
#else
extern inline function freeCommandBindingRef(ptr:CommandBinding):Void {
#if hl
	flight._hl._fn.Command.freeCommandBindingRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeCommandBindingRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeCommandBindingRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCommandHistoryRef(ptr:CommandHistory):Void {
	flight._js._fn.Command.freeCommandHistoryRef(ptr);
}
#else
extern inline function freeCommandHistoryRef(ptr:CommandHistory):Void {
#if hl
	flight._hl._fn.Command.freeCommandHistoryRef(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeCommandHistoryRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeCommandHistoryRef(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeUnitSignal(ptr:UnitSignal):Void {
	flight._js._fn.Command.freeUnitSignal(ptr);
}
#else
extern inline function freeUnitSignal(ptr:UnitSignal):Void {
#if hl
	flight._hl._fn.Command.freeUnitSignal(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeUnitSignal(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeUnitSignal(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCommandDispatchExplanation(ptr:CommandDispatchExplanation):Void {
	flight._js._fn.Command.freeCommandDispatchExplanation(ptr);
}
#else
extern inline function freeCommandDispatchExplanation(ptr:CommandDispatchExplanation):Void {
#if hl
	flight._hl._fn.Command.freeCommandDispatchExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Command.freeCommandDispatchExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Command.freeCommandDispatchExplanation(ptr);
#else
	#error "flight.Command: no backend for this target."
#end
}
#end
