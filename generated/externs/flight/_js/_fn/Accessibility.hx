package flight._js._fn;

@:jsRequire("@flighthq/accessibility")
extern class Accessibility {
	@:native("destroyAccessibility")
	public static function destroyAccessibility(hostAccessibility:flight._js.HostAccessibilityCapability):Void;
}
