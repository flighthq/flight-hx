package flight._cpp;

private extern class Scene2DSlotReference_Ffi {
	@:native("flight_field_get_scene2_dslot_reference_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_scene2_dslot_reference_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_scene2_dslot_reference_required") static function get_required(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene2_dslot_reference_required") static function set_required(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene2DSlotReference(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Scene2DSlotReference_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Scene2DSlotReference_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var required(get, set):Bool;

	inline function get_required():Bool return Scene2DSlotReference_Ffi.get_required(this);

	inline function set_required(value:Bool):Bool { Scene2DSlotReference_Ffi.set_required(this, value); return value; }
}
