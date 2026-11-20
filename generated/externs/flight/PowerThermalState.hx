package flight;

abstract PowerThermalState(Int) from Int to Int {
	public static inline var Nominal:PowerThermalState = 0;
	public static inline var Fair:PowerThermalState = 1;
	public static inline var Serious:PowerThermalState = 2;
	public static inline var Critical:PowerThermalState = 3;
	public static inline var Unknown:PowerThermalState = 4;
}
