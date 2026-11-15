package flight;

abstract LightUnit(Int) from Int to Int {
	public static inline var Candela:LightUnit = 0;
	public static inline var Lumen:LightUnit = 1;
	public static inline var Lux:LightUnit = 2;
	public static inline var Unitless:LightUnit = 3;
}
