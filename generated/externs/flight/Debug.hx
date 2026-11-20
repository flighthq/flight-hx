package flight;

#if (js && flight_esm)
extern inline function createDebugState():DebugState {
	return flight._js._fn.Debug.createDebugState();
}
#else
extern inline function createDebugState():DebugState {
#if hl
	return flight._hl._fn.Debug.createDebugState();
#elseif cpp
	return flight._cpp._fn.Debug.createDebugState();
#elseif (js && flight_esm)
	return flight._js._fn.Debug.createDebugState();
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableDebug(state:Dynamic, logState:Dynamic):Void {
	flight._js._fn.Debug.disableDebug(state, logState);
}
#else
extern inline function disableDebug(state:Dynamic, logState:Dynamic):Void {
#if hl
	flight._hl._fn.Debug.disableDebug(state, logState);
#elseif cpp
	flight._cpp._fn.Debug.disableDebug(state, logState);
#elseif (js && flight_esm)
	flight._js._fn.Debug.disableDebug(state, logState);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableDebug(state:Dynamic, logState:Dynamic, options:Null<DebugOptions>):Void {
	flight._js._fn.Debug.enableDebug(state, logState, options);
}
#else
extern inline function enableDebug(state:Dynamic, logState:Dynamic, options:DebugOptions):Void {
#if hl
	flight._hl._fn.Debug.enableDebug(state, logState, options);
#elseif cpp
	flight._cpp._fn.Debug.enableDebug(state, logState, options);
#elseif (js && flight_esm)
	flight._js._fn.Debug.enableDebug(state, logState, options);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isDebugEnabled(state:Dynamic):Bool {
	return flight._js._fn.Debug.isDebugEnabled(state);
}
#else
extern inline function isDebugEnabled(state:Dynamic):Bool {
#if hl
	return flight._hl._fn.Debug.isDebugEnabled(state);
#elseif cpp
	return flight._cpp._fn.Debug.isDebugEnabled(state);
#elseif (js && flight_esm)
	return flight._js._fn.Debug.isDebugEnabled(state);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerDebugSubsystem(state:Dynamic, name:String, hooks:DebugSubsystemHooks):Void {
	flight._js._fn.Debug.registerDebugSubsystem(state, name, hooks);
}
#else
extern inline function registerDebugSubsystem(state:Dynamic, name:String, hooks:DebugSubsystemHooks):Void {
#if hl
	flight._hl._fn.Debug.registerDebugSubsystem(state, cast name, hooks);
#elseif cpp
	flight._cpp._fn.Debug.registerDebugSubsystem(state, cast name, hooks);
#elseif (js && flight_esm)
	flight._js._fn.Debug.registerDebugSubsystem(state, name, hooks);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterDebugSubsystem(state:Dynamic, name:String):Bool {
	return flight._js._fn.Debug.unregisterDebugSubsystem(state, name);
}
#else
extern inline function unregisterDebugSubsystem(state:Dynamic, name:String):Bool {
#if hl
	return flight._hl._fn.Debug.unregisterDebugSubsystem(state, cast name);
#elseif cpp
	return flight._cpp._fn.Debug.unregisterDebugSubsystem(state, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Debug.unregisterDebugSubsystem(state, name);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function beginDebugSpan(state:Dynamic, nowMs:Float, name:String, channel:Null<String>):Null<LogTimer> {
	return flight._js._fn.Debug.beginDebugSpan(state, nowMs, name, channel);
}
#else
extern inline function beginDebugSpan(state:Dynamic, nowMs:Float, name:String, channel:String):LogTimer {
#if hl
	return flight._hl._fn.Debug.beginDebugSpan(state, nowMs, cast name, cast channel);
#elseif cpp
	return flight._cpp._fn.Debug.beginDebugSpan(state, nowMs, cast name, cast channel);
#elseif (js && flight_esm)
	return flight._js._fn.Debug.beginDebugSpan(state, nowMs, name, channel);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function endDebugSpan(logState:Dynamic, nowMs:Float, timer:Null<LogTimer>):Float {
	return flight._js._fn.Debug.endDebugSpan(logState, nowMs, timer);
}
#else
extern inline function endDebugSpan(logState:Dynamic, nowMs:Float, timer:LogTimer):Float {
#if hl
	return flight._hl._fn.Debug.endDebugSpan(logState, nowMs, timer);
#elseif cpp
	return flight._cpp._fn.Debug.endDebugSpan(logState, nowMs, timer);
#elseif (js && flight_esm)
	return flight._js._fn.Debug.endDebugSpan(logState, nowMs, timer);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function markDebugFrame(state:Dynamic, logState:Dynamic, nowMs:Float, label:Null<String>, channel:Null<String>):Void {
	flight._js._fn.Debug.markDebugFrame(state, logState, nowMs, label, channel);
}
#else
extern inline function markDebugFrame(state:Dynamic, logState:Dynamic, nowMs:Float, label:String, channel:String):Void {
#if hl
	flight._hl._fn.Debug.markDebugFrame(state, logState, nowMs, cast label, cast channel);
#elseif cpp
	flight._cpp._fn.Debug.markDebugFrame(state, logState, nowMs, cast label, cast channel);
#elseif (js && flight_esm)
	flight._js._fn.Debug.markDebugFrame(state, logState, nowMs, label, channel);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDebugState(ptr:DebugState):Void {
	flight._js._fn.Debug.freeDebugState(ptr);
}
#else
extern inline function freeDebugState(ptr:DebugState):Void {
#if hl
	flight._hl._fn.Debug.freeDebugState(ptr);
#elseif cpp
	flight._cpp._fn.Debug.freeDebugState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Debug.freeDebugState(ptr);
#else
	#error "flight.Debug: no backend for this target."
#end
}
#end
