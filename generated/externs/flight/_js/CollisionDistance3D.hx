package flight._js;

abstract CollisionDistance3D(Dynamic) {
	public var distance(get, set):Float;
	inline function get_distance():Float return untyped this.distance;
	inline function set_distance(value:Float):Float return untyped this.distance = value;
	public var directionX(get, set):Float;
	inline function get_directionX():Float return untyped this.directionX;
	inline function set_directionX(value:Float):Float return untyped this.directionX = value;
	public var directionY(get, set):Float;
	inline function get_directionY():Float return untyped this.directionY;
	inline function set_directionY(value:Float):Float return untyped this.directionY = value;
	public var directionZ(get, set):Float;
	inline function get_directionZ():Float return untyped this.directionZ;
	inline function set_directionZ(value:Float):Float return untyped this.directionZ = value;
	public var pointAX(get, set):Float;
	inline function get_pointAX():Float return untyped this.pointAX;
	inline function set_pointAX(value:Float):Float return untyped this.pointAX = value;
	public var pointAY(get, set):Float;
	inline function get_pointAY():Float return untyped this.pointAY;
	inline function set_pointAY(value:Float):Float return untyped this.pointAY = value;
	public var pointAZ(get, set):Float;
	inline function get_pointAZ():Float return untyped this.pointAZ;
	inline function set_pointAZ(value:Float):Float return untyped this.pointAZ = value;
	public var pointBX(get, set):Float;
	inline function get_pointBX():Float return untyped this.pointBX;
	inline function set_pointBX(value:Float):Float return untyped this.pointBX = value;
	public var pointBY(get, set):Float;
	inline function get_pointBY():Float return untyped this.pointBY;
	inline function set_pointBY(value:Float):Float return untyped this.pointBY = value;
	public var pointBZ(get, set):Float;
	inline function get_pointBZ():Float return untyped this.pointBZ;
	inline function set_pointBZ(value:Float):Float return untyped this.pointBZ = value;
	public var overlapping(get, set):Bool;
	inline function get_overlapping():Bool return untyped this.overlapping;
	inline function set_overlapping(value:Bool):Bool return untyped this.overlapping = value;
}
