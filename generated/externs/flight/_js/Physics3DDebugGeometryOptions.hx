package flight._js;

abstract Physics3DDebugGeometryOptions(Dynamic) {
	public var drawCentersOfMass(get, set):Bool;
	inline function get_drawCentersOfMass():Bool return untyped this.drawCentersOfMass;
	inline function set_drawCentersOfMass(value:Bool):Bool return untyped this.drawCentersOfMass = value;
	public var drawColliders(get, set):Bool;
	inline function get_drawColliders():Bool return untyped this.drawColliders;
	inline function set_drawColliders(value:Bool):Bool return untyped this.drawColliders = value;
	public var drawContacts(get, set):Bool;
	inline function get_drawContacts():Bool return untyped this.drawContacts;
	inline function set_drawContacts(value:Bool):Bool return untyped this.drawContacts = value;
	public var drawJoints(get, set):Bool;
	inline function get_drawJoints():Bool return untyped this.drawJoints;
	inline function set_drawJoints(value:Bool):Bool return untyped this.drawJoints = value;
	public var centerOfMassRadius(get, set):Float;
	inline function get_centerOfMassRadius():Float return untyped this.centerOfMassRadius;
	inline function set_centerOfMassRadius(value:Float):Float return untyped this.centerOfMassRadius = value;
	public var contactNormalLength(get, set):Float;
	inline function get_contactNormalLength():Float return untyped this.contactNormalLength;
	inline function set_contactNormalLength(value:Float):Float return untyped this.contactNormalLength = value;
}
