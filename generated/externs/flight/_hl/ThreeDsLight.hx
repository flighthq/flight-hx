package flight._hl;

private extern class ThreeDsLight_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_three_ds_light_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_three_ds_light_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ThreeDsLight(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(160) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(160, value ? 1 : 0); return value; }
	public var falloff(get, set):Float;

	inline function get_falloff():Float return this.getF64(112);

	inline function set_falloff(value:Float):Float { this.setF64(112, value); return value; }
	public var hotspot(get, set):Float;

	inline function get_hotspot():Float return this.getF64(120);

	inline function set_hotspot(value:Float):Float { this.setF64(120, value); return value; }
	public var multiplier(get, set):Float;

	inline function get_multiplier():Float return this.getF64(128);

	inline function set_multiplier(value:Float):Float { this.setF64(128, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsLight_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ThreeDsLight_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ThreeDsLight_Ffi.set_name(this, raw); return value; }
}
