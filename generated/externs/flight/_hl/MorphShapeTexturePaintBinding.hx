package flight._hl;

private extern class MorphShapeTexturePaintBinding_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_morph_shape_texture_paint_binding_command_key")
	static function get_commandKey(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_morph_shape_texture_paint_binding_command_key")
	static function set_commandKey(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract MorphShapeTexturePaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String { var raw = MorphShapeTexturePaintBinding_Ffi.get_commandKey(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MorphShapeTexturePaintBinding_Ffi.freeString(raw); return value; }
	inline function set_commandKey(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MorphShapeTexturePaintBinding_Ffi.set_commandKey(this, raw); return value; }
}
