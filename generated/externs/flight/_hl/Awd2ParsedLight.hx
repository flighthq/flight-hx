package flight._hl;

private extern class Awd2ParsedLight_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_light_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_light_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedLight(hl.Bytes) {
	public var ambient(get, set):Single;

	inline function get_ambient():Single return this.getF32(40);

	inline function set_ambient(value:Single):Single { this.setF32(40, value); return value; }
	public var ambientRgb(get, set):Int;

	inline function get_ambientRgb():Int return this.getI32(44);

	inline function set_ambientRgb(value:Int):Int { this.setI32(44, value); return value; }
	public var castsShadow(get, set):Bool;

	inline function get_castsShadow():Bool return this.getUI8(84) != 0;

	inline function set_castsShadow(value:Bool):Bool { this.setUI8(84, value ? 1 : 0); return value; }
	public var diffuse(get, set):Single;

	inline function get_diffuse():Single return this.getF32(48);

	inline function set_diffuse(value:Single):Single { this.setF32(48, value); return value; }
	public var directionX(get, set):Single;

	inline function get_directionX():Single return this.getF32(52);

	inline function set_directionX(value:Single):Single { this.setF32(52, value); return value; }
	public var directionY(get, set):Single;

	inline function get_directionY():Single return this.getF32(56);

	inline function set_directionY(value:Single):Single { this.setF32(56, value); return value; }
	public var directionZ(get, set):Single;

	inline function get_directionZ():Single return this.getF32(60);

	inline function set_directionZ(value:Single):Single { this.setF32(60, value); return value; }
	public var fallOff(get, set):Single;

	inline function get_fallOff():Single return this.getF32(64);

	inline function set_fallOff(value:Single):Single { this.setF32(64, value); return value; }
	public var hasRadius(get, set):Bool;

	inline function get_hasRadius():Bool return this.getUI8(85) != 0;

	inline function set_hasRadius(value:Bool):Bool { this.setUI8(85, value ? 1 : 0); return value; }
	public var lightType(get, set):Int;

	inline function get_lightType():Int return this.getUI8(86);

	inline function set_lightType(value:Int):Int { this.setUI8(86, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedLight_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedLight_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var parentId(get, set):Int;

	inline function get_parentId():Int return this.getI32(68);

	inline function set_parentId(value:Int):Int { this.setI32(68, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(72);

	inline function set_radius(value:Single):Single { this.setF32(72, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return this.getI32(76);

	inline function set_rgb(value:Int):Int { this.setI32(76, value); return value; }
	public var specular(get, set):Single;

	inline function get_specular():Single return this.getF32(80);

	inline function set_specular(value:Single):Single { this.setF32(80, value); return value; }
}
