package flight._hl;

private extern class ColladaDeferredCameraBinding_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_deferred_camera_binding_camera_id")
	static function get_cameraId(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_deferred_camera_binding_camera_id")
	static function set_cameraId(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaDeferredCameraBinding(hl.Bytes) {
	public var cameraId(get, set):String;
	inline function get_cameraId():String { var raw = ColladaDeferredCameraBinding_Ffi.get_cameraId(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDeferredCameraBinding_Ffi.freeString(raw); return value; }
	inline function set_cameraId(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDeferredCameraBinding_Ffi.set_cameraId(this, raw); return value; }
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(24);

	inline function set_nodeIndex(value:Int):Int { this.setI32(24, value); return value; }
}
