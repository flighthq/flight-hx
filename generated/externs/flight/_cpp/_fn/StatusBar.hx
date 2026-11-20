package flight._cpp._fn;

extern class StatusBar {
	@:native("flight_create_status_bar")
	public static function createStatusBar():flight._cpp.StatusBar;
	@:native("flight_attach_status_bar")
	public static function attachStatusBar(hostStatusBarChange:flight._cpp.HostStatusBarChangeCapability, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability, bar:flight._cpp.StatusBar):Void;
	@:native("flight_clear_status_bar_style_stack")
	public static function clearStatusBarStyleStack(stacks:flight._cpp.StatusBarStyleStacks, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability):Void;
	@:native("flight_detach_status_bar")
	public static function detachStatusBar(bar:flight._cpp.StatusBar):Void;
	@:native("flight_dispose_status_bar")
	public static function disposeStatusBar(bar:flight._cpp.StatusBar):Void;
	@:native("flight_get_status_bar_height")
	public static function getStatusBarHeight(hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability):Single;
	@:native("flight_get_status_bar_info")
	public static function getStatusBarInfo(out:flight._cpp.StatusBarInfo, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability):Void;
	@:native("flight_has_status_bar_style_entry")
	public static function hasStatusBarStyleEntry(stacks:flight._cpp.StatusBarStyleStacks, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability, handle:flight._cpp.StatusBarStyleEntryHandle):Bool;
	@:native("flight_pop_status_bar_style_entry")
	public static function popStatusBarStyleEntry(stacks:flight._cpp.StatusBarStyleStacks, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability, handle:flight._cpp.StatusBarStyleEntryHandle):Void;
	@:native("flight_push_status_bar_style_entry")
	public static function pushStatusBarStyleEntry(stacks:flight._cpp.StatusBarStyleStacks, hostStatusBarColor:flight._cpp.HostStatusBarColorCapability, hostStatusBarInfo:flight._cpp.HostStatusBarInfoCapability, hostStatusBarOverlays:flight._cpp.HostStatusBarOverlaysCapability, hostStatusBarStyle:flight._cpp.HostStatusBarStyleCapability, hostStatusBarVisibility:flight._cpp.HostStatusBarVisibilityCapability, entry:flight._cpp.StatusBarStyleEntry):flight._cpp.StatusBarStyleEntryHandle;
	@:native("flight_set_status_bar_color")
	public static function setStatusBarColor(hostStatusBarColor:flight._cpp.HostStatusBarColorCapability, color:Int, animated:Int):Void;
	@:native("flight_set_status_bar_overlays_content")
	public static function setStatusBarOverlaysContent(hostStatusBarOverlays:flight._cpp.HostStatusBarOverlaysCapability, overlay:Bool):Void;
	@:native("flight_set_status_bar_style")
	public static function setStatusBarStyle(hostStatusBarStyle:flight._cpp.HostStatusBarStyleCapability, style:Int):Void;
	@:native("flight_set_status_bar_visible")
	public static function setStatusBarVisible(hostStatusBarVisibility:flight._cpp.HostStatusBarVisibilityCapability, visible:Bool, animation:Int):Void;
	@:native("flight_free_status_bar")
	public static function freeStatusBar(ptr:flight._cpp.StatusBar):Void;
	@:native("flight_free_status_bar_style_entry_handle")
	public static function freeStatusBarStyleEntryHandle(ptr:flight._cpp.StatusBarStyleEntryHandle):Void;
}
