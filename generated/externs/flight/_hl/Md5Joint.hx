package flight._hl;

private extern class Md5Joint_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_md5_joint_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_md5_joint_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Md5Joint(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Md5Joint_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Md5Joint_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Md5Joint_Ffi.set_name(this, raw); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return this.getF64(24);

	inline function set_orientationW(value:Float):Float { this.setF64(24, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return this.getF64(32);

	inline function set_orientationX(value:Float):Float { this.setF64(32, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return this.getF64(40);

	inline function set_orientationY(value:Float):Float { this.setF64(40, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return this.getF64(48);

	inline function set_orientationZ(value:Float):Float { this.setF64(48, value); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getI32(80);

	inline function set_parentIndex(value:Int):Int { this.setI32(80, value); return value; }
	public var positionX(get, set):Float;

	inline function get_positionX():Float return this.getF64(56);

	inline function set_positionX(value:Float):Float { this.setF64(56, value); return value; }
	public var positionY(get, set):Float;

	inline function get_positionY():Float return this.getF64(64);

	inline function set_positionY(value:Float):Float { this.setF64(64, value); return value; }
	public var positionZ(get, set):Float;

	inline function get_positionZ():Float return this.getF64(72);

	inline function set_positionZ(value:Float):Float { this.setF64(72, value); return value; }
}
