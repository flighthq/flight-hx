package flight.esm.types.socket_contract;

#if (js && flight_esm)
typedef HostSocketCapabilities = flight.esm.types.socket.Types.HostSocketCapabilities;

typedef HostSocketCapability = flight.esm.types.socket.Types.HostSocketCapability;

typedef Socket = flight.esm.types.socket.Types.Socket;

typedef SocketCloseInfo = flight.esm.types.socket.Types.SocketCloseInfo;

typedef SocketConnection = flight.esm.types.socket.Types.SocketConnection;

typedef SocketEventSink = flight.esm.types.socket.Types.SocketEventSink;

typedef SocketGuard = flight.esm.types.socket.Types.SocketGuard;

typedef SocketGuardNotice = flight.esm.types.socket.Types.SocketGuardNotice;

typedef SocketMessage = flight.esm.types.socket.Types.SocketMessage;

typedef SocketOptions = flight.esm.types.socket.Types.SocketOptions;

typedef SocketReadyState = flight.esm.types.socket.Types.SocketReadyState;

typedef SocketRuntime = flight.esm.types.socket.Types.SocketRuntime;

typedef SocketSendFailureExplanation = flight.esm.types.socket.Types.SocketSendFailureExplanation;

typedef SocketSignals = flight.esm.types.socket.Types.SocketSignals;

typedef TcpSocketConnection = flight.esm.types.socket.Types.TcpSocketConnection;

typedef TcpSocketOptions = flight.esm.types.socket.Types.TcpSocketOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
