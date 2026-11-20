package flight._cpp;

private extern class LayoutNode_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_layout_node_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_layout_node_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_layout_node_parent_index") static function get_parentIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_layout_node_parent_index") static function set_parentIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LayoutNode(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = LayoutNode_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); LayoutNode_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; LayoutNode_Ffi.set_kind(this, raw); return value; }
	public var parentIndex(get, set):Int;

	inline function get_parentIndex():Int return LayoutNode_Ffi.get_parentIndex(this);

	inline function set_parentIndex(value:Int):Int { LayoutNode_Ffi.set_parentIndex(this, value); return value; }
}
