package flight._hl._fn;

extern class Keyboard {
	@:hlNative("flight", "flight_create_soft_keyboard")
	public static function createSoftKeyboard():flight._hl.SoftKeyboard;
	@:hlNative("flight", "flight_detach_soft_keyboard")
	public static function detachSoftKeyboard(keyboard:flight._hl.SoftKeyboard):Void;
	@:hlNative("flight", "flight_dispose_soft_keyboard")
	public static function disposeSoftKeyboard(keyboard:flight._hl.SoftKeyboard):Void;
	@:hlNative("flight", "flight_get_soft_keyboard_height")
	public static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight._hl.HostSoftKeyboardInfoCapability):Single;
	@:hlNative("flight", "flight_get_soft_keyboard_info")
	public static function getSoftKeyboardInfo(out:flight._hl.SoftKeyboardInfo, hostSoftKeyboardInfo:flight._hl.HostSoftKeyboardInfoCapability):Void;
	@:hlNative("flight", "flight_is_soft_keyboard_visible")
	public static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight._hl.HostSoftKeyboardInfoCapability):Bool;
	@:hlNative("flight", "flight_free_soft_keyboard")
	public static function freeSoftKeyboard(ptr:flight._hl.SoftKeyboard):Void;
}
