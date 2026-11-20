package flight;

abstract SocketGuardReason(Int) from Int to Int {
	public static inline var NoConnection:SocketGuardReason = 0;
	public static inline var Disposed:SocketGuardReason = 1;
}
