package flight._cpp;

// The result owns its Rust bytes until dispose(); data is a borrowed view.
private extern class NativeByteBuffer_Ffi {
	@:native("flight_get_byte_buffer_length")
	static function length(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_byte_buffer_data")
	static function data(ptr:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_byte_buffer_byte")
	static function get(ptr:cpp.Star<cpp.Void>, index:Int):Int;
	@:native("flight_copy_byte_buffer")
	static function copy(ptr:cpp.Star<cpp.Void>, destination:cpp.Star<cpp.Void>, capacity:Int):Int;
	@:native("flight_free_byte_buffer")
	static function free(ptr:cpp.Star<cpp.Void>):Void;
}

abstract NativeByteBuffer(cpp.Star<cpp.Void>) {
	public var length(get, never):Int;
	inline function get_length():Int return NativeByteBuffer_Ffi.length(this);
	public var data(get, never):cpp.Star<cpp.Void>;
	inline function get_data():cpp.Star<cpp.Void> return NativeByteBuffer_Ffi.data(this);
	public inline function getByte(index:Int):Int {
		if (index < 0 || index >= length) throw 'Byte buffer index out of bounds';
		return NativeByteBuffer_Ffi.get(this, index);
	}
	public inline function toBytes():haxe.io.Bytes {
		final count = length;
		final result = haxe.io.Bytes.alloc(count);
		if (count > 0 && NativeByteBuffer_Ffi.copy(this, cast cpp.Pointer.ofArray(result.getData()).raw, count) != count) throw 'Byte buffer copy failed';
		return result;
	}
	public inline function dispose():Void { NativeByteBuffer_Ffi.free(this); this = null; }
}
