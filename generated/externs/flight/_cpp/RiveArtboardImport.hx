package flight._cpp;

private extern class RiveArtboardImport_Ffi {
	@:native("flight_get_rive_artboard_import_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_artboard_import_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rive_artboard_import_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_artboard_import_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveArtboardImport(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return RiveArtboardImport_Ffi.get_height(this);

	inline function set_height(value:Single):Single { RiveArtboardImport_Ffi.set_height(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return RiveArtboardImport_Ffi.get_width(this);

	inline function set_width(value:Single):Single { RiveArtboardImport_Ffi.set_width(this, value); return value; }
}
