package flight;

abstract ColorBlindType(Int) from Int to Int {
	public static inline var Protanopia:ColorBlindType = 0;
	public static inline var Protanomaly:ColorBlindType = 1;
	public static inline var Deuteranopia:ColorBlindType = 2;
	public static inline var Deuteranomaly:ColorBlindType = 3;
	public static inline var Tritanopia:ColorBlindType = 4;
	public static inline var Tritanomaly:ColorBlindType = 5;
	public static inline var Achromatopsia:ColorBlindType = 6;
	public static inline var Achromatomaly:ColorBlindType = 7;
}
