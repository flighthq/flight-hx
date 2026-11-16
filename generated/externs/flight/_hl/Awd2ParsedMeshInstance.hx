package flight._hl;

private extern class Awd2ParsedMeshInstance_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_mesh_instance_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_mesh_instance_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedMeshInstance(hl.Bytes) {
	public var geometryId(get, set):Int;

	inline function get_geometryId():Int return this.getI32(64);

	inline function set_geometryId(value:Int):Int { this.setI32(64, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedMeshInstance_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedMeshInstance_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var parentId(get, set):Int;

	inline function get_parentId():Int return this.getI32(68);

	inline function set_parentId(value:Int):Int { this.setI32(68, value); return value; }
}
