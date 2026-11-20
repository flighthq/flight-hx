package flight._js;

abstract CollisionTestExplanation3D(Dynamic) {
	public var overlapping(get, set):Bool;
	inline function get_overlapping():Bool return untyped this.overlapping;
	inline function set_overlapping(value:Bool):Bool return untyped this.overlapping = value;
}
