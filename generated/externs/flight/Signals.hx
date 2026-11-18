package flight;

#if (js && flight_esm)
extern inline function disconnectSignalConnection(connection:SignalConnection):Void {
	flight._js._fn.Signals.disconnectSignalConnection(connection);
}
#else
extern inline function disconnectSignalConnection(connection:SignalConnection):Void {
#if hl
	flight._hl._fn.Signals.disconnectSignalConnection(connection);
#elseif cpp
	flight._cpp._fn.Signals.disconnectSignalConnection(connection);
#elseif (js && flight_esm)
	flight._js._fn.Signals.disconnectSignalConnection(connection);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pauseSignalConnection(connection:SignalConnection):Void {
	flight._js._fn.Signals.pauseSignalConnection(connection);
}
#else
extern inline function pauseSignalConnection(connection:SignalConnection):Void {
#if hl
	flight._hl._fn.Signals.pauseSignalConnection(connection);
#elseif cpp
	flight._cpp._fn.Signals.pauseSignalConnection(connection);
#elseif (js && flight_esm)
	flight._js._fn.Signals.pauseSignalConnection(connection);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resumeSignalConnection(connection:SignalConnection):Void {
	flight._js._fn.Signals.resumeSignalConnection(connection);
}
#else
extern inline function resumeSignalConnection(connection:SignalConnection):Void {
#if hl
	flight._hl._fn.Signals.resumeSignalConnection(connection);
#elseif cpp
	flight._cpp._fn.Signals.resumeSignalConnection(connection);
#elseif (js && flight_esm)
	flight._js._fn.Signals.resumeSignalConnection(connection);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSignalScope():SignalScope {
	return flight._js._fn.Signals.createSignalScope();
}
#else
extern inline function createSignalScope():SignalScope {
#if hl
	return flight._hl._fn.Signals.createSignalScope();
#elseif cpp
	return flight._cpp._fn.Signals.createSignalScope();
#elseif (js && flight_esm)
	return flight._js._fn.Signals.createSignalScope();
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disconnectSignalScope(scope:SignalScope):Void {
	flight._js._fn.Signals.disconnectSignalScope(scope);
}
#else
extern inline function disconnectSignalScope(scope:SignalScope):Void {
#if hl
	flight._hl._fn.Signals.disconnectSignalScope(scope);
#elseif cpp
	flight._cpp._fn.Signals.disconnectSignalScope(scope);
#elseif (js && flight_esm)
	flight._js._fn.Signals.disconnectSignalScope(scope);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSignalTimerState():SignalTimerState {
	return flight._js._fn.Signals.createSignalTimerState();
}
#else
extern inline function createSignalTimerState():SignalTimerState {
#if hl
	return flight._hl._fn.Signals.createSignalTimerState();
#elseif cpp
	return flight._cpp._fn.Signals.createSignalTimerState();
#elseif (js && flight_esm)
	return flight._js._fn.Signals.createSignalTimerState();
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function advanceSignalTimers(state:Dynamic, nowMs:Float):Void {
	flight._js._fn.Signals.advanceSignalTimers(state, nowMs);
}
#else
extern inline function advanceSignalTimers(state:Dynamic, nowMs:Float):Void {
#if hl
	flight._hl._fn.Signals.advanceSignalTimers(state, nowMs);
#elseif cpp
	flight._cpp._fn.Signals.advanceSignalTimers(state, nowMs);
#elseif (js && flight_esm)
	flight._js._fn.Signals.advanceSignalTimers(state, nowMs);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearSignalTimeout(state:Dynamic, id:TimerId):Void {
	flight._js._fn.Signals.clearSignalTimeout(state, id);
}
#else
extern inline function clearSignalTimeout(state:Dynamic, id:TimerId):Void {
#if hl
	flight._hl._fn.Signals.clearSignalTimeout(state, id);
#elseif cpp
	flight._cpp._fn.Signals.clearSignalTimeout(state, id);
#elseif (js && flight_esm)
	flight._js._fn.Signals.clearSignalTimeout(state, id);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setSignalTimeout(state:Dynamic, delayMs:Float, callback_:Dynamic):TimerId {
	return flight._js._fn.Signals.setSignalTimeout(state, delayMs, callback_);
}
#else
extern inline function setSignalTimeout(state:Dynamic, delayMs:Float, callback_Fn:Dynamic, callback_Ctx:Dynamic):TimerId {
#if hl
	return flight._hl._fn.Signals.setSignalTimeout(state, delayMs, callback_Fn, callback_Ctx);
#elseif cpp
	return flight._cpp._fn.Signals.setSignalTimeout(state, delayMs, callback_Fn, callback_Ctx);
#elseif (js && flight_esm)
	return flight._js._fn.Signals.setSignalTimeout(state, delayMs, callback_Fn, callback_Ctx);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSignalScope(ptr:SignalScope):Void {
	flight._js._fn.Signals.freeSignalScope(ptr);
}
#else
extern inline function freeSignalScope(ptr:SignalScope):Void {
#if hl
	flight._hl._fn.Signals.freeSignalScope(ptr);
#elseif cpp
	flight._cpp._fn.Signals.freeSignalScope(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Signals.freeSignalScope(ptr);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSignalTimerState(ptr:SignalTimerState):Void {
	flight._js._fn.Signals.freeSignalTimerState(ptr);
}
#else
extern inline function freeSignalTimerState(ptr:SignalTimerState):Void {
#if hl
	flight._hl._fn.Signals.freeSignalTimerState(ptr);
#elseif cpp
	flight._cpp._fn.Signals.freeSignalTimerState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Signals.freeSignalTimerState(ptr);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTimerId(ptr:TimerId):Void {
	flight._js._fn.Signals.freeTimerId(ptr);
}
#else
extern inline function freeTimerId(ptr:TimerId):Void {
#if hl
	flight._hl._fn.Signals.freeTimerId(ptr);
#elseif cpp
	flight._cpp._fn.Signals.freeTimerId(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Signals.freeTimerId(ptr);
#else
	#error "flight.Signals: no backend for this target."
#end
}
#end
