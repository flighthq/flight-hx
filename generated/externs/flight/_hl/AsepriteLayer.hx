package flight._hl;

private extern class AsepriteLayer_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_aseprite_layer_blend_mode")
	static function get_blendMode(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_aseprite_layer_blend_mode")
	static function set_blendMode(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_aseprite_layer_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_aseprite_layer_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AsepriteLayer(hl.Bytes) {
	public var blendMode(get, set):String;
	inline function get_blendMode():String { var raw = AsepriteLayer_Ffi.get_blendMode(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AsepriteLayer_Ffi.freeString(raw); return value; }
	inline function set_blendMode(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AsepriteLayer_Ffi.set_blendMode(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = AsepriteLayer_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AsepriteLayer_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AsepriteLayer_Ffi.set_name(this, raw); return value; }
	public var opacity(get, set):Single;

	inline function get_opacity():Single return this.getF32(48);

	inline function set_opacity(value:Single):Single { this.setF32(48, value); return value; }
}
