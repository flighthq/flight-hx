package flight._hl;

private extern class ColladaDeferredControllerBinding_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_deferred_controller_binding_controller_id")
	static function get_controllerId(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_deferred_controller_binding_controller_id")
	static function set_controllerId(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaDeferredControllerBinding(hl.Bytes) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDeferredControllerBinding_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDeferredControllerBinding_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDeferredControllerBinding_Ffi.set_controllerId(this, raw); return value; }
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return this.getI32(72);

	inline function set_nodeIndex(value:Int):Int { this.setI32(72, value); return value; }
}
