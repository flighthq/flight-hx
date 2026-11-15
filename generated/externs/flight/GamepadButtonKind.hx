package flight;

abstract GamepadButtonKind(Int) from Int to Int {
	public static inline var ButtonEast:GamepadButtonKind = 0;
	public static inline var ButtonNorth:GamepadButtonKind = 1;
	public static inline var ButtonSouth:GamepadButtonKind = 2;
	public static inline var ButtonWest:GamepadButtonKind = 3;
	public static inline var DpadDown:GamepadButtonKind = 4;
	public static inline var DpadLeft:GamepadButtonKind = 5;
	public static inline var DpadRight:GamepadButtonKind = 6;
	public static inline var DpadUp:GamepadButtonKind = 7;
	public static inline var Home:GamepadButtonKind = 8;
	public static inline var Select:GamepadButtonKind = 9;
	public static inline var ShoulderLeft:GamepadButtonKind = 10;
	public static inline var ShoulderRight:GamepadButtonKind = 11;
	public static inline var Start:GamepadButtonKind = 12;
	public static inline var StickLeft:GamepadButtonKind = 13;
	public static inline var StickRight:GamepadButtonKind = 14;
	public static inline var Touchpad:GamepadButtonKind = 15;
	public static inline var TriggerLeft:GamepadButtonKind = 16;
	public static inline var TriggerRight:GamepadButtonKind = 17;
}
