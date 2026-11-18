package flight;

abstract TextJustification(Int) from Int to Int {
	public static inline var InterCharacter:TextJustification = 0;
	public static inline var InterWord:TextJustification = 1;
	public static inline var None:TextJustification = 2;
}
