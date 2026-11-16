package flight._cpp;

private extern class Physics3DRotationalCcdEnvelope_Ffi {
	@:native("flight_get_physics3_drotational_ccd_envelope_angular_travel") static function get_angularTravel(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_drotational_ccd_envelope_angular_travel") static function set_angularTravel(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_drotational_ccd_envelope_sample_count") static function get_sampleCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_drotational_ccd_envelope_sample_count") static function set_sampleCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_drotational_ccd_envelope_max_angular_increment") static function get_maxAngularIncrement(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_drotational_ccd_envelope_max_angular_increment") static function set_maxAngularIncrement(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_drotational_ccd_envelope_max_point_arc_travel") static function get_maxPointArcTravel(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_drotational_ccd_envelope_max_point_arc_travel") static function set_maxPointArcTravel(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_drotational_ccd_envelope_target_increment_met") static function get_targetIncrementMet(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_drotational_ccd_envelope_target_increment_met") static function set_targetIncrementMet(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DRotationalCcdEnvelope(cpp.Star<cpp.Void>) {
	public var angularTravel(get, set):Single;

	inline function get_angularTravel():Single return Physics3DRotationalCcdEnvelope_Ffi.get_angularTravel(this);

	inline function set_angularTravel(value:Single):Single { Physics3DRotationalCcdEnvelope_Ffi.set_angularTravel(this, value); return value; }
	public var sampleCount(get, set):Int;

	inline function get_sampleCount():Int return Physics3DRotationalCcdEnvelope_Ffi.get_sampleCount(this);

	inline function set_sampleCount(value:Int):Int { Physics3DRotationalCcdEnvelope_Ffi.set_sampleCount(this, value); return value; }
	public var maxAngularIncrement(get, set):Single;

	inline function get_maxAngularIncrement():Single return Physics3DRotationalCcdEnvelope_Ffi.get_maxAngularIncrement(this);

	inline function set_maxAngularIncrement(value:Single):Single { Physics3DRotationalCcdEnvelope_Ffi.set_maxAngularIncrement(this, value); return value; }
	public var maxPointArcTravel(get, set):Single;

	inline function get_maxPointArcTravel():Single return Physics3DRotationalCcdEnvelope_Ffi.get_maxPointArcTravel(this);

	inline function set_maxPointArcTravel(value:Single):Single { Physics3DRotationalCcdEnvelope_Ffi.set_maxPointArcTravel(this, value); return value; }
	public var targetIncrementMet(get, set):Bool;

	inline function get_targetIncrementMet():Bool return Physics3DRotationalCcdEnvelope_Ffi.get_targetIncrementMet(this);

	inline function set_targetIncrementMet(value:Bool):Bool { Physics3DRotationalCcdEnvelope_Ffi.set_targetIncrementMet(this, value); return value; }
}
