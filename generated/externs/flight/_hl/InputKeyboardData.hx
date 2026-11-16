package flight._hl;

private extern class InputKeyboardData_Ffi {
	@:hlNative("flight", "flight_field_get_input_keyboard_data_code")
	static function get_code(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_input_keyboard_data_code")
	static function set_code(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_input_keyboard_data_key")
	static function get_key(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_input_keyboard_data_key")
	static function set_key(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract InputKeyboardData(hl.Bytes) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return this.getUI8(0) != 0;

	inline function set_altKey(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var capsLock(get, set):Bool;

	inline function get_capsLock():Bool return this.getUI8(1) != 0;

	inline function set_capsLock(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var code(get, set):String;
	inline function get_code():String {
		final bytes = InputKeyboardData_Ffi.get_code(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_code(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		InputKeyboardData_Ffi.set_code(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return this.getUI8(32) != 0;

	inline function set_ctrlKey(value:Bool):Bool { this.setUI8(32, value ? 1 : 0); return value; }
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = InputKeyboardData_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		InputKeyboardData_Ffi.set_key(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var keyCode(get, set):Int;

	inline function get_keyCode():Int return this.getI32(64);

	inline function set_keyCode(value:Int):Int { this.setI32(64, value); return value; }
	public var location(get, set):Int;

	inline function get_location():Int return this.getI32(68);

	inline function set_location(value:Int):Int { this.setI32(68, value); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(72) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(72, value ? 1 : 0); return value; }
	public var modifier(get, set):Int;

	inline function get_modifier():Int return this.getI32(76);

	inline function set_modifier(value:Int):Int { this.setI32(76, value); return value; }
	public var numLock(get, set):Bool;

	inline function get_numLock():Bool return this.getUI8(80) != 0;

	inline function set_numLock(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
	public var repeat(get, set):Bool;

	inline function get_repeat():Bool return this.getUI8(81) != 0;

	inline function set_repeat(value:Bool):Bool { this.setUI8(81, value ? 1 : 0); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(82) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(82, value ? 1 : 0); return value; }
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return this.getF64(88);

	inline function set_timeStamp(value:Float):Float { this.setF64(88, value); return value; }
}
