package flight;

#if (js && flight_esm)
extern inline function disableTrayGuards(state:TrayAnimationState):Void {
	flight._js._fn.Tray.disableTrayGuards(state);
}
#else
extern inline function disableTrayGuards(state:TrayAnimationState):Void {
#if hl
	flight._hl._fn.Tray.disableTrayGuards(state);
#elseif cpp
	flight._cpp._fn.Tray.disableTrayGuards(state);
#elseif (js && flight_esm)
	flight._js._fn.Tray.disableTrayGuards(state);
#else
	#error "flight.Tray: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTrayGuards(state:TrayAnimationState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Tray.enableTrayGuards(state, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function isTrayDestroyed(tray:Dynamic):Bool {
	return flight._js._fn.Tray.isTrayDestroyed(tray);
}
#else
extern inline function isTrayDestroyed(tray:Dynamic):Bool {
#if hl
	return flight._hl._fn.Tray.isTrayDestroyed(tray);
#elseif cpp
	return flight._cpp._fn.Tray.isTrayDestroyed(tray);
#elseif (js && flight_esm)
	return flight._js._fn.Tray.isTrayDestroyed(tray);
#else
	#error "flight.Tray: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isTrayIconAnimating(tray:Dynamic):Bool {
	return flight._js._fn.Tray.isTrayIconAnimating(tray);
}
#else
extern inline function isTrayIconAnimating(tray:Dynamic):Bool {
#if hl
	return flight._hl._fn.Tray.isTrayIconAnimating(tray);
#elseif cpp
	return flight._cpp._fn.Tray.isTrayIconAnimating(tray);
#elseif (js && flight_esm)
	return flight._js._fn.Tray.isTrayIconAnimating(tray);
#else
	#error "flight.Tray: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopTrayIconAnimation(tray:Dynamic):Dynamic {
	return flight._js._fn.Tray.stopTrayIconAnimation(tray);
}
#else
extern inline function stopTrayIconAnimation(tray:Dynamic):flight.TrayAnimationStopResult {
#if hl
	return flight._hl._fn.Tray.stopTrayIconAnimation(tray);
#elseif cpp
	return flight._cpp._fn.Tray.stopTrayIconAnimation(tray);
#elseif (js && flight_esm)
	return flight._js._fn.Tray.stopTrayIconAnimation(tray);
#else
	#error "flight.Tray: no backend for this target."
#end
}
#end
