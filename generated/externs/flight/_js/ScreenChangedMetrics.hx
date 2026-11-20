package flight._js;

abstract ScreenChangedMetrics(Dynamic) {
	public var bounds(get, set):Bool;
	inline function get_bounds():Bool return untyped this.bounds;
	inline function set_bounds(value:Bool):Bool return untyped this.bounds = value;
	public var workArea(get, set):Bool;
	inline function get_workArea():Bool return untyped this.workArea;
	inline function set_workArea(value:Bool):Bool return untyped this.workArea = value;
	public var scaleFactor(get, set):Bool;
	inline function get_scaleFactor():Bool return untyped this.scaleFactor;
	inline function set_scaleFactor(value:Bool):Bool return untyped this.scaleFactor = value;
	public var orientation(get, set):Bool;
	inline function get_orientation():Bool return untyped this.orientation;
	inline function set_orientation(value:Bool):Bool return untyped this.orientation = value;
}
