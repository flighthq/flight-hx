package flight._cpp;

private extern class ColladaDeferredCameraBinding_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_deferred_camera_binding_camera_id") static function get_cameraId(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_deferred_camera_binding_camera_id") static function set_cameraId(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_collada_deferred_camera_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_camera_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaDeferredCameraBinding(cpp.Star<cpp.Void>) {
	public var cameraId(get, set):String;
	inline function get_cameraId():String { var raw = ColladaDeferredCameraBinding_Ffi.get_cameraId(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDeferredCameraBinding_Ffi.freeString(raw); return value; }
	inline function set_cameraId(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDeferredCameraBinding_Ffi.set_cameraId(this, raw); return value; }
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredCameraBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredCameraBinding_Ffi.set_nodeIndex(this, value); return value; }
}
