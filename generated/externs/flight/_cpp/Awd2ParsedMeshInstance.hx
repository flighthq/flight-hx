package flight._cpp;

private extern class Awd2ParsedMeshInstance_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_awd2_parsed_mesh_instance_geometry_id") static function get_geometryId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_mesh_instance_geometry_id") static function set_geometryId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_parsed_mesh_instance_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_awd2_parsed_mesh_instance_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_awd2_parsed_mesh_instance_parent_id") static function get_parentId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_mesh_instance_parent_id") static function set_parentId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2ParsedMeshInstance(cpp.Star<cpp.Void>) {
	public var geometryId(get, set):Int;

	inline function get_geometryId():Int return Awd2ParsedMeshInstance_Ffi.get_geometryId(this);

	inline function set_geometryId(value:Int):Int { Awd2ParsedMeshInstance_Ffi.set_geometryId(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedMeshInstance_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Awd2ParsedMeshInstance_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; Awd2ParsedMeshInstance_Ffi.set_name(this, raw); return value; }
	public var parentId(get, set):Int;

	inline function get_parentId():Int return Awd2ParsedMeshInstance_Ffi.get_parentId(this);

	inline function set_parentId(value:Int):Int { Awd2ParsedMeshInstance_Ffi.set_parentId(this, value); return value; }
}
