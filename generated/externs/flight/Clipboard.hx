package flight;

#if (js && flight_esm)
extern inline function createClipboardWatch():ClipboardWatch {
	return flight._js._fn.Clipboard.createClipboardWatch();
}
#else
extern inline function createClipboardWatch():ClipboardWatch {
#if hl
	return flight._hl._fn.Clipboard.createClipboardWatch();
#elseif cpp
	return flight._cpp._fn.Clipboard.createClipboardWatch();
#elseif (js && flight_esm)
	return flight._js._fn.Clipboard.createClipboardWatch();
#else
	#error "flight.Clipboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachClipboardWatch(hostClipboardChange:HostClipboardChangeSubscriber, watch:ClipboardWatch):Void {
	flight._js._fn.Clipboard.attachClipboardWatch(hostClipboardChange, watch);
}
#else
extern inline function attachClipboardWatch(hostClipboardChange:HostClipboardChangeSubscriber, watch:ClipboardWatch):Void {
#if hl
	flight._hl._fn.Clipboard.attachClipboardWatch(hostClipboardChange, watch);
#elseif cpp
	flight._cpp._fn.Clipboard.attachClipboardWatch(hostClipboardChange, watch);
#elseif (js && flight_esm)
	flight._js._fn.Clipboard.attachClipboardWatch(hostClipboardChange, watch);
#else
	#error "flight.Clipboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachClipboardWatch(watch:ClipboardWatch):Void {
	flight._js._fn.Clipboard.detachClipboardWatch(watch);
}
#else
extern inline function detachClipboardWatch(watch:ClipboardWatch):Void {
#if hl
	flight._hl._fn.Clipboard.detachClipboardWatch(watch);
#elseif cpp
	flight._cpp._fn.Clipboard.detachClipboardWatch(watch);
#elseif (js && flight_esm)
	flight._js._fn.Clipboard.detachClipboardWatch(watch);
#else
	#error "flight.Clipboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeClipboardWatch(watch:ClipboardWatch):Void {
	flight._js._fn.Clipboard.disposeClipboardWatch(watch);
}
#else
extern inline function disposeClipboardWatch(watch:ClipboardWatch):Void {
#if hl
	flight._hl._fn.Clipboard.disposeClipboardWatch(watch);
#elseif cpp
	flight._cpp._fn.Clipboard.disposeClipboardWatch(watch);
#elseif (js && flight_esm)
	flight._js._fn.Clipboard.disposeClipboardWatch(watch);
#else
	#error "flight.Clipboard: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeClipboardWatch(ptr:ClipboardWatch):Void {
	flight._js._fn.Clipboard.freeClipboardWatch(ptr);
}
#else
extern inline function freeClipboardWatch(ptr:ClipboardWatch):Void {
#if hl
	flight._hl._fn.Clipboard.freeClipboardWatch(ptr);
#elseif cpp
	flight._cpp._fn.Clipboard.freeClipboardWatch(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Clipboard.freeClipboardWatch(ptr);
#else
	#error "flight.Clipboard: no backend for this target."
#end
}
#end
