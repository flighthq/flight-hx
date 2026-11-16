package flight._cpp;

private extern class ObjMaterialHandler_Ffi {
	@:native("flight_field_get_obj_material_handler_feature")
	static function get_feature(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_obj_material_handler_feature")
	static function set_feature(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ObjMaterialHandler(cpp.Star<cpp.Void>) {
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
		ObjMaterialHandler_Ffi.set_feature(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
