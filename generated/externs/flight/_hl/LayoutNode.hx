package flight._hl;

private extern class LayoutNode_Ffi {
	@:hlNative("flight", "flight_field_get_layout_node_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_layout_node_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract LayoutNode(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = LayoutNode_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		LayoutNode_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return this.getI32(176);

	inline function set_parentIndex(value:Int):Int { this.setI32(176, value); return value; }
}
