package flight._hl;

abstract OrbitCameraController(hl.Bytes) {
	public var azimuth(get, set):Float;

	inline function get_azimuth():Float return this.getF64(16);

	inline function set_azimuth(value:Float):Float { this.setF64(16, value); return value; }
	public var distance(get, set):Float;

	inline function get_distance():Float return this.getF64(24);

	inline function set_distance(value:Float):Float { this.setF64(24, value); return value; }
	public var goalAzimuth(get, set):Float;

	inline function get_goalAzimuth():Float return this.getF64(32);

	inline function set_goalAzimuth(value:Float):Float { this.setF64(32, value); return value; }
	public var goalDistance(get, set):Float;

	inline function get_goalDistance():Float return this.getF64(40);

	inline function set_goalDistance(value:Float):Float { this.setF64(40, value); return value; }
	public var goalPolar(get, set):Float;

	inline function get_goalPolar():Float return this.getF64(48);

	inline function set_goalPolar(value:Float):Float { this.setF64(48, value); return value; }
	public var maxDistance(get, set):Float;

	inline function get_maxDistance():Float return this.getF64(56);

	inline function set_maxDistance(value:Float):Float { this.setF64(56, value); return value; }
	public var maxPolar(get, set):Float;

	inline function get_maxPolar():Float return this.getF64(64);

	inline function set_maxPolar(value:Float):Float { this.setF64(64, value); return value; }
	public var minDistance(get, set):Float;

	inline function get_minDistance():Float return this.getF64(72);

	inline function set_minDistance(value:Float):Float { this.setF64(72, value); return value; }
	public var minPolar(get, set):Float;

	inline function get_minPolar():Float return this.getF64(80);

	inline function set_minPolar(value:Float):Float { this.setF64(80, value); return value; }
	public var polar(get, set):Float;

	inline function get_polar():Float return this.getF64(88);

	inline function set_polar(value:Float):Float { this.setF64(88, value); return value; }
	public var smoothTime(get, set):Float;

	inline function get_smoothTime():Float return this.getF64(96);

	inline function set_smoothTime(value:Float):Float { this.setF64(96, value); return value; }
}
