package flight._hl;

private extern class MorphShapeGradientPaintBinding_Ffi {
	@:hlNative("flight", "flight_field_get_morph_shape_gradient_paint_binding_command_key")
	static function get_commandKey(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_morph_shape_gradient_paint_binding_command_key")
	static function set_commandKey(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract MorphShapeGradientPaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String {
		final bytes = MorphShapeGradientPaintBinding_Ffi.get_commandKey(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_commandKey(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		MorphShapeGradientPaintBinding_Ffi.set_commandKey(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var endFocalPointRatio(get, set):Float;

	inline function get_endFocalPointRatio():Float return this.getF64(80);

	inline function set_endFocalPointRatio(value:Float):Float { this.setF64(80, value); return value; }
	public var startFocalPointRatio(get, set):Float;

	inline function get_startFocalPointRatio():Float return this.getF64(208);

	inline function set_startFocalPointRatio(value:Float):Float { this.setF64(208, value); return value; }
}
