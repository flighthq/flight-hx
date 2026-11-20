package flight._cpp._fn;

extern class Updater {
	@:native("flight_destroy_updater")
	public static function destroyUpdater(hostUpdaterCommand:cpp.Star<cpp.Void>):Void;
}
