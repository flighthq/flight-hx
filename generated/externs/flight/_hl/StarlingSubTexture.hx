package flight._hl;

private extern class StarlingSubTexture_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_starling_sub_texture_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_starling_sub_texture_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract StarlingSubTexture(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(32);

	inline function set_height(value:Single):Single { this.setF32(32, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = StarlingSubTexture_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); StarlingSubTexture_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } StarlingSubTexture_Ffi.set_name(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(84);

	inline function set_width(value:Single):Single { this.setF32(84, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(88);

	inline function set_x(value:Single):Single { this.setF32(88, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(92);

	inline function set_y(value:Single):Single { this.setF32(92, value); return value; }
}
