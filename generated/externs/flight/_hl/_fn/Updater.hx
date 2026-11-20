package flight._hl._fn;

extern class Updater {
	@:hlNative("flight", "flight_destroy_updater")
	public static function destroyUpdater(hostUpdaterCommand:hl.Bytes):Void;
}
