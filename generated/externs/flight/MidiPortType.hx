package flight;

abstract MidiPortType(Int) from Int to Int {
	public static inline var Input:MidiPortType = 0;
	public static inline var Output:MidiPortType = 1;
}
