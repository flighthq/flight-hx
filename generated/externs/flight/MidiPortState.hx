package flight;

abstract MidiPortState(Int) from Int to Int {
	public static inline var Connected:MidiPortState = 0;
	public static inline var Disconnected:MidiPortState = 1;
}
