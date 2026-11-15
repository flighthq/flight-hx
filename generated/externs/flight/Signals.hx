package flight;

inline function disconnectSignalConnection(connection:SignalConnection):Void {
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
inline function isSignalConnectionConnected(connection:SignalConnection):Bool {
#if hl
	return flight._hl._fn.Signals.isSignalConnectionConnected(connection);
#elseif cpp
	return flight._cpp._fn.Signals.isSignalConnectionConnected(connection);
#elseif (js && flight_esm)
	return flight._js._fn.Signals.isSignalConnectionConnected(connection);
#else
	#error "flight.Signals: no backend for this target."
#end
}
inline function isSignalConnectionPaused(connection:SignalConnection):Bool {
#if hl
	return flight._hl._fn.Signals.isSignalConnectionPaused(connection);
#elseif cpp
	return flight._cpp._fn.Signals.isSignalConnectionPaused(connection);
#elseif (js && flight_esm)
	return flight._js._fn.Signals.isSignalConnectionPaused(connection);
#else
	#error "flight.Signals: no backend for this target."
#end
}
inline function pauseSignalConnection(connection:SignalConnection):Void {
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
inline function resumeSignalConnection(connection:SignalConnection):Void {
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
inline function createSignalScope():SignalScope {
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
inline function disconnectSignalScope(scope:SignalScope):Void {
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
inline function createSignalTimerState():SignalTimerState {
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
inline function advanceSignalTimers(state:Dynamic, nowMs:Float):Void {
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
inline function clearSignalTimeout(state:Dynamic, id:TimerId):Void {
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
inline function setSignalTimeout(state:Dynamic, delayMs:Float, callback_Fn:Dynamic, callback_Ctx:Dynamic):TimerId {
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
inline function freeSignalScope(ptr:SignalScope):Void {
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
inline function freeSignalTimerState(ptr:SignalTimerState):Void {
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
inline function freeTimerId(ptr:TimerId):Void {
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
