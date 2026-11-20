package flight._cpp;

private extern class GlyphAtlasEntryGuardNotice_Ffi {
	@:native("flight_get_glyph_atlas_entry_guard_notice_subject") static function get_subject(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_guard_notice_subject") static function set_subject(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_glyph_atlas_entry_guard_notice_repack_count") static function get_repackCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_glyph_atlas_entry_guard_notice_repack_count") static function set_repackCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GlyphAtlasEntryGuardNotice(cpp.Star<cpp.Void>) {
	public var subject(get, set):Int;

	inline function get_subject():Int return GlyphAtlasEntryGuardNotice_Ffi.get_subject(this);

	inline function set_subject(value:Int):Int { GlyphAtlasEntryGuardNotice_Ffi.set_subject(this, value); return value; }
	public var repackCount(get, set):Int;

	inline function get_repackCount():Int return GlyphAtlasEntryGuardNotice_Ffi.get_repackCount(this);

	inline function set_repackCount(value:Int):Int { GlyphAtlasEntryGuardNotice_Ffi.set_repackCount(this, value); return value; }
}
