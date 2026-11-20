package flight._cpp;

private extern class Physics3DDebugGeometryOptions_Ffi {
	@:native("flight_get_physics3_ddebug_geometry_options_draw_centers_of_mass") static function get_drawCentersOfMass(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddebug_geometry_options_draw_centers_of_mass") static function set_drawCentersOfMass(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddebug_geometry_options_draw_colliders") static function get_drawColliders(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddebug_geometry_options_draw_colliders") static function set_drawColliders(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddebug_geometry_options_draw_contacts") static function get_drawContacts(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddebug_geometry_options_draw_contacts") static function set_drawContacts(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddebug_geometry_options_draw_joints") static function get_drawJoints(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddebug_geometry_options_draw_joints") static function set_drawJoints(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddebug_geometry_options_center_of_mass_radius") static function get_centerOfMassRadius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddebug_geometry_options_center_of_mass_radius") static function set_centerOfMassRadius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddebug_geometry_options_contact_normal_length") static function get_contactNormalLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddebug_geometry_options_contact_normal_length") static function set_contactNormalLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DDebugGeometryOptions(cpp.Star<cpp.Void>) {
	public var drawCentersOfMass(get, set):Bool;

	inline function get_drawCentersOfMass():Bool return Physics3DDebugGeometryOptions_Ffi.get_drawCentersOfMass(this);

	inline function set_drawCentersOfMass(value:Bool):Bool { Physics3DDebugGeometryOptions_Ffi.set_drawCentersOfMass(this, value); return value; }
	public var drawColliders(get, set):Bool;

	inline function get_drawColliders():Bool return Physics3DDebugGeometryOptions_Ffi.get_drawColliders(this);

	inline function set_drawColliders(value:Bool):Bool { Physics3DDebugGeometryOptions_Ffi.set_drawColliders(this, value); return value; }
	public var drawContacts(get, set):Bool;

	inline function get_drawContacts():Bool return Physics3DDebugGeometryOptions_Ffi.get_drawContacts(this);

	inline function set_drawContacts(value:Bool):Bool { Physics3DDebugGeometryOptions_Ffi.set_drawContacts(this, value); return value; }
	public var drawJoints(get, set):Bool;

	inline function get_drawJoints():Bool return Physics3DDebugGeometryOptions_Ffi.get_drawJoints(this);

	inline function set_drawJoints(value:Bool):Bool { Physics3DDebugGeometryOptions_Ffi.set_drawJoints(this, value); return value; }
	public var centerOfMassRadius(get, set):Float;

	inline function get_centerOfMassRadius():Float return Physics3DDebugGeometryOptions_Ffi.get_centerOfMassRadius(this);

	inline function set_centerOfMassRadius(value:Float):Float { Physics3DDebugGeometryOptions_Ffi.set_centerOfMassRadius(this, value); return value; }
	public var contactNormalLength(get, set):Float;

	inline function get_contactNormalLength():Float return Physics3DDebugGeometryOptions_Ffi.get_contactNormalLength(this);

	inline function set_contactNormalLength(value:Float):Float { Physics3DDebugGeometryOptions_Ffi.set_contactNormalLength(this, value); return value; }
}
