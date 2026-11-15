package flight;

abstract CollatorSensitivity(Int) from Int to Int {
	public static inline var Base:CollatorSensitivity = 0;
	public static inline var Accent:CollatorSensitivity = 1;
	public static inline var Case:CollatorSensitivity = 2;
	public static inline var Variant:CollatorSensitivity = 3;
}
