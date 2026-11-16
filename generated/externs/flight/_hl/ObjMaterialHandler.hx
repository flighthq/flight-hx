package flight._hl;

private extern class ObjMaterialHandler_Ffi {
	@:hlNative("flight", "flight_field_get_obj_material_handler_feature")
	static function get_feature(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_obj_material_handler_feature")
	static function set_feature(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ObjMaterialHandler(hl.Bytes) {
	public var feature(get, set):String;
	inline function get_feature():String {
		final bytes = ObjMaterialHandler_Ffi.get_feature(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_feature(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ObjMaterialHandler_Ffi.set_feature(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
