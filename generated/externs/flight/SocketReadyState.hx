package flight;

abstract SocketReadyState(Int) from Int to Int {
	public static inline var Connecting:SocketReadyState = 0;
	public static inline var Open:SocketReadyState = 1;
	public static inline var Closing:SocketReadyState = 2;
	public static inline var Closed:SocketReadyState = 3;
}
