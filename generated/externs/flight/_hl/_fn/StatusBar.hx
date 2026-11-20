package flight._hl._fn;

extern class StatusBar {
	@:hlNative("flight", "flight_create_status_bar")
	public static function createStatusBar():flight._hl.StatusBar;
	@:hlNative("flight", "flight_attach_status_bar")
	public static function attachStatusBar(hostStatusBarChange:flight._hl.HostStatusBarChangeCapability, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability, bar:flight._hl.StatusBar):Void;
	@:hlNative("flight", "flight_clear_status_bar_style_stack")
	public static function clearStatusBarStyleStack(stacks:flight._hl.StatusBarStyleStacks, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability):Void;
	@:hlNative("flight", "flight_detach_status_bar")
	public static function detachStatusBar(bar:flight._hl.StatusBar):Void;
	@:hlNative("flight", "flight_dispose_status_bar")
	public static function disposeStatusBar(bar:flight._hl.StatusBar):Void;
	@:hlNative("flight", "flight_get_status_bar_height")
	public static function getStatusBarHeight(hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability):Single;
	@:hlNative("flight", "flight_get_status_bar_info")
	public static function getStatusBarInfo(out:flight._hl.StatusBarInfo, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability):Void;
	@:hlNative("flight", "flight_has_status_bar_style_entry")
	public static function hasStatusBarStyleEntry(stacks:flight._hl.StatusBarStyleStacks, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability, handle:flight._hl.StatusBarStyleEntryHandle):Bool;
	@:hlNative("flight", "flight_pop_status_bar_style_entry")
	public static function popStatusBarStyleEntry(stacks:flight._hl.StatusBarStyleStacks, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability, handle:flight._hl.StatusBarStyleEntryHandle):Void;
	@:hlNative("flight", "flight_push_status_bar_style_entry")
	public static function pushStatusBarStyleEntry(stacks:flight._hl.StatusBarStyleStacks, hostStatusBarColor:flight._hl.HostStatusBarColorCapability, hostStatusBarInfo:flight._hl.HostStatusBarInfoCapability, hostStatusBarOverlays:flight._hl.HostStatusBarOverlaysCapability, hostStatusBarStyle:flight._hl.HostStatusBarStyleCapability, hostStatusBarVisibility:flight._hl.HostStatusBarVisibilityCapability, entry:flight._hl.StatusBarStyleEntry):flight._hl.StatusBarStyleEntryHandle;
	@:hlNative("flight", "flight_set_status_bar_color")
	public static function setStatusBarColor(hostStatusBarColor:flight._hl.HostStatusBarColorCapability, color:Int, animated:Int):Void;
	@:hlNative("flight", "flight_set_status_bar_overlays_content")
	public static function setStatusBarOverlaysContent(hostStatusBarOverlays:flight._hl.HostStatusBarOverlaysCapability, overlay:Bool):Void;
	@:hlNative("flight", "flight_set_status_bar_style")
	public static function setStatusBarStyle(hostStatusBarStyle:flight._hl.HostStatusBarStyleCapability, style:Int):Void;
	@:hlNative("flight", "flight_set_status_bar_visible")
	public static function setStatusBarVisible(hostStatusBarVisibility:flight._hl.HostStatusBarVisibilityCapability, visible:Bool, animation:Int):Void;
	@:hlNative("flight", "flight_free_status_bar")
	public static function freeStatusBar(ptr:flight._hl.StatusBar):Void;
	@:hlNative("flight", "flight_free_status_bar_style_entry_handle")
	public static function freeStatusBarStyleEntryHandle(ptr:flight._hl.StatusBarStyleEntryHandle):Void;
}
