package flight._cpp;

private extern class ColladaDeferredLightBinding_Ffi {
	@:native("flight_get_collada_deferred_light_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_light_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_collada_deferred_light_binding_url")
	static function get_url(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_deferred_light_binding_url")
	static function set_url(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ColladaDeferredLightBinding(cpp.Star<cpp.Void>) {
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredLightBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredLightBinding_Ffi.set_nodeIndex(this, value); return value; }
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
		ColladaDeferredLightBinding_Ffi.set_url(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
