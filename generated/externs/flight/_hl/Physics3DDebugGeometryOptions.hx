package flight._hl;

abstract Physics3DDebugGeometryOptions(hl.Bytes) {
	public var drawCentersOfMass(get, set):Bool;

	inline function get_drawCentersOfMass():Bool return this.getUI8(16) != 0;

	inline function set_drawCentersOfMass(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var drawColliders(get, set):Bool;

	inline function get_drawColliders():Bool return this.getUI8(17) != 0;

	inline function set_drawColliders(value:Bool):Bool { this.setUI8(17, value ? 1 : 0); return value; }
	public var drawContacts(get, set):Bool;

	inline function get_drawContacts():Bool return this.getUI8(18) != 0;

	inline function set_drawContacts(value:Bool):Bool { this.setUI8(18, value ? 1 : 0); return value; }
	public var drawJoints(get, set):Bool;

	inline function get_drawJoints():Bool return this.getUI8(19) != 0;

	inline function set_drawJoints(value:Bool):Bool { this.setUI8(19, value ? 1 : 0); return value; }
	public var centerOfMassRadius(get, set):Float;

	inline function get_centerOfMassRadius():Float return this.getF64(0);

	inline function set_centerOfMassRadius(value:Float):Float { this.setF64(0, value); return value; }
	public var contactNormalLength(get, set):Float;

	inline function get_contactNormalLength():Float return this.getF64(8);

	inline function set_contactNormalLength(value:Float):Float { this.setF64(8, value); return value; }
}
