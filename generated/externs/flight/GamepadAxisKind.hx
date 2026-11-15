package flight;

abstract GamepadAxisKind(Int) from Int to Int {
	public static inline var StickLeftX:GamepadAxisKind = 0;
	public static inline var StickLeftY:GamepadAxisKind = 1;
	public static inline var StickRightX:GamepadAxisKind = 2;
	public static inline var StickRightY:GamepadAxisKind = 3;
}
