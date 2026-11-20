package flight;

abstract SocketSendFailureReason(Int) from Int to Int {
	public static inline var Disposed:SocketSendFailureReason = 0;
	public static inline var NoConnection:SocketSendFailureReason = 1;
	public static inline var NotOpen:SocketSendFailureReason = 2;
}
