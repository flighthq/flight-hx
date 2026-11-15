package flight;

abstract SpritesheetValidationSeverity(Int) from Int to Int {
	public static inline var Error:SpritesheetValidationSeverity = 0;
	public static inline var Warning:SpritesheetValidationSeverity = 1;
}
