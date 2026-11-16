package flight._hl;

// The result owns its Rust bytes until dispose(); data is a borrowed view.
private extern class NativeByteBuffer_Ffi {
	@:hlNative("flight", "flight_get_byte_buffer_length")
	static function length(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_byte_buffer_data")
	static function data(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_byte_buffer_byte")
	static function get(ptr:hl.Bytes, index:Int):Int;
	@:hlNative("flight", "flight_copy_byte_buffer")
	static function copy(ptr:hl.Bytes, destination:hl.Bytes, capacity:Int):Int;
	@:hlNative("flight", "flight_free_byte_buffer")
	static function free(ptr:hl.Bytes):Void;
}

abstract NativeByteBuffer(hl.Bytes) {
	public var length(get, never):Int;
	inline function get_length():Int return NativeByteBuffer_Ffi.length(this);
	public var data(get, never):hl.Bytes;
	inline function get_data():hl.Bytes return NativeByteBuffer_Ffi.data(this);
	public inline function getByte(index:Int):Int {
		if (index < 0 || index >= length) throw 'Byte buffer index out of bounds';
		return NativeByteBuffer_Ffi.get(this, index);
	}
	public inline function toBytes():haxe.io.Bytes {
		final count = length;
		final result = haxe.io.Bytes.alloc(count);
		if (count > 0 && NativeByteBuffer_Ffi.copy(this, result.getData().bytes, count) != count) throw 'Byte buffer copy failed';
		return result;
	}
	public inline function dispose():Void { NativeByteBuffer_Ffi.free(this); }
}
