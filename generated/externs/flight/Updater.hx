package flight;

#if (js && flight_esm)
extern inline function destroyUpdater(hostUpdaterCommand:Dynamic):Void {
	flight._js._fn.Updater.destroyUpdater(hostUpdaterCommand);
}
#else
extern inline function destroyUpdater(hostUpdaterCommand:Dynamic):Void {
#if hl
	flight._hl._fn.Updater.destroyUpdater(hostUpdaterCommand);
#elseif cpp
	flight._cpp._fn.Updater.destroyUpdater(hostUpdaterCommand);
#elseif (js && flight_esm)
	flight._js._fn.Updater.destroyUpdater(hostUpdaterCommand);
#else
	#error "flight.Updater: no backend for this target."
#end
}
#end
