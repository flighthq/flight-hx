package flight._hl;

private extern class Awd2ParsedLight_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_awd2_parsed_light_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_awd2_parsed_light_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Awd2ParsedLight(hl.Bytes) {
	public var ambient(get, set):Float;

	inline function get_ambient():Float return this.getF64(40);

	inline function set_ambient(value:Float):Float { this.setF64(40, value); return value; }
	public var ambientRgb(get, set):Int;

	inline function get_ambientRgb():Int return this.getI32(104);

	inline function set_ambientRgb(value:Int):Int { this.setI32(104, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return this.getUI8(116) != 0;

	inline function set_castsShadow(value:Bool):Bool { this.setUI8(116, value ? 1 : 0); return value; }
	public var diffuse(get, set):Float;

	inline function get_diffuse():Float return this.getF64(48);

	inline function set_diffuse(value:Float):Float { this.setF64(48, value); return value; }
	public var directionX(get, set):Float;

	inline function get_directionX():Float return this.getF64(56);

	inline function set_directionX(value:Float):Float { this.setF64(56, value); return value; }
	public var directionY(get, set):Float;

	inline function get_directionY():Float return this.getF64(64);

	inline function set_directionY(value:Float):Float { this.setF64(64, value); return value; }
	public var directionZ(get, set):Float;

	inline function get_directionZ():Float return this.getF64(72);

	inline function set_directionZ(value:Float):Float { this.setF64(72, value); return value; }
	public var fallOff(get, set):Float;

	inline function get_fallOff():Float return this.getF64(80);

	inline function set_fallOff(value:Float):Float { this.setF64(80, value); return value; }
	public var hasRadius(get, set):Bool;

	inline function get_hasRadius():Bool return this.getUI8(117) != 0;

	inline function set_hasRadius(value:Bool):Bool { this.setUI8(117, value ? 1 : 0); return value; }
	public var lightType(get, set):Int;

	inline function get_lightType():Int return this.getUI8(118);

	inline function set_lightType(value:Int):Int { this.setUI8(118, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedLight_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Awd2ParsedLight_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Awd2ParsedLight_Ffi.set_name(this, raw); return value; }
	public var parentId(get, set):Int;

	inline function get_parentId():Int return this.getI32(108);

	inline function set_parentId(value:Int):Int { this.setI32(108, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(88);

	inline function set_radius(value:Float):Float { this.setF64(88, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return this.getI32(112);

	inline function set_rgb(value:Int):Int { this.setI32(112, value); return value; }
	public var specular(get, set):Float;

	inline function get_specular():Float return this.getF64(96);

	inline function set_specular(value:Float):Float { this.setF64(96, value); return value; }
}
