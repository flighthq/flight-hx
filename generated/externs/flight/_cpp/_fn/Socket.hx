package flight._cpp._fn;

extern class Socket {
	@:native("flight_are_socket_guards_enabled")
	public static function areSocketGuardsEnabled(guardState:cpp.Star<cpp.Void>):Bool;
	@:native("flight_disable_socket_guards")
	public static function disableSocketGuards(guardState:cpp.Star<cpp.Void>):Void;
	@:native("flight_explain_socket_send_failure")
	public static function explainSocketSendFailure(socket:cpp.Star<cpp.Void>):flight._cpp.SocketSendFailureExplanation;
	@:native("flight_create_socket")
	public static function createSocket(guardState:cpp.Star<cpp.Void>, hostSocket:flight._cpp.HostSocketCapability, options:flight._cpp.SocketOptions):cpp.Star<cpp.Void>;
	@:native("flight_attach_socket")
	public static function attachSocket(socket:cpp.Star<cpp.Void>):Void;
	@:native("flight_close_socket")
	public static function closeSocket(guardState:cpp.Star<cpp.Void>, socket:cpp.Star<cpp.Void>, code:Int, reason:cpp.ConstCharStar):Void;
	@:native("flight_detach_socket")
	public static function detachSocket(socket:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispose_socket")
	public static function disposeSocket(socket:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_socket_signals")
	public static function enableSocketSignals(guardState:cpp.Star<cpp.Void>, socket:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_socket_ready_state")
	public static function getSocketReadyState(socket:cpp.Star<cpp.Void>):Int;
	@:native("flight_open_tcp_socket")
	public static function openTcpSocket(hostSocket:flight._cpp.HostSocketCapability, options:flight._cpp.TcpSocketOptions):flight._cpp.TcpSocketConnection;
	@:native("flight_send_socket_message")
	public static function sendSocketMessage(guardState:cpp.Star<cpp.Void>, socket:cpp.Star<cpp.Void>, data:flight._cpp.SocketMessageData):Bool;
	@:native("flight_free_socket_send_failure_explanation")
	public static function freeSocketSendFailureExplanation(ptr:flight._cpp.SocketSendFailureExplanation):Void;
	@:native("flight_free_socket_ref")
	public static function freeSocketRef(ptr:flight._cpp.Socket):Void;
	@:native("flight_free_socket_signals_ref")
	public static function freeSocketSignalsRef(ptr:flight._cpp.SocketSignals):Void;
	@:native("flight_free_tcp_socket_connection")
	public static function freeTcpSocketConnection(ptr:flight._cpp.TcpSocketConnection):Void;
}
