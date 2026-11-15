package flight._cpp;

private extern class VideoResource_Ffi {
	@:native("flight_get_video_resource_owns_element") static function get_ownsElement(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_video_resource_owns_element") static function set_ownsElement(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract VideoResource(cpp.Star<cpp.Void>) {
	public var ownsElement(get, set):Bool;

	inline function get_ownsElement():Bool return VideoResource_Ffi.get_ownsElement(this);

	inline function set_ownsElement(value:Bool):Bool return VideoResource_Ffi.set_ownsElement(this, value);
}
