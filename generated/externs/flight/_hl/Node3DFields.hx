package flight._hl;

private extern class Node3DFields_NodeProperties {
	@:hlNative("flight", "flight_node_property_get_node3_dfields_name")
	static function get_name(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_node3_dfields_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
}

abstract Node3DFields(hl.Bytes) {
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
			Node3DFields_NodeProperties.set_name(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(744);

	inline function set_alpha(value:Single):Single { this.setF32(744, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return this.getUI8(748) != 0;

	inline function set_visible(value:Bool):Bool { this.setUI8(748, value ? 1 : 0); return value; }
}
