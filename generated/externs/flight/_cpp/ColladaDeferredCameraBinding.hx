package flight._cpp;

private extern class ColladaDeferredCameraBinding_Ffi {
	@:native("flight_field_get_collada_deferred_camera_binding_camera_id")
	static function get_cameraId(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_deferred_camera_binding_camera_id")
	static function set_cameraId(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_collada_deferred_camera_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_camera_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaDeferredCameraBinding(cpp.Star<cpp.Void>) {
	public var cameraId(get, set):String;
	inline function get_cameraId():String {
		final bytes = ColladaDeferredCameraBinding_Ffi.get_cameraId(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_cameraId(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDeferredCameraBinding_Ffi.set_cameraId(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredCameraBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredCameraBinding_Ffi.set_nodeIndex(this, value); return value; }
}
