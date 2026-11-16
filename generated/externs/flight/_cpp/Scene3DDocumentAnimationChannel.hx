package flight._cpp;

private extern class Scene3DDocumentAnimationChannel_Ffi {
	@:native("flight_get_scene3_ddocument_animation_channel_node") static function get_node(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene3_ddocument_animation_channel_node") static function set_node(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Scene3DDocumentAnimationChannel(cpp.Star<cpp.Void>) {
	public var node(get, set):Int;

	inline function get_node():Int return Scene3DDocumentAnimationChannel_Ffi.get_node(this);

	inline function set_node(value:Int):Int { Scene3DDocumentAnimationChannel_Ffi.set_node(this, value); return value; }
}
