package flight._hl;

private extern class RichTextData_Ffi {
	@:hlNative("flight", "flight_field_get_rich_text_data_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rich_text_data_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
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
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(48);

	inline function set_height(value:Single):Single { this.setF32(48, value); return value; }
	public var maxChars(get, set):Int;

	inline function get_maxChars():Int return this.getI32(52);

	inline function set_maxChars(value:Int):Int { this.setI32(52, value); return value; }
	public var mouseWheelEnabled(get, set):Bool;

	inline function get_mouseWheelEnabled():Bool return this.getUI8(56) != 0;

	inline function set_mouseWheelEnabled(value:Bool):Bool { this.setUI8(56, value ? 1 : 0); return value; }
	public var multiline(get, set):Bool;

	inline function get_multiline():Bool return this.getUI8(57) != 0;

	inline function set_multiline(value:Bool):Bool { this.setUI8(57, value ? 1 : 0); return value; }
	public var scrollH(get, set):Single;

	inline function get_scrollH():Single return this.getF32(60);

	inline function set_scrollH(value:Single):Single { this.setF32(60, value); return value; }
	public var scrollV(get, set):Single;

	inline function get_scrollV():Single return this.getF32(64);

	inline function set_scrollV(value:Single):Single { this.setF32(64, value); return value; }
	public var selectable(get, set):Bool;

	inline function get_selectable():Bool return this.getUI8(68) != 0;

	inline function set_selectable(value:Bool):Bool { this.setUI8(68, value ? 1 : 0); return value; }
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = RichTextData_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RichTextData_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var textColor(get, set):Int;

	inline function get_textColor():Int return this.getI32(96);

	inline function set_textColor(value:Int):Int { this.setI32(96, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(140);

	inline function set_width(value:Single):Single { this.setF32(140, value); return value; }
	public var wordWrap(get, set):Bool;

	inline function get_wordWrap():Bool return this.getUI8(144) != 0;

	inline function set_wordWrap(value:Bool):Bool { this.setUI8(144, value ? 1 : 0); return value; }
}
