package flight._hl;

private extern class ColladaDeferredLightBinding_Ffi {
	@:hlNative("flight", "flight_field_get_collada_deferred_light_binding_url")
	static function get_url(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_deferred_light_binding_url")
	static function set_url(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDeferredLightBinding(hl.Bytes) {
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(24);

	inline function set_nodeIndex(value:Int):Int { this.setI32(24, value); return value; }
	public var url(get, set):String;
	inline function get_url():String {
		final bytes = ColladaDeferredLightBinding_Ffi.get_url(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_url(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDeferredLightBinding_Ffi.set_url(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
