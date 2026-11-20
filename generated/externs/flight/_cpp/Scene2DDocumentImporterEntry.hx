package flight._cpp;

private extern class Scene2DDocumentImporterEntry_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_scene2_ddocument_importer_entry_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_scene2_ddocument_importer_entry_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Scene2DDocumentImporterEntry(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Scene2DDocumentImporterEntry_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Scene2DDocumentImporterEntry_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; Scene2DDocumentImporterEntry_Ffi.set_kind(this, raw); return value; }
}
