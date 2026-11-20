package flight._js._fn;

@:jsRequire("@flighthq/statusbar")
extern class StatusBar {
	@:native("createStatusBar")
	public static function createStatusBar():flight._js.StatusBar;
	@:native("attachStatusBar")
	public static function attachStatusBar(hostStatusBarChange:flight._js.HostStatusBarChangeCapability, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability, bar:flight._js.StatusBar):Void;
	@:native("clearStatusBarStyleStack")
	public static function clearStatusBarStyleStack(stacks:flight._js.StatusBarStyleStacks, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability):Void;
	@:native("detachStatusBar")
	public static function detachStatusBar(bar:flight._js.StatusBar):Void;
	@:native("disposeStatusBar")
	public static function disposeStatusBar(bar:flight._js.StatusBar):Void;
	@:native("getStatusBarHeight")
	public static function getStatusBarHeight(hostStatusBarInfo:flight._js.HostStatusBarInfoCapability):Float;
	@:native("getStatusBarInfo")
	public static function getStatusBarInfo(out:flight._js.StatusBarInfo, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability):Void;
	@:native("hasStatusBarStyleEntry")
	public static function hasStatusBarStyleEntry(stacks:flight._js.StatusBarStyleStacks, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability, handle:flight._js.StatusBarStyleEntryHandle):Bool;
	@:native("popStatusBarStyleEntry")
	public static function popStatusBarStyleEntry(stacks:flight._js.StatusBarStyleStacks, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability, handle:flight._js.StatusBarStyleEntryHandle):Void;
	@:native("pushStatusBarStyleEntry")
	public static function pushStatusBarStyleEntry(stacks:flight._js.StatusBarStyleStacks, hostStatusBarColor:flight._js.HostStatusBarColorCapability, hostStatusBarInfo:flight._js.HostStatusBarInfoCapability, hostStatusBarOverlays:flight._js.HostStatusBarOverlaysCapability, hostStatusBarStyle:flight._js.HostStatusBarStyleCapability, hostStatusBarVisibility:flight._js.HostStatusBarVisibilityCapability, entry:flight._js.StatusBarStyleEntry):flight._js.StatusBarStyleEntryHandle;
	@:native("setStatusBarColor")
	public static function setStatusBarColor(hostStatusBarColor:flight._js.HostStatusBarColorCapability, color:Int, animated:Null<Bool>):Void;
	@:native("setStatusBarOverlaysContent")
	public static function setStatusBarOverlaysContent(hostStatusBarOverlays:flight._js.HostStatusBarOverlaysCapability, overlay:Bool):Void;
	@:native("setStatusBarStyle")
	public static function setStatusBarStyle(hostStatusBarStyle:flight._js.HostStatusBarStyleCapability, style:Dynamic):Void;
	@:native("setStatusBarVisible")
	public static function setStatusBarVisible(hostStatusBarVisibility:flight._js.HostStatusBarVisibilityCapability, visible:Bool, animation:Null<Dynamic>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStatusBar(ptr:flight._js.StatusBar):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStatusBarStyleEntryHandle(ptr:flight._js.StatusBarStyleEntryHandle):Void {}
}
