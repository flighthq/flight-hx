package flight._cpp;

private extern class ColladaSkinInfluence_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_skin_influence_joint") static function get_joint(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_skin_influence_joint") static function set_joint(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_collada_skin_influence_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_collada_skin_influence_weight") static function set_weight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ColladaSkinInfluence(cpp.Star<cpp.Void>) {
	public var joint(get, set):String;
	inline function get_joint():String { var raw = ColladaSkinInfluence_Ffi.get_joint(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaSkinInfluence_Ffi.freeString(raw); return value; }
	inline function set_joint(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaSkinInfluence_Ffi.set_joint(this, raw); return value; }
	public var weight(get, set):Float;

	inline function get_weight():Float return ColladaSkinInfluence_Ffi.get_weight(this);

	inline function set_weight(value:Float):Float { ColladaSkinInfluence_Ffi.set_weight(this, value); return value; }
}
