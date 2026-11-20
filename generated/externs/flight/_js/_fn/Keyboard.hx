package flight._js._fn;

@:jsRequire("@flighthq/keyboard")
extern class Keyboard {
	@:native("createSoftKeyboard")
	public static function createSoftKeyboard():flight._js.SoftKeyboard;
	@:native("detachSoftKeyboard")
	public static function detachSoftKeyboard(keyboard:flight._js.SoftKeyboard):Void;
	@:native("disposeSoftKeyboard")
	public static function disposeSoftKeyboard(keyboard:flight._js.SoftKeyboard):Void;
	@:native("getSoftKeyboardHeight")
	public static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight._js.HostSoftKeyboardInfoCapability):Float;
	@:native("getSoftKeyboardInfo")
	public static function getSoftKeyboardInfo(out:flight._js.SoftKeyboardInfo, hostSoftKeyboardInfo:flight._js.HostSoftKeyboardInfoCapability):Void;
	@:native("isSoftKeyboardVisible")
	public static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight._js.HostSoftKeyboardInfoCapability):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSoftKeyboard(ptr:flight._js.SoftKeyboard):Void {}
}
