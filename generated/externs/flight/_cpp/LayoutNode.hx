package flight._cpp;

private extern class LayoutNode_Ffi {
	@:native("flight_field_get_layout_node_kind")
	static function get_kind(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_layout_node_kind")
	static function set_kind(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_layout_node_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_node_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LayoutNode(cpp.Star<cpp.Void>) {
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
		LayoutNode_Ffi.set_kind(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return LayoutNode_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { LayoutNode_Ffi.set_parentIndex(this, value); return value; }
}
