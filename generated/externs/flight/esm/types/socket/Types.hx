package flight.esm.types.socket;

#if (js && flight_esm)
typedef HostSocketCapabilities = { ?connection:Null<flight.esm.types.socket.Types.HostSocketCapability> };

typedef HostSocketCapability = { openSocket:((options:flight.esm.types.socket.Types.SocketOptions, events:flight.esm.types.socket.Types.SocketEventSink) -> Null<flight.esm.types.socket.Types.SocketConnection>), ?openTcpSocket:Null<((options:flight.esm.types.socket.Types.TcpSocketOptions) -> Null<flight.esm.types.socket.Types.TcpSocketConnection>)> };

typedef Socket = { url:String, runtime:flight.esm.types.socket.Types.SocketRuntime };

typedef SocketCloseInfo = { code:Float, reason:String, wasClean:Bool };

typedef SocketConnection = { sendSocketFrame:((data:Dynamic) -> Bool), closeSocketConnection:((?code:Null<Float>, ?reason:Null<String>) -> Void) };

typedef SocketEventSink = { handleSocketOpen:(() -> Void), handleSocketMessage:((message:flight.esm.types.socket.Types.SocketMessage) -> Void), handleSocketClose:((info:flight.esm.types.socket.Types.SocketCloseInfo) -> Void), handleSocketError:(() -> Void) };

typedef SocketGuard = ((notice:flight.esm.types.socket.Types.SocketGuardNotice) -> Void);

typedef SocketGuardNotice = Dynamic;

typedef SocketMessage = { data:Dynamic, binary:Bool };

typedef SocketOptions = { url:String, ?protocols:Null<Array<String>>, ?binaryType:Null<String> };

typedef SocketReadyState = String;

typedef SocketRuntime = { connection:Null<flight.esm.types.socket.Types.SocketConnection>, signals:Null<flight.esm.types.socket.Types.SocketSignals>, readyState:flight.esm.types.socket.Types.SocketReadyState, delivering:Bool, disposed:Bool };

typedef SocketSendFailureExplanation = Dynamic;

typedef SocketSignals = { onSocketOpen:flight.esm.types.signals.Types.Signal<Void>, onSocketMessage:flight.esm.types.signals.Types.Signal<flight.esm.types.socket.Types.SocketMessage>, onSocketClose:flight.esm.types.signals.Types.Signal<flight.esm.types.socket.Types.SocketCloseInfo>, onSocketError:flight.esm.types.signals.Types.Signal<Void> };

typedef TcpSocketConnection = { readable:Dynamic, writable:Dynamic, closeTcpSocketConnection:(() -> Void) };

typedef TcpSocketOptions = { host:String, port:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
