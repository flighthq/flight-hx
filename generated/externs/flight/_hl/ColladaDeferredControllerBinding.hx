package flight._hl;

private extern class ColladaDeferredControllerBinding_Ffi {
	@:hlNative("flight", "flight_field_get_collada_deferred_controller_binding_controller_id")
	static function get_controllerId(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_deferred_controller_binding_controller_id")
	static function set_controllerId(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDeferredControllerBinding(hl.Bytes) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String {
		final bytes = ColladaDeferredControllerBinding_Ffi.get_controllerId(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_controllerId(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDeferredControllerBinding_Ffi.set_controllerId(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(72);

	inline function set_nodeIndex(value:Int):Int { this.setI32(72, value); return value; }
}
