package flight._hl._fn;

extern class Socket {
	@:hlNative("flight", "flight_are_socket_guards_enabled")
	public static function areSocketGuardsEnabled(guardState:hl.Bytes):Bool;
	@:hlNative("flight", "flight_disable_socket_guards")
	public static function disableSocketGuards(guardState:hl.Bytes):Void;
	@:hlNative("flight", "flight_explain_socket_send_failure")
	public static function explainSocketSendFailure(socket:hl.Bytes):flight._hl.SocketSendFailureExplanation;
	@:hlNative("flight", "flight_create_socket")
	public static function createSocket(guardState:hl.Bytes, hostSocket:flight._hl.HostSocketCapability, options:flight._hl.SocketOptions):hl.Bytes;
	@:hlNative("flight", "flight_attach_socket")
	public static function attachSocket(socket:hl.Bytes):Void;
	@:hlNative("flight", "flight_close_socket")
	public static function closeSocket(guardState:hl.Bytes, socket:hl.Bytes, code:Int, reason:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_socket")
	public static function detachSocket(socket:hl.Bytes):Void;
	@:hlNative("flight", "flight_dispose_socket")
	public static function disposeSocket(socket:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_socket_signals")
	public static function enableSocketSignals(guardState:hl.Bytes, socket:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_socket_ready_state")
	public static function getSocketReadyState(socket:hl.Bytes):Int;
	@:hlNative("flight", "flight_open_tcp_socket")
	public static function openTcpSocket(hostSocket:flight._hl.HostSocketCapability, options:flight._hl.TcpSocketOptions):flight._hl.TcpSocketConnection;
	@:hlNative("flight", "flight_send_socket_message")
	public static function sendSocketMessage(guardState:hl.Bytes, socket:hl.Bytes, data:flight._hl.SocketMessageData):Bool;
	@:hlNative("flight", "flight_free_socket_send_failure_explanation")
	public static function freeSocketSendFailureExplanation(ptr:flight._hl.SocketSendFailureExplanation):Void;
	@:hlNative("flight", "flight_free_socket_ref")
	public static function freeSocketRef(ptr:flight._hl.Socket):Void;
	@:hlNative("flight", "flight_free_socket_signals_ref")
	public static function freeSocketSignalsRef(ptr:flight._hl.SocketSignals):Void;
	@:hlNative("flight", "flight_free_tcp_socket_connection")
	public static function freeTcpSocketConnection(ptr:flight._hl.TcpSocketConnection):Void;
}
