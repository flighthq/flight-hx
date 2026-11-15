package flight;

abstract AudioChannelState(Int) from Int to Int {
	public static inline var Complete:AudioChannelState = 0;
	public static inline var Paused:AudioChannelState = 1;
	public static inline var Playing:AudioChannelState = 2;
	public static inline var Stopped:AudioChannelState = 3;
}
