package flight._cpp;

private extern class ColladaDeferredControllerBinding_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_deferred_controller_binding_controller_id") static function get_controllerId(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_deferred_controller_binding_controller_id") static function set_controllerId(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_collada_deferred_controller_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_controller_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColladaDeferredControllerBinding(cpp.Star<cpp.Void>) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDeferredControllerBinding_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDeferredControllerBinding_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDeferredControllerBinding_Ffi.set_controllerId(this, raw); return value; }
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredControllerBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredControllerBinding_Ffi.set_nodeIndex(this, value); return value; }
}
