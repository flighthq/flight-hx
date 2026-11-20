package flight._cpp;

private extern class Physics3DJointExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_physics3_djoint_explanation_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_physics3_djoint_explanation_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_physics3_djoint_explanation_index") static function get_index(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_djoint_explanation_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_djoint_explanation_has_solver") static function get_hasSolver(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_djoint_explanation_has_solver") static function set_hasSolver(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_djoint_explanation_bodies_resolvable") static function get_bodiesResolvable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_djoint_explanation_bodies_resolvable") static function set_bodiesResolvable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DJointExplanation(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Physics3DJointExplanation_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Physics3DJointExplanation_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; Physics3DJointExplanation_Ffi.set_kind(this, raw); return value; }
	public var index(get, set):Int;

	inline function get_index():Int return Physics3DJointExplanation_Ffi.get_index(this);

	inline function set_index(value:Int):Int { Physics3DJointExplanation_Ffi.set_index(this, value); return value; }
	public var hasSolver(get, set):Bool;

	inline function get_hasSolver():Bool return Physics3DJointExplanation_Ffi.get_hasSolver(this);

	inline function set_hasSolver(value:Bool):Bool { Physics3DJointExplanation_Ffi.set_hasSolver(this, value); return value; }
	public var bodiesResolvable(get, set):Bool;

	inline function get_bodiesResolvable():Bool return Physics3DJointExplanation_Ffi.get_bodiesResolvable(this);

	inline function set_bodiesResolvable(value:Bool):Bool { Physics3DJointExplanation_Ffi.set_bodiesResolvable(this, value); return value; }
}
