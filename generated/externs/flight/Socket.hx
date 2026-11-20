package flight;

#if hl

typedef Socket = flight._hl.Socket;

#elseif cpp

typedef Socket = flight._cpp.Socket;

#elseif (js && flight_esm)

typedef Socket = flight._js.Socket;

#elseif js

#error "flight.Socket on js requires flight_esm."

#else

#error "flight.Socket: no backend for this target."

#end

#if (js && flight_esm)
extern inline function areSocketGuardsEnabled(guardState:Dynamic):Bool {
	return flight._js._fn.Socket.areSocketGuardsEnabled(guardState);
}
#else
extern inline function areSocketGuardsEnabled(guardState:Dynamic):Bool {
#if hl
	return flight._hl._fn.Socket.areSocketGuardsEnabled(guardState);
#elseif cpp
	return flight._cpp._fn.Socket.areSocketGuardsEnabled(guardState);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.areSocketGuardsEnabled(guardState);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableSocketGuards(guardState:Dynamic):Void {
	flight._js._fn.Socket.disableSocketGuards(guardState);
}
#else
extern inline function disableSocketGuards(guardState:Dynamic):Void {
#if hl
	flight._hl._fn.Socket.disableSocketGuards(guardState);
#elseif cpp
	flight._cpp._fn.Socket.disableSocketGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.Socket.disableSocketGuards(guardState);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableSocketGuards(guardState:Dynamic, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Socket.enableSocketGuards(guardState, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function explainSocketSendFailure(socket:Dynamic):Null<SocketSendFailureExplanation> {
	return flight._js._fn.Socket.explainSocketSendFailure(socket);
}
#else
extern inline function explainSocketSendFailure(socket:Dynamic):SocketSendFailureExplanation {
#if hl
	return flight._hl._fn.Socket.explainSocketSendFailure(socket);
#elseif cpp
	return flight._cpp._fn.Socket.explainSocketSendFailure(socket);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.explainSocketSendFailure(socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSocket(guardState:Dynamic, hostSocket:Null<HostSocketCapability>, options:SocketOptions):Dynamic {
	return flight._js._fn.Socket.createSocket(guardState, hostSocket, options);
}
#else
extern inline function createSocket(guardState:Dynamic, hostSocket:HostSocketCapability, options:SocketOptions):Dynamic {
#if hl
	return flight._hl._fn.Socket.createSocket(guardState, hostSocket, options);
#elseif cpp
	return flight._cpp._fn.Socket.createSocket(guardState, hostSocket, options);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.createSocket(guardState, hostSocket, options);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachSocket(socket:Dynamic):Void {
	flight._js._fn.Socket.attachSocket(socket);
}
#else
extern inline function attachSocket(socket:Dynamic):Void {
#if hl
	flight._hl._fn.Socket.attachSocket(socket);
#elseif cpp
	flight._cpp._fn.Socket.attachSocket(socket);
#elseif (js && flight_esm)
	flight._js._fn.Socket.attachSocket(socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function closeSocket(guardState:Dynamic, socket:Dynamic, code:Null<Int>, reason:Null<String>):Void {
	flight._js._fn.Socket.closeSocket(guardState, socket, code, reason);
}
#else
extern inline function closeSocket(guardState:Dynamic, socket:Dynamic, code:Int, reason:String):Void {
#if hl
	flight._hl._fn.Socket.closeSocket(guardState, socket, code, cast reason);
#elseif cpp
	flight._cpp._fn.Socket.closeSocket(guardState, socket, code, cast reason);
#elseif (js && flight_esm)
	flight._js._fn.Socket.closeSocket(guardState, socket, code, reason);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachSocket(socket:Dynamic):Void {
	flight._js._fn.Socket.detachSocket(socket);
}
#else
extern inline function detachSocket(socket:Dynamic):Void {
#if hl
	flight._hl._fn.Socket.detachSocket(socket);
#elseif cpp
	flight._cpp._fn.Socket.detachSocket(socket);
#elseif (js && flight_esm)
	flight._js._fn.Socket.detachSocket(socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeSocket(socket:Dynamic):Void {
	flight._js._fn.Socket.disposeSocket(socket);
}
#else
extern inline function disposeSocket(socket:Dynamic):Void {
#if hl
	flight._hl._fn.Socket.disposeSocket(socket);
#elseif cpp
	flight._cpp._fn.Socket.disposeSocket(socket);
#elseif (js && flight_esm)
	flight._js._fn.Socket.disposeSocket(socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableSocketSignals(guardState:Dynamic, socket:Dynamic):Dynamic {
	return flight._js._fn.Socket.enableSocketSignals(guardState, socket);
}
#else
extern inline function enableSocketSignals(guardState:Dynamic, socket:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Socket.enableSocketSignals(guardState, socket);
#elseif cpp
	return flight._cpp._fn.Socket.enableSocketSignals(guardState, socket);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.enableSocketSignals(guardState, socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSocketReadyState(socket:Dynamic):Dynamic {
	return flight._js._fn.Socket.getSocketReadyState(socket);
}
#else
extern inline function getSocketReadyState(socket:Dynamic):flight.SocketReadyState {
#if hl
	return flight._hl._fn.Socket.getSocketReadyState(socket);
#elseif cpp
	return flight._cpp._fn.Socket.getSocketReadyState(socket);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.getSocketReadyState(socket);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function openTcpSocket(hostSocket:Null<HostSocketCapability>, options:TcpSocketOptions):Null<TcpSocketConnection> {
	return flight._js._fn.Socket.openTcpSocket(hostSocket, options);
}
#else
extern inline function openTcpSocket(hostSocket:HostSocketCapability, options:TcpSocketOptions):TcpSocketConnection {
#if hl
	return flight._hl._fn.Socket.openTcpSocket(hostSocket, options);
#elseif cpp
	return flight._cpp._fn.Socket.openTcpSocket(hostSocket, options);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.openTcpSocket(hostSocket, options);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sendSocketMessage(guardState:Dynamic, socket:Dynamic, data:SocketMessageData):Bool {
	return flight._js._fn.Socket.sendSocketMessage(guardState, socket, data);
}
#else
extern inline function sendSocketMessage(guardState:Dynamic, socket:Dynamic, data:SocketMessageData):Bool {
#if hl
	return flight._hl._fn.Socket.sendSocketMessage(guardState, socket, data);
#elseif cpp
	return flight._cpp._fn.Socket.sendSocketMessage(guardState, socket, data);
#elseif (js && flight_esm)
	return flight._js._fn.Socket.sendSocketMessage(guardState, socket, data);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSocketSendFailureExplanation(ptr:SocketSendFailureExplanation):Void {
	flight._js._fn.Socket.freeSocketSendFailureExplanation(ptr);
}
#else
extern inline function freeSocketSendFailureExplanation(ptr:SocketSendFailureExplanation):Void {
#if hl
	flight._hl._fn.Socket.freeSocketSendFailureExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Socket.freeSocketSendFailureExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Socket.freeSocketSendFailureExplanation(ptr);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSocketRef(ptr:Socket):Void {
	flight._js._fn.Socket.freeSocketRef(ptr);
}
#else
extern inline function freeSocketRef(ptr:Socket):Void {
#if hl
	flight._hl._fn.Socket.freeSocketRef(ptr);
#elseif cpp
	flight._cpp._fn.Socket.freeSocketRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Socket.freeSocketRef(ptr);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSocketSignalsRef(ptr:SocketSignals):Void {
	flight._js._fn.Socket.freeSocketSignalsRef(ptr);
}
#else
extern inline function freeSocketSignalsRef(ptr:SocketSignals):Void {
#if hl
	flight._hl._fn.Socket.freeSocketSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Socket.freeSocketSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Socket.freeSocketSignalsRef(ptr);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTcpSocketConnection(ptr:TcpSocketConnection):Void {
	flight._js._fn.Socket.freeTcpSocketConnection(ptr);
}
#else
extern inline function freeTcpSocketConnection(ptr:TcpSocketConnection):Void {
#if hl
	flight._hl._fn.Socket.freeTcpSocketConnection(ptr);
#elseif cpp
	flight._cpp._fn.Socket.freeTcpSocketConnection(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Socket.freeTcpSocketConnection(ptr);
#else
	#error "flight.Socket: no backend for this target."
#end
}
#end
