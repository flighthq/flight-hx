package flight._js._fn;

@:jsRequire("@flighthq/updater")
extern class Updater {
	@:native("destroyUpdater")
	public static function destroyUpdater(hostUpdaterCommand:Dynamic):Void;
}
