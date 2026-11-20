package flight._js._fn;

@:jsRequire("@flighthq/socket")
extern class Socket {
	@:native("areSocketGuardsEnabled")
	public static function areSocketGuardsEnabled(guardState:Dynamic):Bool;
	@:native("disableSocketGuards")
	public static function disableSocketGuards(guardState:Dynamic):Void;
	@:native("enableSocketGuards")
	public static function enableSocketGuards(guardState:Dynamic, logState:Dynamic, clock:Dynamic):Void;
	@:native("explainSocketSendFailure")
	public static function explainSocketSendFailure(socket:Dynamic):Null<flight._js.SocketSendFailureExplanation>;
	@:native("createSocket")
	public static function createSocket(guardState:Dynamic, hostSocket:Null<flight._js.HostSocketCapability>, options:flight._js.SocketOptions):Dynamic;
	@:native("attachSocket")
	public static function attachSocket(socket:Dynamic):Void;
	@:native("closeSocket")
	public static function closeSocket(guardState:Dynamic, socket:Dynamic, code:Null<Int>, reason:Null<String>):Void;
	@:native("detachSocket")
	public static function detachSocket(socket:Dynamic):Void;
	@:native("disposeSocket")
	public static function disposeSocket(socket:Dynamic):Void;
	@:native("enableSocketSignals")
	public static function enableSocketSignals(guardState:Dynamic, socket:Dynamic):Dynamic;
	@:native("getSocketReadyState")
	public static function getSocketReadyState(socket:Dynamic):Dynamic;
	@:native("openTcpSocket")
	public static function openTcpSocket(hostSocket:Null<flight._js.HostSocketCapability>, options:flight._js.TcpSocketOptions):Null<flight._js.TcpSocketConnection>;
	@:native("sendSocketMessage")
	public static function sendSocketMessage(guardState:Dynamic, socket:Dynamic, data:flight._js.SocketMessageData):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSocketSendFailureExplanation(ptr:flight._js.SocketSendFailureExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSocketRef(ptr:flight._js.Socket):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSocketSignalsRef(ptr:flight._js.SocketSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTcpSocketConnection(ptr:flight._js.TcpSocketConnection):Void {}
}
