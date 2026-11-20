package flight;

abstract AcceleratorParseErrorReason(Int) from Int to Int {
	public static inline var DuplicateModifier:AcceleratorParseErrorReason = 0;
	public static inline var Empty:AcceleratorParseErrorReason = 1;
	public static inline var MissingKey:AcceleratorParseErrorReason = 2;
	public static inline var UnknownKey:AcceleratorParseErrorReason = 3;
	public static inline var UnknownModifier:AcceleratorParseErrorReason = 4;
}
