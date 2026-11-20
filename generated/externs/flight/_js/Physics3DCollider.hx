package flight._js;

abstract Physics3DCollider(Dynamic) {
	public var sensor(get, set):Bool;
	inline function get_sensor():Bool return untyped this.sensor;
	inline function set_sensor(value:Bool):Bool return untyped this.sensor = value;
}
