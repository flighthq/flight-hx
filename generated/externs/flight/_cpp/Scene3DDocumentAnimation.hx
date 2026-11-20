package flight._cpp;

private extern class Scene3DDocumentAnimation_Ffi {
	@:native("flight_get_scene3_ddocument_animation_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_scene3_ddocument_animation_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Scene3DDocumentAnimation(cpp.Star<cpp.Void>) {
	public var duration(get, set):Float;

	inline function get_duration():Float return Scene3DDocumentAnimation_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float { Scene3DDocumentAnimation_Ffi.set_duration(this, value); return value; }
}
