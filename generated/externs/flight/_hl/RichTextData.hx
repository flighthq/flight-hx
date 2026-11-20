package flight._hl;

private extern class RichTextData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rich_text_data_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rich_text_data_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RichTextData(hl.Bytes) {
	public var background(get, set):Bool;

	inline function get_background():Bool return this.getUI8(20) != 0;

	inline function set_background(value:Bool):Bool { this.setUI8(20, value ? 1 : 0); return value; }
	public var backgroundColor(get, set):Int;

	inline function get_backgroundColor():Int return this.getI32(24);

	inline function set_backgroundColor(value:Int):Int { this.setI32(24, value); return value; }
	public var border(get, set):Bool;

	inline function get_border():Bool return this.getUI8(28) != 0;

	inline function set_border(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var borderColor(get, set):Int;

	inline function get_borderColor():Int return this.getI32(32);

	inline function set_borderColor(value:Int):Int { this.setI32(32, value); return value; }
	public var condenseWhite(get, set):Bool;

	inline function get_condenseWhite():Bool return this.getUI8(36) != 0;

	inline function set_condenseWhite(value:Bool):Bool { this.setUI8(36, value ? 1 : 0); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(48);

	inline function set_height(value:Float):Float { this.setF64(48, value); return value; }
	public var maxChars(get, set):Int;

	inline function get_maxChars():Int return this.getI32(56);

	inline function set_maxChars(value:Int):Int { this.setI32(56, value); return value; }
	public var mouseWheelEnabled(get, set):Bool;

	inline function get_mouseWheelEnabled():Bool return this.getUI8(60) != 0;

	inline function set_mouseWheelEnabled(value:Bool):Bool { this.setUI8(60, value ? 1 : 0); return value; }
	public var multiline(get, set):Bool;

	inline function get_multiline():Bool return this.getUI8(61) != 0;

	inline function set_multiline(value:Bool):Bool { this.setUI8(61, value ? 1 : 0); return value; }
	public var scrollH(get, set):Float;

	inline function get_scrollH():Float return this.getF64(64);

	inline function set_scrollH(value:Float):Float { this.setF64(64, value); return value; }
	public var scrollV(get, set):Float;

	inline function get_scrollV():Float return this.getF64(72);

	inline function set_scrollV(value:Float):Float { this.setF64(72, value); return value; }
	public var selectable(get, set):Bool;

	inline function get_selectable():Bool return this.getUI8(80) != 0;

	inline function set_selectable(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = RichTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RichTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RichTextData_Ffi.set_text(this, raw); return value; }
	public var textColor(get, set):Int;

	inline function get_textColor():Int return this.getI32(112);

	inline function set_textColor(value:Int):Int { this.setI32(112, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(160);

	inline function set_width(value:Float):Float { this.setF64(160, value); return value; }
	public var wordWrap(get, set):Bool;

	inline function get_wordWrap():Bool return this.getUI8(168) != 0;

	inline function set_wordWrap(value:Bool):Bool { this.setUI8(168, value ? 1 : 0); return value; }
}
