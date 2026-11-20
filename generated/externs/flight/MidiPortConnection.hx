package flight;

abstract MidiPortConnection(Int) from Int to Int {
	public static inline var Closed:MidiPortConnection = 0;
	public static inline var Open:MidiPortConnection = 1;
	public static inline var Pending:MidiPortConnection = 2;
}
