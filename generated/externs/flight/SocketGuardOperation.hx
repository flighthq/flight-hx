package flight;

abstract SocketGuardOperation(Int) from Int to Int {
	public static inline var CreateSocket:SocketGuardOperation = 0;
	public static inline var CloseSocket:SocketGuardOperation = 1;
	public static inline var EnableSocketSignals:SocketGuardOperation = 2;
	public static inline var SendSocketMessage:SocketGuardOperation = 3;
}
