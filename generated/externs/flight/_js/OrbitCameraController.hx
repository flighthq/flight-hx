package flight._js;

abstract OrbitCameraController(Dynamic) {
	public var azimuth(get, set):Float;
	inline function get_azimuth():Float return untyped this["azimuth"];
	inline function set_azimuth(value:Float):Float return untyped this["azimuth"] = value;
	public var distance(get, set):Float;
	inline function get_distance():Float return untyped this["distance"];
	inline function set_distance(value:Float):Float return untyped this["distance"] = value;
	public var goalAzimuth(get, set):Float;
	inline function get_goalAzimuth():Float return untyped this["goalAzimuth"];
	inline function set_goalAzimuth(value:Float):Float return untyped this["goalAzimuth"] = value;
	public var goalDistance(get, set):Float;
	inline function get_goalDistance():Float return untyped this["goalDistance"];
	inline function set_goalDistance(value:Float):Float return untyped this["goalDistance"] = value;
	public var goalPolar(get, set):Float;
	inline function get_goalPolar():Float return untyped this["goalPolar"];
	inline function set_goalPolar(value:Float):Float return untyped this["goalPolar"] = value;
	public var maxDistance(get, set):Float;
	inline function get_maxDistance():Float return untyped this["maxDistance"];
	inline function set_maxDistance(value:Float):Float return untyped this["maxDistance"] = value;
	public var maxPolar(get, set):Float;
	inline function get_maxPolar():Float return untyped this["maxPolar"];
	inline function set_maxPolar(value:Float):Float return untyped this["maxPolar"] = value;
	public var minDistance(get, set):Float;
	inline function get_minDistance():Float return untyped this["minDistance"];
	inline function set_minDistance(value:Float):Float return untyped this["minDistance"] = value;
	public var minPolar(get, set):Float;
	inline function get_minPolar():Float return untyped this["minPolar"];
	inline function set_minPolar(value:Float):Float return untyped this["minPolar"] = value;
	public var polar(get, set):Float;
	inline function get_polar():Float return untyped this["polar"];
	inline function set_polar(value:Float):Float return untyped this["polar"] = value;
	public var smoothTime(get, set):Float;
	inline function get_smoothTime():Float return untyped this["smoothTime"];
	inline function set_smoothTime(value:Float):Float return untyped this["smoothTime"] = value;
}
