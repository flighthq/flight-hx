package flight;

abstract GamepadMapping(Int) from Int to Int {
	public static inline var Standard:GamepadMapping = 0;
	public static inline var Raw:GamepadMapping = 1;
	public static inline var Unspecified:GamepadMapping = 2;
}
