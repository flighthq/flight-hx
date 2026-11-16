package flight._cpp;

private extern class ColladaDeferredControllerBinding_Ffi {
	@:native("flight_field_get_collada_deferred_controller_binding_controller_id")
	static function get_controllerId(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_deferred_controller_binding_controller_id")
	static function set_controllerId(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_collada_deferred_controller_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_controller_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaDeferredControllerBinding(cpp.Star<cpp.Void>) {
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
		ColladaDeferredControllerBinding_Ffi.set_controllerId(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredControllerBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredControllerBinding_Ffi.set_nodeIndex(this, value); return value; }
}
