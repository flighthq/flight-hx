package flight;

abstract VideoChannelState(Int) from Int to Int {
	public static inline var Complete:VideoChannelState = 0;
	public static inline var Paused:VideoChannelState = 1;
	public static inline var Playing:VideoChannelState = 2;
	public static inline var Stopped:VideoChannelState = 3;
}
