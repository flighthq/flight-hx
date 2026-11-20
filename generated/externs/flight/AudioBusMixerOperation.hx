package flight;

abstract AudioBusMixerOperation(Int) from Int to Int {
	public static inline var Gain:AudioBusMixerOperation = 0;
	public static inline var Mute:AudioBusMixerOperation = 1;
	public static inline var Pan:AudioBusMixerOperation = 2;
}
