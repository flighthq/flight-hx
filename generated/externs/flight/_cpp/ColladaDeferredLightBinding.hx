package flight._cpp;

private extern class ColladaDeferredLightBinding_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_collada_deferred_light_binding_node_index") static function get_nodeIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_collada_deferred_light_binding_node_index") static function set_nodeIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_collada_deferred_light_binding_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_deferred_light_binding_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaDeferredLightBinding(cpp.Star<cpp.Void>) {
	public var nodeIndex(get, set):Int;

	inline function get_nodeIndex():Int return ColladaDeferredLightBinding_Ffi.get_nodeIndex(this);

	inline function set_nodeIndex(value:Int):Int { ColladaDeferredLightBinding_Ffi.set_nodeIndex(this, value); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = ColladaDeferredLightBinding_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDeferredLightBinding_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDeferredLightBinding_Ffi.set_url(this, raw); return value; }
}
