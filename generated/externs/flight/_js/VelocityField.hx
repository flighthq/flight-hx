package flight._js;

abstract VelocityField(Dynamic) {
	public var frameId(get, set):Int;
	inline function get_frameId():Int return untyped this.frameId;
	inline function set_frameId(value:Int):Int return untyped this.frameId = value;
}
