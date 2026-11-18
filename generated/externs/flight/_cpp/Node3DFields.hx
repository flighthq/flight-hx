package flight._cpp;

private extern class Node3DFields_Ffi {
	@:native("flight_get_node3_dfields_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node3_dfields_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node3_dfields_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node3_dfields_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

private extern class Node3DFields_NodeProperties {
	@:native("flight_node_property_get_node3_dfields_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):Null<NativeByteBuffer>;
	@:native("flight_node_property_set_node3_dfields_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int, present:Bool):Void;
}

abstract Node3DFields(cpp.Star<cpp.Void>) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> {
		final buffer = Node3DFields_NodeProperties.get_name(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_name(value:Null<String>):Null<String> {
		if (value == null) {
			Node3DFields_NodeProperties.set_name(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			Node3DFields_NodeProperties.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length, true);
		}
		return value;
	}

	public var alpha(get, set):Single;

	inline function get_alpha():Single return Node3DFields_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single { Node3DFields_Ffi.set_alpha(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return Node3DFields_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { Node3DFields_Ffi.set_visible(this, value); return value; }
}
