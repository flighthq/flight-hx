package flight.esm.socket;

#if (js && flight_esm)
@:jsRequire("@flighthq/socket/contract")
extern class Contract {
  public static function areSocketGuardsEnabled():Bool;
  public static function attachSocket(socket:flight.esm.types.socket.Types.Socket):Void;
  public static function closeSocket(socket:flight.esm.types.socket.Types.Socket, ?code:Null<Float>, ?reason:Null<String>):Void;
  public static function createSocket(hostSocket:flight.esm.types.socket.Types.HostSocketCapability, options:flight.esm.types.socket.Types.SocketOptions):flight.esm.types.socket.Types.Socket;
  public static function detachSocket(socket:flight.esm.types.socket.Types.Socket):Void;
  public static function disableSocketGuards():Void;
  public static function disposeSocket(socket:flight.esm.types.socket.Types.Socket):Void;
  public static function enableSocketGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function enableSocketSignals(socket:flight.esm.types.socket.Types.Socket):flight.esm.types.socket.Types.SocketSignals;
  public static function explainSocketSendFailure(socket:flight.esm.types.socket.Types.Socket):Dynamic;
  public static function getSocketReadyState(socket:flight.esm.types.socket.Types.Socket):flight.esm.types.socket.Types.SocketReadyState;
  public static function openTcpSocket(hostSocket:flight.esm.types.socket.Types.HostSocketCapability, options:flight.esm.types.socket.Types.TcpSocketOptions):Null<flight.esm.types.socket.Types.TcpSocketConnection>;
  public static function sendSocketMessage(socket:flight.esm.types.socket.Types.Socket, data:Dynamic):Bool;
  public static function setSocketGuard(guard:Null<flight.esm.types.socket.Types.SocketGuard>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
