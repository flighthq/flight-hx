package flight._hl;

private extern class MorphShapeGradientPaintBinding_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_morph_shape_gradient_paint_binding_command_key")
	static function get_commandKey(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_morph_shape_gradient_paint_binding_command_key")
	static function set_commandKey(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract MorphShapeGradientPaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var commandKey(get, set):String;
	inline function get_commandKey():String { var raw = MorphShapeGradientPaintBinding_Ffi.get_commandKey(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MorphShapeGradientPaintBinding_Ffi.freeString(raw); return value; }
	inline function set_commandKey(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MorphShapeGradientPaintBinding_Ffi.set_commandKey(this, raw); return value; }
	public var endFocalPointRatio(get, set):Float;

	inline function get_endFocalPointRatio():Float return this.getF64(80);

	inline function set_endFocalPointRatio(value:Float):Float { this.setF64(80, value); return value; }
	public var startFocalPointRatio(get, set):Float;

	inline function get_startFocalPointRatio():Float return this.getF64(232);

	inline function set_startFocalPointRatio(value:Float):Float { this.setF64(232, value); return value; }
}
