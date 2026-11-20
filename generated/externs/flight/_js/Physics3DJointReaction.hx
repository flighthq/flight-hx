package flight._js;

abstract Physics3DJointReaction(Dynamic) {
	public var forceX(get, set):Float;
	inline function get_forceX():Float return untyped this.forceX;
	inline function set_forceX(value:Float):Float return untyped this.forceX = value;
	public var forceY(get, set):Float;
	inline function get_forceY():Float return untyped this.forceY;
	inline function set_forceY(value:Float):Float return untyped this.forceY = value;
	public var forceZ(get, set):Float;
	inline function get_forceZ():Float return untyped this.forceZ;
	inline function set_forceZ(value:Float):Float return untyped this.forceZ = value;
	public var torqueX(get, set):Float;
	inline function get_torqueX():Float return untyped this.torqueX;
	inline function set_torqueX(value:Float):Float return untyped this.torqueX = value;
	public var torqueY(get, set):Float;
	inline function get_torqueY():Float return untyped this.torqueY;
	inline function set_torqueY(value:Float):Float return untyped this.torqueY = value;
	public var torqueZ(get, set):Float;
	inline function get_torqueZ():Float return untyped this.torqueZ;
	inline function set_torqueZ(value:Float):Float return untyped this.torqueZ = value;
}
