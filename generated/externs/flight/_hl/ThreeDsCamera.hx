package flight._hl;

private extern class ThreeDsCamera_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_three_ds_camera_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_three_ds_camera_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ThreeDsCamera(hl.Bytes) {
	public var focalLength(get, set):Float;

	inline function get_focalLength():Float return this.getF64(56);

	inline function set_focalLength(value:Float):Float { this.setF64(56, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsCamera_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ThreeDsCamera_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ThreeDsCamera_Ffi.set_name(this, raw); return value; }
	public var roll(get, set):Float;

	inline function get_roll():Float return this.getF64(88);

	inline function set_roll(value:Float):Float { this.setF64(88, value); return value; }
}
