package flight._hl;

abstract Physics3DDebugGeometryOptions(hl.Bytes) {
	public var drawCentersOfMass(get, set):Bool;

	inline function get_drawCentersOfMass():Bool return this.getUI8(8) != 0;

	inline function set_drawCentersOfMass(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
	public var drawColliders(get, set):Bool;

	inline function get_drawColliders():Bool return this.getUI8(9) != 0;

	inline function set_drawColliders(value:Bool):Bool { this.setUI8(9, value ? 1 : 0); return value; }
	public var drawContacts(get, set):Bool;

	inline function get_drawContacts():Bool return this.getUI8(10) != 0;

	inline function set_drawContacts(value:Bool):Bool { this.setUI8(10, value ? 1 : 0); return value; }
	public var drawJoints(get, set):Bool;

	inline function get_drawJoints():Bool return this.getUI8(11) != 0;

	inline function set_drawJoints(value:Bool):Bool { this.setUI8(11, value ? 1 : 0); return value; }
	public var centerOfMassRadius(get, set):Single;

	inline function get_centerOfMassRadius():Single return this.getF32(0);

	inline function set_centerOfMassRadius(value:Single):Single { this.setF32(0, value); return value; }
	public var contactNormalLength(get, set):Single;

	inline function get_contactNormalLength():Single return this.getF32(4);

	inline function set_contactNormalLength(value:Single):Single { this.setF32(4, value); return value; }
}
