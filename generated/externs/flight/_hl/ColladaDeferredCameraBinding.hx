package flight._hl;

private extern class ColladaDeferredCameraBinding_Ffi {
	@:hlNative("flight", "flight_field_get_collada_deferred_camera_binding_camera_id")
	static function get_cameraId(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_deferred_camera_binding_camera_id")
	static function set_cameraId(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDeferredCameraBinding(hl.Bytes) {
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
		ColladaDeferredCameraBinding_Ffi.set_cameraId(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(24);

	inline function set_nodeIndex(value:Int):Int { this.setI32(24, value); return value; }
}
