package flight;

#if hl

typedef StatusBar = flight._hl.StatusBar;

#elseif cpp

typedef StatusBar = flight._cpp.StatusBar;

#elseif (js && flight_esm)

typedef StatusBar = flight._js.StatusBar;

#elseif js

#error "flight.StatusBar on js requires flight_esm."

#else

#error "flight.StatusBar: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createStatusBar():StatusBar {
	return flight._js._fn.StatusBar.createStatusBar();
}
#else
extern inline function createStatusBar():StatusBar {
#if hl
	return flight._hl._fn.StatusBar.createStatusBar();
#elseif cpp
	return flight._cpp._fn.StatusBar.createStatusBar();
#elseif (js && flight_esm)
	return flight._js._fn.StatusBar.createStatusBar();
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachStatusBar(hostStatusBarChange:HostStatusBarChangeCapability, hostStatusBarInfo:HostStatusBarInfoCapability, bar:StatusBar):Void {
	flight._js._fn.StatusBar.attachStatusBar(hostStatusBarChange, hostStatusBarInfo, bar);
}
#else
extern inline function attachStatusBar(hostStatusBarChange:HostStatusBarChangeCapability, hostStatusBarInfo:HostStatusBarInfoCapability, bar:StatusBar):Void {
#if hl
	flight._hl._fn.StatusBar.attachStatusBar(hostStatusBarChange, hostStatusBarInfo, bar);
#elseif cpp
	flight._cpp._fn.StatusBar.attachStatusBar(hostStatusBarChange, hostStatusBarInfo, bar);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.attachStatusBar(hostStatusBarChange, hostStatusBarInfo, bar);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearStatusBarStyleStack(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability):Void {
	flight._js._fn.StatusBar.clearStatusBarStyleStack(stacks, hostStatusBarInfo);
}
#else
extern inline function clearStatusBarStyleStack(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability):Void {
#if hl
	flight._hl._fn.StatusBar.clearStatusBarStyleStack(stacks, hostStatusBarInfo);
#elseif cpp
	flight._cpp._fn.StatusBar.clearStatusBarStyleStack(stacks, hostStatusBarInfo);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.clearStatusBarStyleStack(stacks, hostStatusBarInfo);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachStatusBar(bar:StatusBar):Void {
	flight._js._fn.StatusBar.detachStatusBar(bar);
}
#else
extern inline function detachStatusBar(bar:StatusBar):Void {
#if hl
	flight._hl._fn.StatusBar.detachStatusBar(bar);
#elseif cpp
	flight._cpp._fn.StatusBar.detachStatusBar(bar);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.detachStatusBar(bar);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeStatusBar(bar:StatusBar):Void {
	flight._js._fn.StatusBar.disposeStatusBar(bar);
}
#else
extern inline function disposeStatusBar(bar:StatusBar):Void {
#if hl
	flight._hl._fn.StatusBar.disposeStatusBar(bar);
#elseif cpp
	flight._cpp._fn.StatusBar.disposeStatusBar(bar);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.disposeStatusBar(bar);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStatusBarHeight(hostStatusBarInfo:HostStatusBarInfoCapability):Float {
	return flight._js._fn.StatusBar.getStatusBarHeight(hostStatusBarInfo);
}
#else
extern inline function getStatusBarHeight(hostStatusBarInfo:HostStatusBarInfoCapability):Float {
#if hl
	return flight._hl._fn.StatusBar.getStatusBarHeight(hostStatusBarInfo);
#elseif cpp
	return flight._cpp._fn.StatusBar.getStatusBarHeight(hostStatusBarInfo);
#elseif (js && flight_esm)
	return flight._js._fn.StatusBar.getStatusBarHeight(hostStatusBarInfo);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStatusBarInfo(out:StatusBarInfo, hostStatusBarInfo:HostStatusBarInfoCapability):Void {
	flight._js._fn.StatusBar.getStatusBarInfo(out, hostStatusBarInfo);
}
#else
extern inline function getStatusBarInfo(out:StatusBarInfo, hostStatusBarInfo:HostStatusBarInfoCapability):Void {
#if hl
	flight._hl._fn.StatusBar.getStatusBarInfo(out, hostStatusBarInfo);
#elseif cpp
	flight._cpp._fn.StatusBar.getStatusBarInfo(out, hostStatusBarInfo);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.getStatusBarInfo(out, hostStatusBarInfo);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability, handle:StatusBarStyleEntryHandle):Bool {
	return flight._js._fn.StatusBar.hasStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
}
#else
extern inline function hasStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability, handle:StatusBarStyleEntryHandle):Bool {
#if hl
	return flight._hl._fn.StatusBar.hasStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#elseif cpp
	return flight._cpp._fn.StatusBar.hasStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#elseif (js && flight_esm)
	return flight._js._fn.StatusBar.hasStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function popStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability, handle:StatusBarStyleEntryHandle):Void {
	flight._js._fn.StatusBar.popStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
}
#else
extern inline function popStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarInfo:HostStatusBarInfoCapability, handle:StatusBarStyleEntryHandle):Void {
#if hl
	flight._hl._fn.StatusBar.popStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#elseif cpp
	flight._cpp._fn.StatusBar.popStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.popStatusBarStyleEntry(stacks, hostStatusBarInfo, handle);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function pushStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarColor:HostStatusBarColorCapability, hostStatusBarInfo:HostStatusBarInfoCapability, hostStatusBarOverlays:HostStatusBarOverlaysCapability, hostStatusBarStyle:HostStatusBarStyleCapability, hostStatusBarVisibility:HostStatusBarVisibilityCapability, entry:StatusBarStyleEntry):StatusBarStyleEntryHandle {
	return flight._js._fn.StatusBar.pushStatusBarStyleEntry(stacks, hostStatusBarColor, hostStatusBarInfo, hostStatusBarOverlays, hostStatusBarStyle, hostStatusBarVisibility, entry);
}
#else
extern inline function pushStatusBarStyleEntry(stacks:StatusBarStyleStacks, hostStatusBarColor:HostStatusBarColorCapability, hostStatusBarInfo:HostStatusBarInfoCapability, hostStatusBarOverlays:HostStatusBarOverlaysCapability, hostStatusBarStyle:HostStatusBarStyleCapability, hostStatusBarVisibility:HostStatusBarVisibilityCapability, entry:StatusBarStyleEntry):StatusBarStyleEntryHandle {
#if hl
	return flight._hl._fn.StatusBar.pushStatusBarStyleEntry(stacks, hostStatusBarColor, hostStatusBarInfo, hostStatusBarOverlays, hostStatusBarStyle, hostStatusBarVisibility, entry);
#elseif cpp
	return flight._cpp._fn.StatusBar.pushStatusBarStyleEntry(stacks, hostStatusBarColor, hostStatusBarInfo, hostStatusBarOverlays, hostStatusBarStyle, hostStatusBarVisibility, entry);
#elseif (js && flight_esm)
	return flight._js._fn.StatusBar.pushStatusBarStyleEntry(stacks, hostStatusBarColor, hostStatusBarInfo, hostStatusBarOverlays, hostStatusBarStyle, hostStatusBarVisibility, entry);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStatusBarColor(hostStatusBarColor:HostStatusBarColorCapability, color:Int, animated:Null<Bool>):Void {
	flight._js._fn.StatusBar.setStatusBarColor(hostStatusBarColor, color, animated);
}
#else
extern inline function setStatusBarColor(hostStatusBarColor:HostStatusBarColorCapability, color:Int, animated:Int):Void {
#if hl
	flight._hl._fn.StatusBar.setStatusBarColor(hostStatusBarColor, color, animated);
#elseif cpp
	flight._cpp._fn.StatusBar.setStatusBarColor(hostStatusBarColor, color, animated);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.setStatusBarColor(hostStatusBarColor, color, animated);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStatusBarOverlaysContent(hostStatusBarOverlays:HostStatusBarOverlaysCapability, overlay:Bool):Void {
	flight._js._fn.StatusBar.setStatusBarOverlaysContent(hostStatusBarOverlays, overlay);
}
#else
extern inline function setStatusBarOverlaysContent(hostStatusBarOverlays:HostStatusBarOverlaysCapability, overlay:Bool):Void {
#if hl
	flight._hl._fn.StatusBar.setStatusBarOverlaysContent(hostStatusBarOverlays, overlay);
#elseif cpp
	flight._cpp._fn.StatusBar.setStatusBarOverlaysContent(hostStatusBarOverlays, overlay);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.setStatusBarOverlaysContent(hostStatusBarOverlays, overlay);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStatusBarStyle(hostStatusBarStyle:HostStatusBarStyleCapability, style:Dynamic):Void {
	flight._js._fn.StatusBar.setStatusBarStyle(hostStatusBarStyle, style);
}
#else
extern inline function setStatusBarStyle(hostStatusBarStyle:HostStatusBarStyleCapability, style:flight.StatusBarStyle):Void {
#if hl
	flight._hl._fn.StatusBar.setStatusBarStyle(hostStatusBarStyle, style);
#elseif cpp
	flight._cpp._fn.StatusBar.setStatusBarStyle(hostStatusBarStyle, style);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.setStatusBarStyle(hostStatusBarStyle, style);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStatusBarVisible(hostStatusBarVisibility:HostStatusBarVisibilityCapability, visible:Bool, animation:Null<Dynamic>):Void {
	flight._js._fn.StatusBar.setStatusBarVisible(hostStatusBarVisibility, visible, animation);
}
#else
extern inline function setStatusBarVisible(hostStatusBarVisibility:HostStatusBarVisibilityCapability, visible:Bool, animation:Int):Void {
#if hl
	flight._hl._fn.StatusBar.setStatusBarVisible(hostStatusBarVisibility, visible, animation);
#elseif cpp
	flight._cpp._fn.StatusBar.setStatusBarVisible(hostStatusBarVisibility, visible, animation);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.setStatusBarVisible(hostStatusBarVisibility, visible, animation);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStatusBar(ptr:StatusBar):Void {
	flight._js._fn.StatusBar.freeStatusBar(ptr);
}
#else
extern inline function freeStatusBar(ptr:StatusBar):Void {
#if hl
	flight._hl._fn.StatusBar.freeStatusBar(ptr);
#elseif cpp
	flight._cpp._fn.StatusBar.freeStatusBar(ptr);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.freeStatusBar(ptr);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStatusBarStyleEntryHandle(ptr:StatusBarStyleEntryHandle):Void {
	flight._js._fn.StatusBar.freeStatusBarStyleEntryHandle(ptr);
}
#else
extern inline function freeStatusBarStyleEntryHandle(ptr:StatusBarStyleEntryHandle):Void {
#if hl
	flight._hl._fn.StatusBar.freeStatusBarStyleEntryHandle(ptr);
#elseif cpp
	flight._cpp._fn.StatusBar.freeStatusBarStyleEntryHandle(ptr);
#elseif (js && flight_esm)
	flight._js._fn.StatusBar.freeStatusBarStyleEntryHandle(ptr);
#else
	#error "flight.StatusBar: no backend for this target."
#end
}
#end
