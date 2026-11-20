package flight._cpp._fn;

extern class Keyboard {
	@:native("flight_create_soft_keyboard")
	public static function createSoftKeyboard():flight._cpp.SoftKeyboard;
	@:native("flight_detach_soft_keyboard")
	public static function detachSoftKeyboard(keyboard:flight._cpp.SoftKeyboard):Void;
	@:native("flight_dispose_soft_keyboard")
	public static function disposeSoftKeyboard(keyboard:flight._cpp.SoftKeyboard):Void;
	@:native("flight_get_soft_keyboard_height")
	public static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight._cpp.HostSoftKeyboardInfoCapability):Single;
	@:native("flight_get_soft_keyboard_info")
	public static function getSoftKeyboardInfo(out:flight._cpp.SoftKeyboardInfo, hostSoftKeyboardInfo:flight._cpp.HostSoftKeyboardInfoCapability):Void;
	@:native("flight_is_soft_keyboard_visible")
	public static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight._cpp.HostSoftKeyboardInfoCapability):Bool;
	@:native("flight_free_soft_keyboard")
	public static function freeSoftKeyboard(ptr:flight._cpp.SoftKeyboard):Void;
}
